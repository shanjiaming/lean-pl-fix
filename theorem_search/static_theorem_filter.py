import json
import os
import re
import argparse
from pathlib import Path
import traceback
import glob

# Define the base path for the mathlib4 source code
MATHLIB_BASE_PATH = "/home/matheye/anaconda3/lib/python3.12/site-packages/lean_interact/cache/tmp_projects/v4.19.0-rc2/f2715bd81473367430cfb34866e811377a9add649dc367bc7031a837d7139e8c/.lake/packages/mathlib"

def module_to_path(module_name: str, base_path: str) -> Path | None:
    """Converts a Lean module name (e.g., Mathlib.Data.Nat.Basic) to a file path."""
    if not module_name or not isinstance(module_name, str):
        return None
    try:
        parts = module_name.split('.')
        if any(not part for part in parts):
            return None
        file_path = Path(base_path).joinpath(*parts).with_suffix('.lean')
        return file_path if file_path.exists() else None
    except ValueError as e:
        print(f"Warning: Could not form path for module '{module_name}': {e}")
        return None
    except Exception as e:
        print(f"Warning: Error resolving path for module '{module_name}': {e}")
        return None

def extract_theorems_from_file(file_path: Path) -> set[str]:
    """Extracts theorem and lemma names declared in a Lean file using regex, with namespace tracking."""
    theorems = set()
    theorem_pattern = re.compile(r"^\s*(?:noncomputable\s+|local\s+)?(?:theorem|lemma)\s+([\w.]+)")
    namespace_pattern = re.compile(r"^\s*namespace\s+([\w.]+)")
    end_pattern = re.compile(r"^\s*end(?:\s+([\w.]+))?")
    namespace_stack = []
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            for line in f:
                ns_match = namespace_pattern.match(line)
                if ns_match:
                    namespace_stack.append(ns_match.group(1))
                    continue
                end_match = end_pattern.match(line)
                if end_match:
                    if namespace_stack:
                        # 如果end带名字，确保和栈顶一致才pop
                        if end_match.group(1) is None or end_match.group(1) == namespace_stack[-1]:
                            namespace_stack.pop()
                    continue
                thm_match = theorem_pattern.match(line)
                if thm_match:
                    name = thm_match.group(1)
                    if namespace_stack and not name.startswith(namespace_stack[-1] + "."):
                        full_name = '.'.join(namespace_stack + [name])
                    else:
                        full_name = name
                    theorems.add(full_name)
    except Exception as e:
        print(f"Error reading or parsing file {file_path}: {e}")
    return theorems

def process_single_json(input_json_path: str, theorems_output_dir: str, modules_output_dir: str, json_output_dir: str):
    """Processes a single input JSON file and saves theorems to one file and modules to another."""
    print(f"\n--- Processing file: {input_json_path} ---")
    try:
        with open(input_json_path, 'r') as f:
            identifier_to_lib_module = json.load(f)

        # 1. Get unique library module paths
        candidate_modules = set(v for v in identifier_to_lib_module.values() if v)

        # 2. Find theorems declared in each library file via static analysis
        theorems_found_in_module = {}
        scanned_module_count = 0
        modules_not_found = []
        for module_name in candidate_modules:
            scanned_module_count += 1
            file_path = module_to_path(module_name, MATHLIB_BASE_PATH)
            if file_path:
                declared_theorems = extract_theorems_from_file(file_path)
                if declared_theorems:
                    theorems_found_in_module[module_name] = declared_theorems
            else:
                modules_not_found.append(module_name)

        # 3. Filter libraries: Keep only those modules where theorems were found
        selected_modules = set(theorems_found_in_module.keys())

        # 4. Collect all theorems found in the selected modules' files
        final_theorems = set()
        for theorems in theorems_found_in_module.values():
            final_theorems.update(theorems)
        print(f"Collected {len(final_theorems)} unique theorem/lemma names from selected modules for {Path(input_json_path).name}.")

        # 5. Save outputs
        input_filename_stem = Path(input_json_path).stem
        
        # Save theorems to a JSON file in the format compatible with extract_have.py
        # (a simple list of theorem names)
        os.makedirs(theorems_output_dir, exist_ok=True)
        theorems_output_path = os.path.join(theorems_output_dir, f"{input_filename_stem}.json")
        with open(theorems_output_path, 'w') as f:
            json.dump(sorted(list(final_theorems)), f, indent=2)
                
        # Save modules to a JSON file
        os.makedirs(modules_output_dir, exist_ok=True)
        modules_output_path = os.path.join(modules_output_dir, f"{input_filename_stem}.json")
        with open(modules_output_path, 'w') as f:
            json.dump(sorted(list(selected_modules)), f, indent=2)
        
        # Also save the original JSON output for backward compatibility
        original_output_data = {
            "selected_library_modules": sorted(list(selected_modules)),
            "theorems": sorted(list(final_theorems))
        }
        os.makedirs(json_output_dir, exist_ok=True)
        json_output_path = os.path.join(json_output_dir, f"{input_filename_stem}_static_filtered.json")
        with open(json_output_path, 'w') as f:
            json.dump(original_output_data, f, indent=2)

        print(f"Successfully processed {input_json_path}")
        print(f"Theorems saved to: {theorems_output_path}")
        print(f"Modules saved to: {modules_output_path}")
        return True

    except FileNotFoundError:
         print(f"Error: Input file not found at {input_json_path}")
         return False
    except json.JSONDecodeError:
         print(f"Error: Could not parse JSON from {input_json_path}")
         return False
    except Exception as e:
        print(f"An unexpected error occurred while processing {input_json_path}: {e}")
        traceback.print_exc()
        return False

def main():
    parser = argparse.ArgumentParser(description='Filter theorems based on static analysis and save to separate folders.')
    parser.add_argument('--input-dir', required=True, help='Directory containing input JSON files (identifier -> library_module_path).')
    parser.add_argument('--output-dir', required=True, help='Base directory to save output files.')
    args = parser.parse_args()

    # Find all JSON files in the input directory
    json_files = sorted(glob.glob(os.path.join(args.input_dir, '*.json')))
    if not json_files:
        print(f"No JSON files found in directory: {args.input_dir}")
        return
        
    print(f"Found {len(json_files)} JSON files to process in {args.input_dir}.")
    success_count = 0
    fail_count = 0

    # Create output directories
    theorems_output_dir = os.path.join(args.output_dir, "static_theorems")
    modules_output_dir = os.path.join(args.output_dir, "static_modules")
    json_output_dir = os.path.join(args.output_dir, "static_filtered_theorems_output")
    
    # Process each JSON file
    for input_path in json_files:
        if process_single_json(input_path, theorems_output_dir, modules_output_dir, json_output_dir):
            success_count += 1
        else:
            fail_count += 1
            
    print(f"\n--- Batch processing summary ---")
    print(f"Successfully processed: {success_count} files.")
    print(f"Failed to process: {fail_count} files.")
    print(f"Theorems saved in: {theorems_output_dir}")
    print(f"Modules saved in: {modules_output_dir}")
    print(f"Combined data saved in: {json_output_dir}")

if __name__ == "__main__":
    main() 
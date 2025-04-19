import json
import os
import re
import argparse
from pathlib import Path
import traceback
import glob # Added for directory processing

# Define the base path for the mathlib4 source code
MATHLIB_BASE_PATH = "./Goedel-Prover/mathlib4/"

def module_to_path(module_name: str, base_path: str) -> Path | None:
    """Converts a Lean module name (e.g., Mathlib.Data.Nat.Basic) to a file path."""
    # Handle potential empty or invalid module names
    if not module_name or not isinstance(module_name, str):
        # print(f"Warning: Invalid module name encountered: {module_name}")
        return None
    try:
        parts = module_name.split('.')
        # Ensure no empty parts, which could lead to incorrect paths like //
        if any(not part for part in parts):
            # print(f"Warning: Module name '{module_name}' contains empty parts after splitting.")
            return None
        file_path = Path(base_path).joinpath(*parts).with_suffix('.lean')
        # Use resolve() to get the absolute path and check existence robustly
        # return file_path.resolve(strict=True) # strict=True checks existence
        return file_path if file_path.exists() else None
    except ValueError as e:
        # Handle invalid characters in path components if any
        print(f"Warning: Could not form path for module '{module_name}': {e}")
        return None
    except Exception as e:
        # Catch other potential exceptions during path resolution
        print(f"Warning: Error resolving path for module '{module_name}': {e}")
        return None

def extract_theorems_from_file(file_path: Path) -> set[str]:
    """Extracts theorem and lemma names declared in a Lean file using regex."""
    theorems = set()
    # Regex to find theorem/lemma declarations, possibly preceded by noncomputable or local
    # Capture the name right after 'theorem' or 'lemma'
    # Reverted regex to be less strict about characters following the name
    theorem_pattern = re.compile(r"^\s*(?:noncomputable\s+|local\s+)?(?:theorem|lemma)\s+([\w.]+)", re.MULTILINE)
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()
        
        for match in theorem_pattern.finditer(content):
            theorems.add(match.group(1))
    except Exception as e:
        print(f"Error reading or parsing file {file_path}: {e}")
    return theorems

def process_single_json(input_json_path: str, output_json_path: str):
    """Processes a single input JSON file and saves the filtered theorems."""
    print(f"\n--- Processing file: {input_json_path} ---")
    try:
        # print(f"Loading input JSON: {input_json_path}")
        with open(input_json_path, 'r') as f:
            identifier_to_lib_module = json.load(f)
        # print(f"Loaded {len(identifier_to_lib_module)} identifier mappings.")

        # 1. Get unique library module paths
        candidate_modules = set(v for v in identifier_to_lib_module.values() if v) # Filter out None/empty values
        # print(f"Found {len(candidate_modules)} unique candidate library modules.")

        # 2. Find theorems declared in each library file via static analysis
        theorems_found_in_module = {} # module_name -> set of theorem names found
        # print("Scanning library files for theorem declarations...")
        scanned_module_count = 0
        modules_not_found = []
        for module_name in candidate_modules:
            scanned_module_count += 1
            # print(f"Scanning [{scanned_module_count}/{len(candidate_modules)}]: {module_name}", end='\r')
            file_path = module_to_path(module_name, MATHLIB_BASE_PATH)
            if file_path:
                declared_theorems = extract_theorems_from_file(file_path)
                if declared_theorems:
                    theorems_found_in_module[module_name] = declared_theorems
            else:
                modules_not_found.append(module_name)
        # print(f"\nFinished scanning. Found theorems in {len(theorems_found_in_module)} modules.")
        # if modules_not_found:
        #     print(f"Warning: Source files not found for {len(modules_not_found)} modules (e.g., {modules_not_found[:3]}{'...' if len(modules_not_found)>3 else ''}).")


        # 3. Filter libraries: Keep only those modules where theorems were found
        selected_modules = set(theorems_found_in_module.keys())
        # print(f"Selected {len(selected_modules)} library modules containing statically found theorems.")

        # 4. Collect all theorems found in the selected modules' files
        final_theorems = set()
        for theorems in theorems_found_in_module.values():
            final_theorems.update(theorems)
        print(f"Collected {len(final_theorems)} unique theorem/lemma names from selected modules for {Path(input_json_path).name}.")

        # 5. Prepare and save output
        output_data = {
            "selected_library_modules": sorted(list(selected_modules)),
            "theorems": sorted(list(final_theorems))
        }

        # Ensure output directory exists before saving
        output_dir = os.path.dirname(output_json_path)
        if output_dir:
            os.makedirs(output_dir, exist_ok=True)

        # print(f"Saving results to {output_json_path}")
        with open(output_json_path, 'w') as f:
            json.dump(output_data, f, indent=2)

        # print(f"Successfully processed {input_json_path}")
        return True # Indicate success

    except FileNotFoundError:
         print(f"Error: Input file not found at {input_json_path}")
         return False
    except json.JSONDecodeError:
         print(f"Error: Could not parse JSON from {input_json_path}")
         return False
    except Exception as e:
        print(f"An unexpected error occurred while processing {input_json_path}: {e}")
        traceback.print_exc()
        return False # Indicate failure

def main():
    parser = argparse.ArgumentParser(description='Filter theorems based on static analysis of library files. Supports directory batch processing.')
    parser.add_argument('--input-dir', required=True, help='Directory containing input JSON files (identifier -> library_module_path).')
    parser.add_argument('--output-dir', required=True, help='Directory to save the output JSON files.')
    args = parser.parse_args()

    # Find all JSON files in the input directory
    json_files = sorted(glob.glob(os.path.join(args.input_dir, '*.json')))
    if not json_files:
        print(f"No JSON files found in directory: {args.input_dir}")
        return
        
    print(f"Found {len(json_files)} JSON files to process in {args.input_dir}.")
    success_count = 0
    fail_count = 0

    # Ensure output directory exists
    os.makedirs(args.output_dir, exist_ok=True)

    # Process each JSON file
    for input_path in json_files:
        input_filename_stem = Path(input_path).stem
        output_filename = f"{input_filename_stem}_static_filtered.json" # Add suffix to distinguish output
        output_path = os.path.join(args.output_dir, output_filename)
        
        if process_single_json(input_path, output_path):
            success_count += 1
        else:
            fail_count += 1
            
    print(f"\n--- Batch processing summary ---")
    print(f"Successfully processed: {success_count} files.")
    print(f"Failed to process: {fail_count} files.")
    print(f"Output saved in: {args.output_dir}")

if __name__ == "__main__":
    main() 
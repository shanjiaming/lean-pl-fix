import json
import os
import re
import argparse
from pathlib import Path
import traceback
import glob

# Define the base path for the mathlib4 source code
MATHLIB_BASE_PATH = "~/miniconda3/lib/python3.13/site-packages/lean_interact/cache/tmp_projects/v4.21.0-rc3/1e05fd82f2c4fc489117f059ac17237437a6dbc201ad266e76e4f63abf7f4e88/.lake/packages/mathlib"

def module_to_path(module_name: str, base_path: str) -> Path | None:
    """Converts a Lean module name (e.g., Mathlib.Data.Nat.Basic) to a file path."""
    if not module_name or not isinstance(module_name, str):
        return None
    try:
        parts = module_name.split('.')
        if any(not part for part in parts):
            return None
        # Properly expand user path (tilde) before creating Path object
        expanded_base = Path(base_path).expanduser()
        file_path = expanded_base.joinpath(*parts).with_suffix('.lean')
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

def process_single_json(input_json_path: str, output_dir: str | None = None):
    """
    Processes a single input JSON file.
    If output_dir is provided, saves theorems/modules to separate files there.
    Otherwise, saves a single 'related_theorems.json' in the same directory as the input file.
    """
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

        # 3. Collect all theorems found in the selected modules' files
        final_theorems = set()
        for theorems in theorems_found_in_module.values():
            final_theorems.update(theorems)
        print(f"Collected {len(final_theorems)} unique theorem/lemma names from {Path(input_json_path).name}.")

        # 4. Save outputs based on whether an output_dir is provided
        if output_dir:
            # Legacy behavior: save to multiple subdirectories
            selected_modules = set(theorems_found_in_module.keys())
            input_filename_stem = Path(input_json_path).stem
            
            theorems_output_dir = os.path.join(output_dir, "static_theorems")
            os.makedirs(theorems_output_dir, exist_ok=True)
            theorems_output_path = os.path.join(theorems_output_dir, f"{input_filename_stem}.json")
            with open(theorems_output_path, 'w') as f:
                json.dump(sorted(list(final_theorems)), f, indent=2)
            
            modules_output_dir = os.path.join(output_dir, "static_modules")
            os.makedirs(modules_output_dir, exist_ok=True)
            modules_output_path = os.path.join(modules_output_dir, f"{input_filename_stem}.json")
            with open(modules_output_path, 'w') as f:
                json.dump(sorted(list(selected_modules)), f, indent=2)

            json_output_dir = os.path.join(output_dir, "static_filtered_theorems_output")
            os.makedirs(json_output_dir, exist_ok=True)
            json_output_path = os.path.join(json_output_dir, f"{input_filename_stem}_static_filtered.json")
            with open(json_output_path, 'w') as f:
                json.dump({
                    "selected_library_modules": sorted(list(selected_modules)),
                    "theorems": sorted(list(final_theorems))
                }, f, indent=2)

            print(f"Successfully processed {input_json_path}")
            print(f"Theorems saved to: {theorems_output_path}")
            print(f"Modules saved to: {modules_output_path}")

        else:
            # New behavior: save a single related_theorems.json file
            input_dir = os.path.dirname(input_json_path)
            output_path = os.path.join(input_dir, "related_theorems.json")
            with open(output_path, 'w') as f:
                json.dump(sorted(list(final_theorems)), f, indent=2)
            print(f"Successfully processed and saved results to: {output_path}")

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
    parser = argparse.ArgumentParser(description='Generates related_theorems.json for a given problem by statically analyzing its dependencies.')
    parser.add_argument('--dataset', required=True, help='The dataset name (e.g., "demo", "minif2f").')
    parser.add_argument('--problem', required=True, help='The problem ID (e.g., "demo_complex_p1").')
    args = parser.parse_args()

    # Construct the path to the input file based on dataset and problem
    base_path = "decomposition_results"
    problem_dir = os.path.join(base_path, args.dataset, "decomposed", args.problem)
    input_file = os.path.join(problem_dir, "identifier_to_module_map.json")

    if not os.path.exists(input_file):
        print(f"Error: Input file not found at {input_file}")
        print("Please run the 'collectpath.py' script first for this problem.")
        return

    print(f"Processing input file: {input_file}")
    
    # By passing None for output_dir, process_single_json will save 
    # 'related_theorems.json' in the same directory as the input file.
    if process_single_json(input_file, None):
        print(f"\n--- Successfully completed processing for {args.dataset}/{args.problem} ---")
    else:
        print(f"\n--- Failed to process {args.dataset}/{args.problem} ---")

if __name__ == "__main__":
    main() 
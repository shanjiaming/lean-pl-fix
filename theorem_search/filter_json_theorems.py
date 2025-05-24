import json
import os
import argparse
import re
import traceback
from lean_interact_api import repl # Use the new API

def check_theorem_type(theorem_name):
    """Uses #check to get the type of a declaration."""
    if not repl.running:
        print("Warning: REPL not running in check_theorem_type. Attempting to start.")
        if not repl.start():
             print("Error: Failed to start REPL.")
             return None # Indicate failure

    check_cmd = f'#check {theorem_name}'
    try:
        # Use run which gives string output suitable for #check parsing
        success, output_str = repl.run(check_cmd)
        
        # Tolerate 'unknown identifier' errors silently
        if not success and "unknown identifier" in output_str:
            return None 

        if success and output_str:
            # Example output: '#check Nat.add : Nat → Nat → Nat' or error messages
            # Need robust parsing - look for the line starting with #check
            lines = output_str.splitlines()
            check_line = None
            for line in lines:
                 # Handle potential prompts or echoes before the actual check line
                 if line.strip().startswith(f'#check {theorem_name}'):
                      check_line = line
                      break
                 # Handle lean_interact response format (less likely with run, but just in case)
                 if f'"{theorem_name}"' in line and ':' in line:
                     check_line = line # Adapt parsing if needed based on actual output
            
            if check_line:
                match = re.search(r':(.*)', check_line) # Find the first colon
                if match:
                    type_str = match.group(1).strip()
                    # Clean up potential artifacts if needed
                    type_str = type_str.split('\n')[0] # Take only first line of type if multi-line
                    return type_str
            # Fallback or error logging if parsing fails
            # print(f"Could not parse type for {theorem_name} from output: {output_str}")

    except Exception as e:
        print(f"Exception checking theorem {theorem_name}: {e}")
        traceback.print_exc() # Print traceback for debugging
    return None # Indicate failure or not found


def is_theorem_like(type_string):
    """Checks if the type string likely represents a theorem or lemma (contains Prop)."""
    return type_string is not None and "Prop" in type_string

def main():
    parser = argparse.ArgumentParser(description='Filter theorem lists based on verification and library presence.')
    parser.add_argument('input_json', help='Path to the input JSON file (identifier -> library_path).')
    parser.add_argument('output_json', help='Path to the output JSON file.')
    args = parser.parse_args()

    # Start REPL globally if not already running
    if not repl.running:
         print("Starting Lean REPL...")
         if not repl.start():
              print("Fatal: Could not start Lean REPL. Exiting.")
              sys.exit(1) # Use sys.exit

    try:
        print(f"Loading input JSON: {args.input_json}")
        with open(args.input_json, 'r') as f:
            identifier_to_lib = json.load(f)
        print(f"Loaded {len(identifier_to_lib)} identifiers.")

        # 1. Get unique library paths from values
        candidate_libraries = set(identifier_to_lib.values())
        print(f"Found {len(candidate_libraries)} unique candidate libraries.")

        # 2. Verify identifiers and store theorems with their *original* library path
        verified_theorems = {} # theorem_name -> original_library_path
        print("Verifying identifiers...")
        count = 0
        total = len(identifier_to_lib)
        for identifier, lib_path in identifier_to_lib.items():
            count += 1
            # Use carriage return for progress update without flooding logs
            print(f"Checking [{count}/{total}]: {identifier.ljust(50)}", end='\r') 
            theorem_type = check_theorem_type(identifier)
            if is_theorem_like(theorem_type):
                verified_theorems[identifier] = lib_path
        print(f"\nVerification complete. Found {len(verified_theorems)} theorem-like declarations.") # Newline after progress


        # 3. Filter libraries: Keep only those libraries that are the source for at least one verified theorem
        selected_libraries = set()
        verified_theorem_libs = set(verified_theorems.values())
        for lib in candidate_libraries:
            if lib in verified_theorem_libs:
                selected_libraries.add(lib)
        print(f"Selected {len(selected_libraries)} libraries containing verified theorems.")

        # 4. Collect final theorems: Only those whose library was selected
        final_theorems = set()
        for theorem, lib_path in verified_theorems.items():
            if lib_path in selected_libraries:
                final_theorems.add(theorem)
        print(f"Collected {len(final_theorems)} theorems from selected libraries.")

        # 5. Prepare and save output
        output_data = {
            "selected_libraries": sorted(list(selected_libraries)),
            "theorems": sorted(list(final_theorems))
        }

        output_dir = os.path.dirname(args.output_json)
        if output_dir:
            os.makedirs(output_dir, exist_ok=True)

        print(f"Saving results to {args.output_json}")
        with open(args.output_json, 'w') as f:
            json.dump(output_data, f, indent=2)

        print("Processing finished successfully.")
        return 0 # Indicate success

    except FileNotFoundError:
         print(f"Error: Input file not found at {args.input_json}")
         return 1
    except json.JSONDecodeError:
         print(f"Error: Could not parse JSON from {args.input_json}")
         return 1
    except Exception as e:
        print(f"An unexpected error occurred: {e}")
        traceback.print_exc() # Added for debugging
        return 1
    finally:
        # Ensure REPL is stopped
        if repl.running:
            print("Closing Lean REPL...")
            repl.end()

if __name__ == "__main__":
    import sys 
    # Make sure to source lean.sh before running this script from the command line
    sys.exit(main()) 
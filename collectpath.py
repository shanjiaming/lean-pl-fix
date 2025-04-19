from lean_api import repl
import re
import json
import time
import argparse
import os
import glob
from pathlib import Path

def extract_identifiers(file_path):
    with open(file_path, 'r') as file:
        content = file.read()
    
    # Extract all potential identifiers (word-like tokens) from the content
    # This regex looks for words that might be theorem names
    identifiers = set(re.findall(r'\b([a-zA-Z][a-zA-Z0-9_]*)\b', content))
    return identifiers

def extract_module_paths(result):
    # Extract module paths from the result
    module_paths = {}
    if 'messages' in result:
        for message in result['messages']:
            # Get the message string from the 'message' key
            if isinstance(message, dict) and 'message' in message:
                data = message['message']
            else:
                continue
                
            # Parse the data field which is expected in format "identifier : module"
            parts = data.split(' : ')
            if len(parts) == 2:
                identifier = parts[0]
                module_info = parts[1]
                
                # Only keep entries with actual module paths (not "none")
                if module_info.startswith('some ('):
                    # Extract the module path from inside the parentheses
                    module_path = module_info[6:-1]  # Remove "some (" and ")"
                    module_paths[identifier] = module_path
    
    return module_paths

def process_batch(identifiers_batch, batch_num):
    """Process a batch of identifiers and return their module paths."""
    print(f"Processing batch {batch_num} with {len(identifiers_batch)} identifiers...")
    
    # Build Lean code to check the batch of identifiers
    code_template = """import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat Lean

run_cmd do
  let env ← getEnv
    """

    # Add each identifier in the batch to the code
    for identifier in identifiers_batch:
        code_template += f"""
  let name := ``{identifier}
  let module? := env.getModuleFor? name
  logInfo m!"{{name}} : {{module?}}"
    """

    # Execute the code
    print(f"Executing batch {batch_num}...")
    try:
        # Execute using the REPL
        # print(f"Executing code: {code_template}")
        result = repl.execute(code_template, env_mode='header')
        print(f"Batch {batch_num} execution completed")
        
        # Extract module paths from this batch
        batch_module_paths = extract_module_paths(result)
        print(f"Found {len(batch_module_paths)} module paths in batch {batch_num}")
        
        return batch_module_paths
    except Exception as e:
        print(f"Error processing batch {batch_num}: {e}")
        return {}

def save_results(all_module_paths, output_file="module_paths_results.json"):
    """Save all collected module paths to a JSON file."""
    # Ensure the output directory exists
    output_dir = os.path.dirname(output_file)
    if output_dir and not os.path.exists(output_dir):
        os.makedirs(output_dir, exist_ok=True)
        print(f"Created output directory: {output_dir}")
        
    with open(output_file, 'w') as f:
        json.dump(all_module_paths, f, indent=2)
    print(f"Saved {len(all_module_paths)} module paths to {output_file}")

def run_sourcing_lean_env():
    """Run the lean environment setup if needed"""
    try:
        # Check if we need to source lean.sh
        lean_sh_path = "/data/lean.sh"
        if not os.path.exists(lean_sh_path):
            print(f"Lean environment script not found at {lean_sh_path}")
            return

        # Check if LAKE_ROOT is already set (might indicate env is already sourced)
        if os.environ.get("LAKE_ROOT"):
             print("Lean environment likely already sourced (LAKE_ROOT is set).")
             return

        print(f"Sourcing Lean environment from {lean_sh_path}...")
        # Using subprocess is generally safer and captures output/errors better
        # but os.system might be needed if 'source' needs shell context
        # For simplicity, keep os.system but add error check
        ret_code = os.system(f"source {lean_sh_path}")
        if ret_code == 0:
            print("Lean environment sourced successfully (using os.system).")
        else:
             # This might not work as expected as os.system doesn't handle 'source' well
             print(f"Warning: 'source {lean_sh_path}' command returned non-zero exit code: {ret_code}. Environment might not be set correctly.")

    except Exception as e:
        print(f"Error sourcing Lean environment: {e}")

def collect_paths_from_file(file_path, output_file, batch_size=40):
    """Process a single Lean file to collect module paths for identifiers."""
    print(f"\n--- Processing file: {file_path} ---")
    try:
        # Ensure Lean environment is set up (called once per file)
        # run_sourcing_lean_env() # Called globally in main now
        
        # Start the Lean REPL if not already running (idempotent check inside)
        if not repl.running:
            print("Starting Lean REPL...")
            if not repl.start():
                 print("Failed to start Lean REPL. Aborting for this file.")
                 return {} # Indicate failure for this file
        
        # Extract identifiers from the file
        print(f"Extracting identifiers from {file_path}...")
        identifiers = list(extract_identifiers(file_path))
        print(f"Found {len(identifiers)} identifiers")
        
        # Process identifiers in batches
        all_module_paths = {}
        
        for i in range(0, len(identifiers), batch_size):
            batch_num = i // batch_size + 1
            end_idx = min(i + batch_size, len(identifiers))
            current_batch = identifiers[i:end_idx]
            
            # Process this batch
            batch_result = process_batch(current_batch, batch_num)
            
            # Merge with overall results
            all_module_paths.update(batch_result)
            
        # Print results for this file
        print(f"\nResults for {file_path}:")
        # for identifier, module_path in sorted(all_module_paths.items()):
        #     print(f"{identifier}: {module_path}")
        
        # Final statistics for this file
        print(f"Total identifiers processed in {file_path}: {len(identifiers)}")
        print(f"Total module paths found in {file_path}: {len(all_module_paths)}")
        
        # Save final results for this file
        save_results(all_module_paths, output_file)
        return all_module_paths # Return results for potential aggregation if needed later
        
    except Exception as e:
        print(f"Error processing file {file_path}: {e}")
        return {} # Indicate failure

def collect_paths_from_directory(directory_path, output_dir, batch_size=40):
    """Process all Lean files in a directory, saving results individually."""
    print(f"\n=== Processing directory: {directory_path} ===")
    print(f"Outputting individual JSON files to: {output_dir}")
    
    # Ensure output directory exists
    os.makedirs(output_dir, exist_ok=True)
    
    # Find all Lean files
    lean_files = sorted(glob.glob(os.path.join(directory_path, "*.lean")))
    print(f"Found {len(lean_files)} Lean files to process.")
    
    if not lean_files:
        print("No .lean files found in the specified directory.")
        return

    total_files_processed = 0
    total_files_failed = 0

    # Process each file individually
    for file_path in lean_files:
        # Construct output file path
        file_stem = Path(file_path).stem
        output_file = os.path.join(output_dir, f"{file_stem}.json")
        
        # Process the file
        result = collect_paths_from_file(file_path, output_file, batch_size)
        
        if result is not None: # Assuming collect_paths_from_file returns {} on error
             total_files_processed += 1
        else:
             total_files_failed +=1


    print(f"\n=== Directory processing complete ===")
    print(f"Total files processed: {total_files_processed}")
    print(f"Total files failed: {total_files_failed}")
    print(f"Individual JSON results saved in: {output_dir}")


def main():
    parser = argparse.ArgumentParser(description="Collect module paths for identifiers in Lean files")
    input_group = parser.add_mutually_exclusive_group(required=True)
    input_group.add_argument("--file", type=str, help="Path to a single Lean file to process")
    input_group.add_argument("--dir", type=str, help="Path to a directory of Lean files to process")
    
    output_group = parser.add_mutually_exclusive_group(required=True)
    output_group.add_argument("--output", type=str, help="Output file for the module paths (used only with --file)")
    output_group.add_argument("--output-dir", type=str, help="Output directory for individual JSON files (used only with --dir)")

    parser.add_argument("--batch-size", type=int, default=1, 
                        help="Number of identifiers to process in each batch")
    
    args = parser.parse_args()
    
    # Validate arguments based on input type
    if args.file and not args.output:
         parser.error("--output is required when using --file")
    if args.dir and not args.output_dir:
         parser.error("--output-dir is required when using --dir")

    try:
        # Ensure Lean environment is set up (do it once globally)
        run_sourcing_lean_env()
        
        # Start the Lean REPL (it handles being started multiple times)
        print("Attempting to start Lean REPL globally...")
        if not repl.start():
             print("Fatal: Failed to start Lean REPL. Exiting.")
             return # Exit if REPL can't start

        if args.file:
            collect_paths_from_file(args.file, args.output, args.batch_size)
        elif args.dir:
            collect_paths_from_directory(args.dir, args.output_dir, args.batch_size)
            
    except Exception as e:
        print(f"An unexpected error occurred: {e}")
    finally:
        # Always make sure to close the REPL properly at the very end
        if repl.running:
            print("Closing Lean REPL...")
            repl.end()

# Main execution
if __name__ == "__main__":
    main()
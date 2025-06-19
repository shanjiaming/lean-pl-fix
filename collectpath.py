# from lean_api import repl
import re
import json
import time
import argparse
import os
import glob
from pathlib import Path
from decompose_solver import unified_env, remove_lean_comments

def extract_identifiers(content: str):
    # Extract all potential identifiers (word-like tokens) from the content
    # This regex looks for words that might be theorem names
    identifiers = set(re.findall(r'\b([a-zA-Z][a-zA-Z0-9_]*)\b', content))
    return identifiers

def extract_module_paths(result):
    # Extract module paths from the result
    module_paths = {}
    
    for message in result.messages:
        # Get the message string from the 'message' key
        if message.severity=='error':
            continue
        else:
            data = message.data
            
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

def process_batch(identifiers_batch, batch_num, header: str):
    """Process a batch of identifiers and return their module paths."""
    print(f"Processing batch {batch_num} with {len(identifiers_batch)} identifiers...")
    
    # Build Lean code to check the batch of identifiers
    run_cmd_part = """run_cmd do
  let env ← getEnv
"""

    # Add each identifier in the batch to the code
    for identifier in identifiers_batch:
        run_cmd_part += f"""
  let name := ``{identifier}
  let module? := env.getModuleFor? name
  logInfo m!"{{name}} : {{module?}}"
    """

    # Execute the code
    print(f"Executing batch {batch_num}...")
    try:
        # For debugging: print the exact code being executed
        print("\n--- Sending to Lean ---")
        print("--- Header ---")
        print(header)
        print("--- Command ---")
        print(run_cmd_part)
        print("-----------------------\n")

        # Execute using the REPL
        result = unified_env.run_with_header(header, run_cmd_part)
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

def main():
    parser = argparse.ArgumentParser(description="Collect module paths for identifiers in Lean files based on dataset and problem ID.")
    parser.add_argument("--dataset", type=str, required=True, help="The dataset name (e.g., 'demo', 'minif2f').")
    parser.add_argument("--problem", type=str, required=True, help="The problem ID (e.g., 'demo_complex_p1').")
    parser.add_argument("--output", type=str, help="Optional: Output file for the module paths. If not provided, defaults to '<problem_dir>/identifier_to_module_map.json'.")
    parser.add_argument("--batch-size", type=int, default=1, help="Number of identifiers to process in each batch.")
    
    args = parser.parse_args()
    
    # --- 1. Construct Paths and Read Files ---
    base_path = "decomposition_results"
    problem_dir = os.path.join(base_path, args.dataset, "decomposed", args.problem)
    
    # Determine output path
    if args.output:
        output_file = args.output
    else:
        output_file = os.path.join(problem_dir, "identifier_to_module_map.json")

    problem_file_path = os.path.join(problem_dir, "problem.lean")
    header_file_path = os.path.join(problem_dir, "header.lean")
    
    if not os.path.exists(problem_file_path) or not os.path.exists(header_file_path):
        print(f"Error: Could not find 'problem.lean' or 'header.lean' in directory: {problem_dir}")
        return

    print(f"--- Processing problem: {args.dataset}/{args.problem} ---")
    
    with open(problem_file_path, 'r') as f:
        problem_content = f.read()
        
    with open(header_file_path, 'r') as f:
        header_content = f.read()
    
    # Clean comments from the header first
    header_content = remove_lean_comments(header_content)

    # Per user instruction, add "open Lean" to the header
    header_content += "\nopen Lean\n"

    # --- 2. Process Identifiers ---
    try:
        print(f"Extracting identifiers from {problem_file_path}...")
        identifiers = list(extract_identifiers(problem_content))
        print(f"Found {len(identifiers)} unique potential identifiers.")
        
        all_module_paths = {}
        for i in range(0, len(identifiers), args.batch_size):
            batch_num = i // args.batch_size + 1
            end_idx = min(i + args.batch_size, len(identifiers))
            current_batch = identifiers[i:end_idx]
            
            # Process this batch
            batch_result = process_batch(current_batch, batch_num, header_content)
            all_module_paths.update(batch_result)
            
        # --- 3. Save Results ---
        print("\n--- Final Results ---")
        print(f"Total identifiers processed: {len(identifiers)}")
        print(f"Total module paths found: {len(all_module_paths)}")
        save_results(all_module_paths, output_file)
        
    except Exception as e:
        print(f"An unexpected error occurred during processing: {e}")
    finally:
        # The unified_env object manages its own lifecycle, no explicit end needed
        pass

# Main execution
if __name__ == "__main__":
    main()
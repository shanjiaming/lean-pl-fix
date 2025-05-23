import os
from dpv2_solver import solve_theorem_dpv2, solve_theorem_dpv2_unified, solve_theorem_dpv2_by_id
from unified_problem_manager import problem_manager

# Legacy target directory for backward compatibility
TARGET_DIR = "minif2f-dspv2/test_failed_fixed_unknown_failed/"

def batch_fix_theorems():
    if not os.path.exists(TARGET_DIR):
        print(f"Target directory {TARGET_DIR} does not exist. Please create it and populate it with .lean files.")
        return

    for filename in os.listdir(TARGET_DIR):
        if filename.endswith(".lean"):
            filepath = os.path.join(TARGET_DIR, filename)
            print(f"Processing file: {filepath}")
            try:
                with open(filepath, 'r', encoding='utf-8') as f:
                    original_content = f.read()

                theorem_keyword = "theorem "

                theorem_start_index = original_content.find(theorem_keyword)

                header_content = original_content[:theorem_start_index]
                theorem_statement_and_proof = original_content[theorem_start_index:]
                
                print(f"--- Original theorem content of {filename} ---")
                print(theorem_statement_and_proof[:300] + "..." if len(theorem_statement_and_proof) > 300 else theorem_statement_and_proof)
                print("--- End original theorem content ---")

                # It's crucial that solve_theorem_dpv2 can handle the input and return fixed content
                # or raise an error if it fails internally.
                fixed_theorem_content = solve_theorem_dpv2(theorem_statement_and_proof)

                if fixed_theorem_content and fixed_theorem_content != theorem_statement_and_proof:
                    new_full_content = header_content + fixed_theorem_content
                    with open(filepath, 'w', encoding='utf-8') as f:
                        f.write(new_full_content)
                    print(f"Successfully fixed and updated {filename}.")
                    print(f"--- Fixed theorem content of {filename} ---")
                    print(fixed_theorem_content[:300] + "..." if len(fixed_theorem_content) > 300 else fixed_theorem_content)
                    print("--- End fixed theorem content ---")
                elif fixed_theorem_content == theorem_statement_and_proof:
                    print(f"No changes made to {filename} by the solver.")
                else:
                    # This case might occur if solve_theorem_dpv2 returns None or empty on failure,
                    # though current dpv2_solver.py asserts False on failure.
                    print(f"Solver did not return valid content for {filename}. No changes made.")

            except Exception as e:
                # The solve_theorem_dpv2 might raise an assertion error if it fails.
                print(f"Error processing file {filename}: {e}")
                print(f"--- Original theorem content of {filename} that caused error ---")
                print(theorem_statement_and_proof[:300] + "..." if len(theorem_statement_and_proof) > 300 else theorem_statement_and_proof)
                print("--- End original theorem content ---")
                # Continue to the next file

def batch_fix_unified():
    """Batch fix problems using the unified problem management system"""
    print("Using unified problem management system for batch fixing...")
    
    # Get all problems from all datasets
    all_problems = problem_manager.list_problems()
    print(f"Found {len(all_problems)} problems across {len(problem_manager.list_datasets())} datasets")
    
    for problem in all_problems:
        try:
            print(f"Processing {problem.dataset}/{problem.problem_id}")
            
            # Get original content
            original_content = problem_manager.get_problem_content(problem)
            
            print(f"--- Original theorem content of {problem.problem_id} ---")
            print(original_content[:300] + "..." if len(original_content) > 300 else original_content)
            print("--- End original theorem content ---")
            
            # Fix using unified solver
            fixed_content = solve_theorem_dpv2_unified(problem)
            
            if fixed_content and fixed_content != original_content:
                # Update the problem content
                problem_manager.update_problem_content(problem, fixed_content)
                
                # Save to decomposed directory
                problem_manager.save_decomposed_file(problem, "fixed_dpv2.lean", fixed_content)
                
                print(f"Successfully fixed and updated {problem.dataset}/{problem.problem_id}")
                print(f"--- Fixed theorem content ---")
                print(fixed_content[:300] + "..." if len(fixed_content) > 300 else fixed_content)
                print("--- End fixed theorem content ---")
            elif fixed_content == original_content:
                print(f"No changes made to {problem.dataset}/{problem.problem_id} by the solver.")
            else:
                print(f"Solver did not return valid content for {problem.dataset}/{problem.problem_id}. No changes made.")
                
        except Exception as e:
            print(f"Error processing {problem.dataset}/{problem.problem_id}: {e}")
            print(f"--- Original theorem content that caused error ---")
            print(original_content[:300] + "..." if len(original_content) > 300 else original_content)
            print("--- End original theorem content ---")
            # Continue to the next problem

def batch_fix_dataset(dataset_name: str):
    """Batch fix problems from a specific dataset"""
    problems = problem_manager.list_problems(dataset_name)
    if not problems:
        print(f"No problems found in dataset: {dataset_name}")
        return
    
    print(f"Fixing {len(problems)} problems from {dataset_name} dataset...")
    
    for problem in problems:
        try:
            print(f"Processing {problem.problem_id}")
            
            # Get original content
            original_content = problem_manager.get_problem_content(problem)
            
            # Fix using unified solver
            fixed_content = solve_theorem_dpv2_unified(problem)
            
            if fixed_content and fixed_content != original_content:
                # Update the problem content
                problem_manager.update_problem_content(problem, fixed_content)
                
                # Save to decomposed directory
                problem_manager.save_decomposed_file(problem, "fixed_dpv2.lean", fixed_content)
                
                print(f"Successfully fixed {problem.problem_id}")
            else:
                print(f"No changes needed for {problem.problem_id}")
                
        except Exception as e:
            print(f"Error processing {problem.problem_id}: {e}")

if __name__ == "__main__":
    import sys
    
    if len(sys.argv) > 1:
        command = sys.argv[1]
        if command == "legacy":
            batch_fix_theorems()
        elif command == "unified":
            batch_fix_unified()
        elif command.startswith("dataset:"):
            dataset_name = command.split(":")[1]
            batch_fix_dataset(dataset_name)
        else:
            print("Usage: python dpv2_batch_solver.py [legacy|unified|dataset:NAME]")
    else:
        # Default to unified approach
        batch_fix_unified()

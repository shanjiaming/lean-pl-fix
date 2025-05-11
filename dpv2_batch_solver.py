import os
from dpv2_solver import solve_theorem_dpv2

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

if __name__ == "__main__":
    batch_fix_theorems()

import sys
import os

# Add current directory to sys.path to allow importing unified_problem_manager
# This is important if the script is in the same directory as unified_problem_manager.py
# and that directory is not already on the Python path.
sys.path.append(os.path.dirname(os.path.abspath(__file__)))

try:
    from unified_problem_manager import problem_manager
except ImportError:
    print("Error: Could not import 'problem_manager' from 'unified_problem_manager.py'.")
    print("Ensure 'unified_problem_manager.py' is in the same directory as this script, or in your PYTHONPATH.")
    sys.exit(1)

def check_header_contents_identity():
    """
    Checks if all header.lean files managed by UnifiedProblemManager have identical content.
    """
    all_problems = problem_manager.list_problems()

    if not all_problems:
        print(f"No problems found by UnifiedProblemManager (base directory: {problem_manager.base_dir}). Cannot check headers.")
        return

    if len(all_problems) == 1:
        problem = all_problems[0]
        print(f"Only one problem found: {problem.dataset}/{problem.problem_id}. Its header is trivially unique/identical to itself.")
        # You could print a snippet of the header here if desired
        # try:
        #     header_content = problem_manager.get_header_content(problem)
        #     print(f"Header content (first 200 chars):\n{header_content[:200]}...")
        # except FileNotFoundError:
        #     print(f"Could not read header for {problem.dataset}/{problem.problem_id} at {problem.header_path}")
        return

    print(f"Checking header content identity for {len(all_problems)} problems (base directory: {problem_manager.base_dir})...")

    first_problem = all_problems[0]
    try:
        first_header_full_content = problem_manager.get_header_content(first_problem)
        first_header_lines = first_header_full_content.splitlines(keepends=True)
        first_header_content = "".join(first_header_lines[:7])
        print(f"Using header (first 7 lines) from {first_problem.dataset}/{first_problem.problem_id} (path: {first_problem.header_path}) as reference.")
    except FileNotFoundError:
        print(f"Critical Error: Could not read header for the first reference problem: {first_problem.dataset}/{first_problem.problem_id} at {first_problem.header_path}")
        print("Cannot proceed with comparison.")
        return
    
    all_found_headers_identical = True
    missing_headers_encountered = False
    different_header_problem_info = ""

    for i, problem in enumerate(all_problems[1:], start=1):
        try:
            current_header_full_content = problem_manager.get_header_content(problem)
            current_header_lines = current_header_full_content.splitlines(keepends=True)
            current_header_content = "".join(current_header_lines[:7])
            
            if current_header_content != first_header_content:
                all_found_headers_identical = False
                different_header_problem_info = f"Problem {problem.dataset}/{problem.problem_id} (at {problem.header_path}) has a different header (comparing first 7 lines)."
                # Optional: Print snippets of differing headers for quick diagnosis
                print("\n\n--- Header of reference problem (first 7 lines) ---")
                print(f"({first_problem.dataset}/{first_problem.problem_id} - {first_problem.header_path}):")
                print(first_header_content)
                print("\n--- Header of differing problem (first 7 lines) ---")
                print(f"({problem.dataset}/{problem.problem_id} - {problem.header_path}):")
                print(current_header_content)
                break 
        except FileNotFoundError:
            print(f"Warning: Could not read header for problem: {problem.dataset}/{problem.problem_id} at {problem.header_path}. This problem will be skipped in the identity check.")
            missing_headers_encountered = True
            # If we want to claim all *existing* headers are identical, this doesn't falsify all_found_headers_identical
            # It just means our check is incomplete.

    print("\\n--- Results ---")
    if not all_found_headers_identical:
        print("Not all problem headers are identical (based on first 7 lines).")
        print(different_header_problem_info)
    elif missing_headers_encountered:
        print("All *found and readable* problem headers are identical to the first one (based on first 7 lines).")
        print("However, one or more header files were missing or unreadable and were skipped.")
    else: # all_found_headers_identical is True and no missing headers
        print("All problem headers are identical (based on first 7 lines).")

if __name__ == "__main__":
    check_header_contents_identity() 
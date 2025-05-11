import os
import shutil
from lean_api import REPLInstance, error_list_net_reduced
from replace_unknown import replace_unknown_with_placeholder

SOURCE_DIR = 'minif2f-dspv2/test_failed'
PASSED_DIR_FIXED = 'minif2f-dspv2/test_failed_fixed_unknown_passed'
PARTLY_DIR_FIXED = 'minif2f-dspv2/test_failed_fixed_unknown_partly'
FAILED_DIR_FIXED = 'minif2f-dspv2/test_failed_fixed_unknown_failed'

def is_lean_file(filename: str) -> bool:
    return filename.endswith('.lean')

def main():
    print(f"Creating target directories...")
    os.makedirs(PASSED_DIR_FIXED, exist_ok=True)
    os.makedirs(PARTLY_DIR_FIXED, exist_ok=True)
    os.makedirs(FAILED_DIR_FIXED, exist_ok=True)
    print(f"Target directories created/ensured.")

    if not os.path.isdir(SOURCE_DIR):
        print(f"Error: Source directory '{SOURCE_DIR}' does not exist.")
        return

    lean_files = [f for f in os.listdir(SOURCE_DIR) if is_lean_file(f)]
    if not lean_files:
        print(f"No .lean files found in '{SOURCE_DIR}'. Exiting.")
        return

    print(f"Found {len(lean_files)} .lean files in '{SOURCE_DIR}'.")
    
    repl = None
    try:
        print("Initializing REPLInstance...")
        repl = REPLInstance(debug=False)
        print("REPLInstance initialized.")

        total_files = len(lean_files)
        count_passed = 0
        count_partly = 0
        count_failed = 0

        for i, fname in enumerate(lean_files):
            print(f"\nProcessing file {i+1}/{total_files}: {fname}...")
            original_fpath = os.path.join(SOURCE_DIR, fname)

            if not os.path.isfile(original_fpath):
                print(f"  Skipping {fname}, as it's not a file or was removed.")
                continue

            try:
                with open(original_fpath, 'r', encoding='utf-8') as f:
                    original_code = f.read()
            except Exception as e:
                print(f"  Error reading file {fname}: {e}. Skipping.")
                continue

            # 1. Get errors for original code
            print(f"  Evaluating original code for {fname}...")
            original_result = repl.execute(original_code, env_mode='header')
            original_messages = original_result.get('messages', [])
            # original_errors_count = sum(1 for m in original_messages if m.get('severity') == 'error')
            # print(f"  Original code has {original_errors_count} errors.")

            # 2. Attempt to fix the code using the refactored function
            print(f"  Attempting to fix {fname} using replace_unknown_with_placeholder...")
            processed_code = replace_unknown_with_placeholder(original_code, repl)
            print(f"  Fix attempt finished for {fname}.")

            # 3. Get errors for processed code
            print(f"  Evaluating processed code for {fname}...")
            processed_result = repl.execute(processed_code, env_mode='header')
            processed_messages = processed_result.get('messages', [])
            processed_actual_errors = [m for m in processed_messages if m.get('severity') == 'error']
            print(f"  Processed code has {len(processed_actual_errors)} errors.")

            # 4. Classify and write/remove
            target_dir = None
            action_taken_msg = ""

            if not processed_actual_errors:
                target_dir = PASSED_DIR_FIXED
                action_taken_msg = f"[PASS-FIXED] {fname}"
                count_passed += 1
            elif error_list_net_reduced(original_messages, processed_messages):
                target_dir = PARTLY_DIR_FIXED
                action_taken_msg = f"[PARTLY-FIXED] {fname}"
                count_partly += 1
            else:
                target_dir = FAILED_DIR_FIXED
                action_taken_msg = f"[FAIL-FIXED] {fname}"
                count_failed += 1
            
            dest_fpath = os.path.join(target_dir, fname)
            print(f"  {action_taken_msg} -> saving to {dest_fpath}")
            
            try:
                with open(dest_fpath, 'w', encoding='utf-8') as f_dest:
                    f_dest.write(processed_code)
                
            except Exception as e:
                print(f"  Error writing to {dest_fpath} or removing {original_fpath}: {e}")


        print(f"\nProcessing complete. Summary:")
        print(f"  Passed (fully fixed): {count_passed}")
        print(f"  Partly fixed: {count_partly}")
        print(f"  Failed to fix: {count_failed}")
        print(f"  Total processed files: {i+1 if lean_files else 0} (out of {total_files} found)")

    except Exception as e:
        print(f"An unexpected error occurred: {e}")
    finally:
        if repl:
            print("Ending REPLInstance...")
            repl.end()
            print("REPLInstance ended.")

if __name__ == '__main__':
    main() 
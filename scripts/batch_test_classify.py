import os
import shutil
from lean_api import REPLInstance

# TEST_DIR = 'minif2f-dspv2/test'
# PASSED_DIR = 'minif2f-dspv2/test_passed'
# FAILED_DIR = 'minif2f-dspv2/test_failed'
TEST_DIR = 'dataset/proverbench_simpleheader'
PASSED_DIR = 'dataset/proverbench_simpleheader_passed'
FAILED_DIR = 'dataset/proverbench_simpleheader_failed'

os.makedirs(PASSED_DIR, exist_ok=True)
os.makedirs(FAILED_DIR, exist_ok=True)

def is_lean_file(filename):
    return filename.endswith('.lean')

def main():
    print("Script started.")
    if not os.path.isdir(TEST_DIR):
        print(f"Error: Test directory '{TEST_DIR}' does not exist.")
        return

    lean_files = [f for f in os.listdir(TEST_DIR) if is_lean_file(f)]
    print(f"Found {len(lean_files)} .lean files in '{TEST_DIR}'.")
        
    if not lean_files:
        print(f"No .lean files found in '{TEST_DIR}'. Exiting.")
        return

    repl = None
    passed_files, failed_files = [], []

    print("Initializing REPLInstance...")
    repl = REPLInstance(debug=False)
    print("REPLInstance initialized.")
    
    for i, fname in enumerate(lean_files):
        print(f"Processing file {i+1}/{len(lean_files)}: {fname}...")
        fpath = os.path.join(TEST_DIR, fname)
        with open(fpath, 'r', encoding='utf-8') as f:
            code = f.read()
        
        print(f"  Executing code from {fname}...")
        result = repl.execute(code, env_mode='header')
        print(f"  Execution finished for {fname}.")
        
        has_lean_error = any(m.get('severity') == 'error' for m in result.get('messages', []))
        
        if not has_lean_error:
            shutil.copy(fpath, os.path.join(PASSED_DIR, fname))
            passed_files.append(fname)
            print(f"[PASS]   {fname}")
        else:
            shutil.copy(fpath, os.path.join(FAILED_DIR, fname))
            failed_files.append(fname)
            error_messages = [m.get('message') for m in result.get('messages', []) if m.get('severity') == 'error']
            print(f"[FAIL]   {fname} (Lean errors: {error_messages})")
        print(f"Finished processing {fname}.")
    
    print(f"\nSummary: {len(passed_files)} passed, {len(failed_files)} failed.")
    if failed_files:
        print("Failed files (includes files with Lean errors and processing errors):", failed_files)

    repl.end()

if __name__ == '__main__':
    main() 
#!/usr/bin/env python3

import os
import sys
import glob
import time
import argparse
import subprocess
import concurrent.futures

# Define the base directory for Tyrell specification files
TYRELL_SPEC_DIR = "minif2f/tyrell_batch_output"

def repair_file(file_path, output_dir):
    # Get the file name
    filename = os.path.basename(file_path)
    print(f"Processing: {filename}")
    
    # Construct the corresponding Tyrell spec file path
    input_name = os.path.splitext(filename)[0]
    tyrell_file = os.path.join(TYRELL_SPEC_DIR, f"{input_name}_static_filtered.tyrell")
    
    # Check if the Tyrell spec file exists
    if not os.path.exists(tyrell_file):
        print(f"❌ {filename} processing failed - Tyrell spec file not found: {tyrell_file}")
        return # Skip processing if spec file is missing
    
    # Call lean_enumerator.py to process the file, passing the specific tyrell spec
    cmd = [
        sys.executable,
        "lean_enumerator.py",
        file_path,
        "--tyrell-spec", tyrell_file,
        "--output-dir", output_dir, # Pass output dir for logs/results
        "--no-verbose" # Optional: reduce noise during batch processing
    ]
    process = subprocess.Popen(
        cmd,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        text=True
    )
    stdout, stderr = process.communicate()
    
    if process.returncode == 0:
        print(f"✅ {filename} processed successfully")
        # Create a marker file in the output folder to indicate the file has been processed
        marker_file = os.path.join(output_dir, filename + ".done")
        with open(marker_file, "w") as f:
            f.write("done")
    else:
        print(f"❌ {filename} processing failed")
        if stderr:
            print("Error message:")
            print(stderr)

def main():
    parser = argparse.ArgumentParser(description="Batch process Lean files")
    parser.add_argument("--input_dir", type=str, default="./minif2f/lean_code",
                        help="Directory containing .lean files")
    parser.add_argument("--output_dir", type=str, default="./minif2f/lean_fixed",
                        help="Directory to store marker files for processed files")
    parser.add_argument("--max_workers", type=int, default=20,
                        help="Maximum number of parallel tasks")
    args = parser.parse_args()
    
    print(f"Scanning input directory: {args.input_dir}")
    
    # Create output directory if it doesn't exist
    if not os.path.exists(args.output_dir):
        os.makedirs(args.output_dir, exist_ok=True)
    
    # List all .lean files in the input directory
    lean_files = glob.glob(os.path.join(args.input_dir, "*.lean"))
    lean_files.sort()
    
    if not lean_files:
        print(f"Error: No .lean files found in {args.input_dir}!")
        return

    # Filter out files that have already been processed based on the marker file in the output directory
    files_to_process = []
    for file_path in lean_files:
        marker_file = os.path.join(args.output_dir, os.path.basename(file_path) + ".done")
        if os.path.exists(marker_file):
            print(f"Skipping already processed file: {os.path.basename(file_path)}")
        else:
            files_to_process.append(file_path)
    
    print(f"Total Lean files: {len(lean_files)}; Files to process: {len(files_to_process)}")
    print(f"Using {args.max_workers} parallel tasks")
    
    start_time = time.time()
    with concurrent.futures.ThreadPoolExecutor(max_workers=args.max_workers) as executor:
        futures = {executor.submit(repair_file, file_path, args.output_dir): file_path for file_path in files_to_process}
        completed = 0
        for future in concurrent.futures.as_completed(futures):
            completed += 1
            file_path = futures[future]
            print(f"Progress: {completed}/{len(files_to_process)} - {os.path.basename(file_path)} completed")
    
    elapsed_time = time.time() - start_time
    print(f"\nAll files processed! Total time: {elapsed_time:.2f} seconds")

if __name__ == "__main__":
    main()

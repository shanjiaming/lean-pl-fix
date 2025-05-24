#!/usr/bin/env python3

import os
import sys
import glob
import time
import argparse
import subprocess
import concurrent.futures
import re

def get_tyrell_spec_for_file(file_path):
    """
    根据文件名确定使用哪个tyrell规范文件
    注意：lean_enumerator.py自身会根据错误类型选择使用static或have规范
    但我们可以通过参数指定基础规范目录，让它在正确的目录下查找
    """
    # 从文件名中提取数字
    filename = os.path.basename(file_path)
    match = re.match(r'(\d+)\.lean', filename)
    
    # 不直接指定规范文件，而是传递文件编号参数给lean_enumerator.py
    # 让它自己判断是否需要使用static或have
    if match:
        # 只指定默认规范文件
        # lean_enumerator.py会根据错误类型和这个默认规范的位置
        # 推断出static/have版本的位置
        return "semantic/lean.tyrell"
    
    # 如果无法从文件名确定，使用默认规范
    return "semantic/lean.tyrell"

def repair_file(file_path, output_dir):
    # Get the file name
    filename = os.path.basename(file_path)
    print(f"Processing: {filename}")
    
    # 不再直接指定tyrell规范，添加文件路径参数让lean_enumerator.py自己判断
    
    # Call lean_enumerator.py to process the file
    cmd = [
        sys.executable,
        "lean_enumerator.py",
        file_path,
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
        
        # 复制原始代码到输出目录（作为处理完成的标记）
        original_file_path = os.path.join(output_dir, filename)
        try:
            with open(file_path, 'r') as src_file:
                original_code = src_file.read()
            with open(original_file_path, 'w') as dest_file:
                dest_file.write(original_code)
            print(f"Copied original code to: {original_file_path} as completion marker")
        except Exception as e:
            print(f"Error copying original file: {str(e)}")
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
    parser.add_argument("--max_workers", type=int, default=4,
                        help="Maximum number of parallel tasks")
    parser.add_argument("--default_spec", type=str, default="semantic/lean.tyrell",
                        help="Default Tyrell specification file to use if no specific one is determined")
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

    # Filter out files that have already been processed based on the existence of the original file
    # and a fixed version in the output directory
    files_to_process = []
    for file_path in lean_files:
        base_filename = os.path.basename(file_path)
        original_file = os.path.join(args.output_dir, base_filename)
        fixed_file = os.path.join(args.output_dir, os.path.splitext(base_filename)[0] + "_fixed.lean")
        if os.path.exists(original_file) and os.path.exists(fixed_file):
            print(f"Skipping already processed file: {base_filename}")
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

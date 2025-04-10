#!/usr/bin/env python3

import os
import sys
import glob
import time
import argparse
import subprocess
import concurrent.futures

def repair_file(file_path):
    """简单地调用lean_enumerator.py处理一个文件"""
    filename = os.path.basename(file_path)
    print(f"开始处理: {filename}")
    
    # 直接调用lean_enumerator.py修复文件
    process = subprocess.Popen(
        [sys.executable, "lean_enumerator.py", file_path],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        text=True
    )
    
    # 等待处理完成
    process.communicate()
    
    # 简单检查是否成功（基于返回码）
    if process.returncode == 0:
        print(f"✅ {filename} 处理完成")
    else:
        print(f"❌ {filename} 处理失败")

def main():
    parser = argparse.ArgumentParser(description="简单批量修复Lean文件")
    parser.add_argument("--input_dir", type=str, default="/data/coding/minif2f/lean_code",
                        help="包含.lean文件的输入目录")
    parser.add_argument("--max_workers", type=int, default=40,
                        help="最大并行处理数量")
    
    args = parser.parse_args()
    
    print(f"开始扫描目录: {args.input_dir}")
    
    # 获取所有.lean文件
    lean_files = glob.glob(os.path.join(args.input_dir, "*.lean"))
    lean_files.sort()
    
    if not lean_files:
        print(f"错误: 目录 {args.input_dir} 中未找到任何.lean文件!")
        return
    
    print(f"找到 {len(lean_files)} 个Lean文件需要处理")
    print(f"使用 {args.max_workers} 个并行任务")
    
    # 记录开始时间
    start_time = time.time()
    
    # 并行处理所有文件
    with concurrent.futures.ThreadPoolExecutor(max_workers=args.max_workers) as executor:
        futures = {executor.submit(repair_file, file_path): file_path for file_path in lean_files}
        
        # 简单显示进度
        completed = 0
        for future in concurrent.futures.as_completed(futures):
            completed += 1
            file_path = futures[future]
            filename = os.path.basename(file_path)
            
            # 显示简单进度
            print(f"进度: {completed}/{len(lean_files)} - 完成 {filename}")
    
    # 显示总用时
    elapsed_time = time.time() - start_time
    print(f"\n所有文件处理完成! 总用时: {elapsed_time:.2f}秒")

if __name__ == "__main__":
    main()
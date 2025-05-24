#!/usr/bin/env python3
"""
Script to add demo dataset to unified_problems_metadata.json
"""

import json
import os
import shutil
from pathlib import Path

def add_demo_to_unified():
    """Add demo problems to the unified dataset"""
    
    # 读取现有的unified数据集元数据
    metadata_file = "data/unified_problems_metadata.json"
    with open(metadata_file, 'r', encoding='utf-8') as f:
        metadata = json.load(f)
    
    print(f"Current unified dataset has {len(metadata)} problems")
    
    # demo目录中的lean文件
    demo_files = [
        "simple_add.lean",
        "simple_mul.lean", 
        "simple_refl.lean",
        "broken_add.lean",
        "hole_proof.lean"
    ]
    
    # 为每个demo文件创建unified问题结构
    for demo_file in demo_files:
        demo_path = f"demo/{demo_file}"
        if not os.path.exists(demo_path):
            print(f"Warning: {demo_path} not found, skipping...")
            continue
            
        # 提取问题名称（去掉.lean扩展名）
        problem_name = demo_file.replace('.lean', '')
        problem_id = f"demo/{problem_name}"
        
        print(f"Processing {problem_id}...")
        
        # 创建unified问题目录结构
        problem_dir = f"unified_problems/demo/{problem_name}"
        os.makedirs(problem_dir, exist_ok=True)
        os.makedirs(f"{problem_dir}/decomposed", exist_ok=True)
        os.makedirs(f"{problem_dir}/hole", exist_ok=True)
        
        # 复制原始文件内容为header.lean和problem.lean
        with open(demo_path, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # 创建header.lean（通常包含import语句）
        header_content = "import Mathlib.Tactic\n"
        with open(f"{problem_dir}/header.lean", 'w', encoding='utf-8') as f:
            f.write(header_content)
        
        # 创建problem.lean（包含定理内容）
        # 移除import语句，只保留定理部分
        lines = content.strip().split('\n')
        problem_lines = []
        for line in lines:
            if not line.strip().startswith('import'):
                problem_lines.append(line)
        problem_content = '\n'.join(problem_lines).strip()
        
        with open(f"{problem_dir}/problem.lean", 'w', encoding='utf-8') as f:
            f.write(problem_content)
        
        # 添加到元数据
        metadata[problem_id] = {
            "dataset": "demo",
            "problem_id": problem_name,
            "header_path": f"unified_problems/demo/{problem_name}/header.lean",
            "problem_path": f"unified_problems/demo/{problem_name}/problem.lean", 
            "decomposed_dir": f"unified_problems/demo/{problem_name}/decomposed",
            "hole_dir": f"unified_problems/demo/{problem_name}/hole",
            "original_path": f"demo/{demo_file}"
        }
        
        print(f"  ✅ Added {problem_id}")
    
    # 保存更新后的元数据
    print(f"\nSaving updated metadata with {len(metadata)} problems...")
    with open(metadata_file, 'w', encoding='utf-8') as f:
        json.dump(metadata, f, indent=2, ensure_ascii=False)
    
    print("✅ Demo dataset successfully added to unified dataset!")
    print(f"New total: {len(metadata)} problems")
    
    # 显示新添加的问题
    demo_problems = [k for k in metadata.keys() if k.startswith('demo/')]
    print(f"\nDemo problems added:")
    for problem in demo_problems:
        print(f"  - {problem}")

if __name__ == "__main__":
    add_demo_to_unified() 
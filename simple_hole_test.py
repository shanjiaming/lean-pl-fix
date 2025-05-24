#!/usr/bin/env python3
"""
简单的hole填充测试 - 基于已验证的逻辑
"""

import os
import sys
from pathlib import Path

print("=== 简单hole填充测试开始 ===")

# 添加项目路径  
sys.path.append(str(Path(__file__).parent))

print("1. 测试数据管理器导入...")
try:
    from data_management.unified_problem_manager import problem_manager
    print("✅ 数据管理器导入成功")
except Exception as e:
    print(f"❌ 数据管理器导入失败: {e}")
    sys.exit(1)

print("2. 测试获取问题...")
try:
    dataset = "demo"
    problem_id = "nested_have"
    
    problem = problem_manager.get_problem(dataset, problem_id)
    if problem:
        print(f"✅ 找到问题: {problem.dataset}/{problem.problem_id}")
        print(f"  问题路径: {problem.main_file}")
        print(f"  分解目录: {problem.decomposed_dir}")
    else:
        print(f"❌ 未找到问题: {dataset}/{problem_id}")
        
except Exception as e:
    print(f"❌ 获取问题失败: {e}")
    import traceback
    traceback.print_exc()

print("3. 测试读取子问题文件...")
try:
    subproblem_file = "unified_problems/demo/nested_have/decomposed/decomposed_03_h4.lean"
    
    if os.path.exists(subproblem_file):
        with open(subproblem_file, 'r') as f:
            content = f.read()
        print(f"✅ 成功读取子问题文件:")
        print(content)
    else:
        print(f"❌ 子问题文件不存在: {subproblem_file}")
        
except Exception as e:
    print(f"❌ 读取子问题文件失败: {e}")

print("4. 测试分解求解器导入...")
try:
    from decompose_hole_and_buildback.decompose_solver import solve_theorem_unified
    print("✅ 分解求解器导入成功")
except Exception as e:
    print(f"❌ 分解求解器导入失败: {e}")
    import traceback
    traceback.print_exc()

print("=== 简单测试完成 ===") 
#!/usr/bin/env python3
"""
测试基于分解求解器的hole填充功能
使用已验证可工作的回调函数机制
"""

import os
import sys
from pathlib import Path

# 添加项目路径
sys.path.append(str(Path(__file__).parent))

from decompose_hole_and_buildback.decompose_solver import solve_theorem_unified
from data_management.unified_problem_manager import problem_manager

def simple_hole_fixer(theorem_content: str) -> str:
    """
    简单的hole修复函数 - 基于现有的成功示例
    这是传递给solve_theorem_unified的回调函数
    
    Args:
        theorem_content: theorem格式的proof framework
        
    Returns:
        修复后的theorem内容
    """
    print(f"=== 收到待修复的theorem ===")
    print(theorem_content)
    print("=" * 50)
    
    # 对于简单的加法结合律，使用基本的tactic
    if "c + b + a = c + (b + a)" in theorem_content:
        # 使用Nat.add_assoc来证明结合律
        fixed_content = theorem_content.replace("hole", "rw [Nat.add_assoc]")
    elif "Nat" in theorem_content and "+" in theorem_content:
        # 对于其他自然数加法，尝试基本策略
        fixed_content = theorem_content.replace("hole", "simp [Nat.add_assoc, Nat.add_comm]")
    else:
        # 默认使用sorry作为退步策略  
        fixed_content = theorem_content.replace("hole", "sorry")
    
    print(f"=== 修复后的theorem ===")
    print(fixed_content)
    print("=" * 50)
    
    return fixed_content

def test_specific_subproblem():
    """测试具体的子问题"""
    print("=== 测试具体子问题的hole填充 ===")
    
    # 获取特定的子问题
    dataset = "demo"
    problem_id = "nested_have"
    
    problem = problem_manager.get_problem(dataset, problem_id)
    if not problem:
        print(f"未找到问题: {dataset}/{problem_id}")
        return False
    
    print(f"找到问题: {problem.dataset}/{problem.problem_id}")
    
    # 读取分解后的子问题文件
    subproblem_file = "unified_problems/demo/nested_have/decomposed/decomposed_03_h4.lean"
    
    if not os.path.exists(subproblem_file):
        print(f"子问题文件不存在: {subproblem_file}")
        return False
    
    with open(subproblem_file, 'r') as f:
        subproblem_content = f.read()
    
    print(f"子问题内容:")
    print(subproblem_content)
    print("-" * 50)
    
    try:
        # 使用solve_theorem_unified和回调函数来修复
        print("使用decompose_solver修复子问题...")
        fixed_result = solve_theorem_unified(problem, simple_hole_fixer)
        
        print(f"修复结果:")
        print(fixed_result)
        
        # 保存修复结果
        output_dir = "minif2f/hole_fix_results"
        os.makedirs(output_dir, exist_ok=True)
        
        output_file = os.path.join(output_dir, f"fixed_{problem.problem_id.replace('/', '_')}.lean")
        with open(output_file, 'w') as f:
            f.write(fixed_result)
        
        print(f"修复结果已保存到: {output_file}")
        return True
        
    except Exception as e:
        print(f"修复过程中出错: {e}")
        import traceback
        traceback.print_exc()
        return False

def test_step_by_step_decompose():
    """分步骤演示decompose和rebuild过程"""
    print("\n=== 分步骤演示decompose和rebuild ===")
    
    dataset = "demo"
    problem_id = "nested_have"
    
    problem = problem_manager.get_problem(dataset, problem_id)
    if not problem:
        print(f"未找到问题: {dataset}/{problem_id}")
        return False
    
    # 获取原始问题内容
    original_content = problem_manager.get_problem_content(problem)
    header_content = problem_manager.get_header_content(problem)
    
    print("1. 原始问题内容:")
    print(original_content)
    print("-" * 50)
    
    print("2. Header内容:")
    print(header_content)
    print("-" * 50)
    
    print("3. 开始使用decompose_solver分解并重建...")
    
    # 定义一个更详细的回调函数
    def detailed_hole_fixer(theorem_content: str) -> str:
        print(f"\n>>> 回调函数收到子问题:")
        print(theorem_content)
        
        # 分析问题类型并应用对应策略
        if "c + b + a = c + (b + a)" in theorem_content:
            strategy = "rw [Nat.add_assoc]"
            print(f">>> 检测到加法结合律，使用策略: {strategy}")
        else:
            strategy = "sorry"
            print(f">>> 使用默认策略: {strategy}")
        
        fixed = theorem_content.replace("hole", strategy)
        print(f">>> 修复后内容:")
        print(fixed)
        print("-" * 30)
        return fixed
    
    try:
        result = solve_theorem_unified(problem, detailed_hole_fixer)
        
        print("4. 最终重建结果:")
        print(result)
        
        return True
        
    except Exception as e:
        print(f"分解重建过程出错: {e}")
        import traceback
        traceback.print_exc()
        return False

if __name__ == "__main__":
    print("基于decompose_solver的hole填充测试")
    print("=" * 60)
    
    # 测试1: 具体子问题
    success1 = test_specific_subproblem()
    
    # 测试2: 分步骤演示
    success2 = test_step_by_step_decompose()
    
    if success1 and success2:
        print("\n✅ 所有测试通过！")
    else:
        print("\n❌ 部分测试失败")
        sys.exit(1) 
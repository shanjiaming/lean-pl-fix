#!/usr/bin/env python3
"""
基于现有验证可工作逻辑的hole填充测试
修正了Problem对象属性的使用
"""

import os
import sys
from pathlib import Path

print("=== 基于现有逻辑的hole填充测试 ===")

# 添加项目路径  
sys.path.append(str(Path(__file__).parent))

try:
    from data_management.unified_problem_manager import problem_manager
    print("✅ 数据管理器导入成功")
except Exception as e:
    print(f"❌ 数据管理器导入失败: {e}")
    sys.exit(1)

def simple_fix_single_proof(theorem_content: str) -> str:
    """
    简单的proof修复回调函数 - 基于现有成功示例
    这个函数会被decompose_solver调用来修复每个子proof
    
    Args:
        theorem_content: theorem格式的证明内容，包含hole
        
    Returns:
        修复后的theorem内容
    """
    print(f"\n>>> 回调函数收到待修复的theorem:")
    print(theorem_content)
    print("-" * 40)
    
    # 对于加法结合律，使用正确的tactic
    if "c + b + a = c + (b + a)" in theorem_content:
        # 这是加法结合律，使用Nat.add_assoc
        fixed_content = theorem_content.replace("hole", "rw [Nat.add_assoc]")
        print(f">>> 检测到加法结合律，使用: rw [Nat.add_assoc]")
    elif "Nat" in theorem_content and "+" in theorem_content:
        # 其他自然数加法，尝试基本策略
        fixed_content = theorem_content.replace("hole", "simp")
        print(f">>> 检测到自然数加法，使用: simp")
    else:
        # 默认策略
        fixed_content = theorem_content.replace("hole", "sorry")
        print(f">>> 使用默认策略: sorry")
    
    print(f">>> 修复后的内容:")
    print(fixed_content)
    print("=" * 50)
    
    return fixed_content

def test_hole_filling_with_decompose_solver():
    """使用decompose_solver来填充hole"""
    print("\n=== 使用decompose_solver填充hole ===")
    
    # 获取问题
    dataset = "demo" 
    problem_id = "nested_have"
    
    problem = problem_manager.get_problem(dataset, problem_id)
    if not problem:
        print(f"❌ 未找到问题: {dataset}/{problem_id}")
        return False
    
    print(f"✅ 找到问题: {problem.dataset}/{problem.problem_id}")
    print(f"  问题路径: {problem.problem_path}")
    print(f"  header路径: {problem.header_path}")
    print(f"  分解目录: {problem.decomposed_dir}")
    
    # 读取原始问题内容
    try:
        original_content = problem_manager.get_problem_content(problem)
        header_content = problem_manager.get_header_content(problem)
        
        print(f"\n原始问题内容:")
        print(original_content)
        print("-" * 50)
        
        print(f"Header内容:")
        print(header_content)
        print("-" * 50)
        
    except Exception as e:
        print(f"❌ 读取问题内容失败: {e}")
        return False
    
    # 导入decompose_solver
    try:
        print("正在导入decompose_solver...")
        from decompose_hole_and_buildback.decompose_solver import solve_theorem_unified
        print("✅ decompose_solver导入成功")
    except Exception as e:
        print(f"❌ decompose_solver导入失败: {e}")
        import traceback
        traceback.print_exc()
        return False
    
    # 使用solve_theorem_unified处理问题
    try:
        print("\n开始使用solve_theorem_unified处理问题...")
        print("注意：这会调用我们的simple_fix_single_proof回调函数")
        
        fixed_result = solve_theorem_unified(problem, simple_fix_single_proof)
        
        print(f"\n✅ 修复完成！结果:")
        print(fixed_result)
        
        # 保存结果
        output_dir = "minif2f/decompose_solver_results"
        os.makedirs(output_dir, exist_ok=True)
        
        output_file = os.path.join(output_dir, f"fixed_{problem.problem_id.replace('/', '_')}.lean")
        with open(output_file, 'w') as f:
            f.write(fixed_result)
        
        print(f"\n结果已保存到: {output_file}")
        return True
        
    except Exception as e:
        print(f"❌ solve_theorem_unified处理失败: {e}")
        import traceback
        traceback.print_exc()
        return False

def test_check_subproblem_file():
    """检查子问题文件内容"""
    print("\n=== 检查子问题文件 ===")
    
    subproblem_file = "unified_problems/demo/nested_have/decomposed/decomposed_03_h4.lean"
    
    if os.path.exists(subproblem_file):
        with open(subproblem_file, 'r') as f:
            content = f.read()
        print(f"✅ 子问题文件内容:")
        print(content)
        
        # 检查是否包含hole
        if "hole" in content:
            print("✅ 确认文件包含 'hole' 关键字")
        else:
            print("⚠️  文件不包含 'hole' 关键字")
        
        return True
    else:
        print(f"❌ 子问题文件不存在: {subproblem_file}")
        return False

if __name__ == "__main__":
    print("开始测试...")
    
    # 测试1: 检查子问题文件
    success1 = test_check_subproblem_file()
    
    # 测试2: 使用decompose_solver填充hole
    success2 = test_hole_filling_with_decompose_solver()
    
    if success1 and success2:
        print("\n🎉 所有测试成功！")
        print("✅ 成功使用现有的decompose_solver逻辑填充了hole")
    else:
        print("\n❌ 部分测试失败")
        sys.exit(1) 
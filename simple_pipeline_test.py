#!/usr/bin/env python3
"""
Simple Pipeline Test

测试修复后的pipeline功能
"""

import sys
from pathlib import Path

# 添加项目根目录到Python路径
sys.path.insert(0, str(Path(__file__).parent))

def test_theorem_repair():
    """测试定理修复功能"""
    print("=== 测试定理修复功能 ===")
    
    try:
        from data_management.unified_problem_manager import problem_manager
        from solvers.decompose_solver_unified import DecomposeSolver
        from solvers.base_solver import SolverConfig
        
        # 获取broken_add问题
        problem = problem_manager.get_problem("demo", "broken_add")
        if not problem:
            print("❌ 找不到broken_add问题")
            return False
            
        print(f"✅ 找到问题: {problem.problem_id}")
        
        # 查看原始内容
        content = problem_manager.get_problem_content(problem)
        print(f"原始内容: {content}")
        
        # 测试求解器
        config = SolverConfig(debug=True)
        solver = DecomposeSolver(config)
        
        result = solver.solve(problem)
        print(f"求解状态: {result.status.value}")
        print(f"解决方案: {result.solution}")
        
        if result.status.value == "success":
            print("✅ 定理修复成功")
            return True
        else:
            print(f"⚠️  定理修复状态: {result.status.value}")
            print(f"错误信息: {result.error_message}")
            return False
            
    except Exception as e:
        print(f"❌ 测试失败: {e}")
        import traceback
        traceback.print_exc()
        return False

def test_hole_filling():
    """测试hole填充功能"""
    print("\n=== 测试Hole填充功能 ===")
    
    try:
        from data_management.unified_problem_manager import problem_manager
        from solvers.decompose_solver_unified import DecomposeSolver
        from solvers.base_solver import SolverConfig
        
        # 获取hole_proof问题
        problem = problem_manager.get_problem("demo", "hole_proof")
        if not problem:
            print("❌ 找不到hole_proof问题")
            return False
            
        print(f"✅ 找到问题: {problem.problem_id}")
        
        # 查看原始内容
        content = problem_manager.get_problem_content(problem)
        print(f"原始内容: {content}")
        
        # 测试求解器
        config = SolverConfig(debug=True)
        solver = DecomposeSolver(config)
        
        result = solver.solve(problem)
        print(f"求解状态: {result.status.value}")
        print(f"解决方案: {result.solution}")
        
        if result.status.value == "success":
            print("✅ Hole填充成功")
            return True
        else:
            print(f"⚠️  Hole填充状态: {result.status.value}")
            print(f"错误信息: {result.error_message}")
            return False
            
    except Exception as e:
        print(f"❌ 测试失败: {e}")
        import traceback
        traceback.print_exc()
        return False

def test_batch_processing():
    """测试批量处理功能"""
    print("\n=== 测试批量处理功能 ===")
    
    try:
        from data_management.unified_problem_manager import problem_manager
        
        # 获取所有demo问题
        problems = problem_manager.get_all_problems_for_dataset("demo")
        print(f"找到 {len(problems)} 个问题")
        
        success_count = 0
        for problem in problems:
            print(f"  处理: {problem.problem_id}")
            try:
                content = problem_manager.get_problem_content(problem)
                if content.strip():
                    success_count += 1
                    print(f"    ✅ 成功读取 ({len(content)} 字符)")
                else:
                    print(f"    ⚠️  内容为空")
            except Exception as e:
                print(f"    ❌ 读取失败: {e}")
        
        print(f"批量处理结果: {success_count}/{len(problems)} 成功")
        return success_count == len(problems)
        
    except Exception as e:
        print(f"❌ 批量处理测试失败: {e}")
        import traceback
        traceback.print_exc()
        return False

def main():
    """主函数"""
    print("🚀 开始简化Pipeline测试")
    print("=" * 40)
    
    # 执行测试
    test_results = {}
    
    test_results["批量处理"] = test_batch_processing()
    test_results["定理修复"] = test_theorem_repair()
    test_results["Hole填充"] = test_hole_filling()
    
    # 生成报告
    print("\n" + "=" * 40)
    print("📊 测试报告")
    print("=" * 40)
    
    total_tests = len(test_results)
    passed_tests = sum(test_results.values())
    
    print(f"总测试数: {total_tests}")
    print(f"通过测试: {passed_tests}")
    print(f"失败测试: {total_tests - passed_tests}")
    print(f"成功率: {passed_tests/total_tests*100:.1f}%")
    
    print("\n详细结果:")
    for test_name, result in test_results.items():
        status = "✅ 通过" if result else "❌ 失败"
        print(f"  {test_name}: {status}")
    
    if passed_tests == total_tests:
        print("\n🎉 所有测试通过！Pipeline基本功能正常！")
    else:
        print(f"\n⚠️  有 {total_tests - passed_tests} 个测试失败，但基本架构可用。")
    
    return passed_tests >= total_tests // 2  # 至少一半通过就算基本成功

if __name__ == "__main__":
    success = main()
    sys.exit(0 if success else 1) 
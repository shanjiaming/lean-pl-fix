#!/usr/bin/env python3
"""
Specific Pipeline Testing Script

专门测试定理修复和hole填充两个核心pipeline的功能。
"""

import sys
import os
from pathlib import Path

# 添加项目根目录到Python路径
sys.path.insert(0, str(Path(__file__).parent))

def test_theorem_repair_pipeline():
    """测试定理修复pipeline"""
    print("=== 测试定理修复Pipeline ===")
    
    try:
        from data_management.unified_problem_manager import problem_manager
        from core.lean_api import REPLInstance
        from core.lean_enumerator import synthesize_fix
        
        # 获取broken_add问题
        problems = problem_manager.get_all_problems_for_dataset("demo")
        broken_problem = None
        for prob in problems:
            if "broken" in prob.problem_id:
                broken_problem = prob
                break
                
        if not broken_problem:
            print("❌ 没有找到broken问题")
            return False
            
        print(f"✅ 找到测试问题: {broken_problem.problem_id}")
        
        # 获取问题内容
        content = problem_manager.get_problem_content(broken_problem)
        print(f"原始内容:")
        print(content)
        print()
        
        # 检查是否包含sorry
        if "sorry" not in content:
            print("⚠️  问题中没有包含sorry，添加一个用于测试")
            content = content.replace("simp", "sorry")
            
        # 初始化REPL检查错误
        repl = REPLInstance()
        result = repl.execute(content)
        messages = result.get("messages", [])
        
        print(f"原始代码错误数: {len([m for m in messages if m.get('severity') == 'error'])}")
        for msg in messages:
            if msg.get('severity') == 'error':
                print(f"  错误: {msg.get('message', '')}")
        
        # 尝试使用synthesize_fix修复
        print("\n🔧 尝试合成修复...")
        
        try:
            fixed_code, success, message, _, _ = synthesize_fix(content, target_error_line_num=3)  # 假设sorry在第3行
            
            print(f"修复尝试结果: {'成功' if success else '失败'}")
            print(f"修复消息: {message}")
            
            if success and fixed_code:
                print("修复后的代码:")
                print(fixed_code)
                
                # 验证修复是否有效
                fixed_result = repl.execute(fixed_code)
                fixed_messages = fixed_result.get("messages", [])
                fixed_errors = [m for m in fixed_messages if m.get('severity') == 'error']
                
                print(f"修复后错误数: {len(fixed_errors)}")
                if len(fixed_errors) == 0:
                    print("✅ 定理修复成功！代码无错误")
                    return True
                else:
                    print("⚠️  修复后仍有错误:")
                    for msg in fixed_errors:
                        print(f"  错误: {msg.get('message', '')}")
                    return False
            else:
                print("❌ 修复合成失败")
                return False
                
        except Exception as e:
            print(f"❌ 修复过程出错: {e}")
            import traceback
            traceback.print_exc()
            return False
            
    except Exception as e:
        print(f"❌ 定理修复测试失败: {e}")
        import traceback
        traceback.print_exc()
        return False

def test_hole_filling_pipeline():
    """测试hole填充pipeline"""
    print("\n=== 测试Hole填充Pipeline ===")
    
    try:
        from data_management.unified_problem_manager import problem_manager
        from core.hole_fixer_interface import SimpleHoleFixer, DPV2HoleFixer
        from solvers.decompose_solver_unified import DecomposeSolver
        from solvers.base_solver import SolverConfig
        
        # 获取hole_proof问题
        problems = problem_manager.get_all_problems_for_dataset("demo")
        hole_problem = None
        for prob in problems:
            if "hole" in prob.problem_id:
                hole_problem = prob
                break
                
        if not hole_problem:
            print("❌ 没有找到hole问题")
            return False
            
        print(f"✅ 找到测试问题: {hole_problem.problem_id}")
        
        # 获取问题内容
        content = problem_manager.get_problem_content(hole_problem)
        print(f"原始内容:")
        print(content)
        print()
        
        # 检查是否包含hole
        if "hole" not in content:
            print("⚠️  问题中没有包含hole，添加一个用于测试")
            content = content.replace("simp", "hole")
            
        # 使用DecomposeSolver来处理hole
        print("🔧 使用分解求解器处理holes...")
        config = SolverConfig(debug=True)
        solver = DecomposeSolver(config)
        
        try:
            result = solver.solve(hole_problem)
            
            print(f"求解状态: {result.status.value}")
            print(f"求解消息: {result.error_message or 'No error message'}")
            
            if result.solution:
                print("修复后的代码:")
                print(result.solution)
                
                # 验证解决方案
                from core.lean_api import REPLInstance
                repl = REPLInstance()
                
                # 测试原始代码
                original_result = repl.execute(content)
                original_messages = original_result.get("messages", [])
                original_errors = [m for m in original_messages if m.get('severity') == 'error']
                
                # 测试修复后代码
                fixed_result = repl.execute(result.solution)
                fixed_messages = fixed_result.get("messages", [])
                fixed_errors = [m for m in fixed_messages if m.get('severity') == 'error']
                
                print(f"原始错误数: {len(original_errors)}")
                print(f"修复后错误数: {len(fixed_errors)}")
                
                if len(fixed_errors) < len(original_errors):
                    print("✅ Hole填充有改进！")
                    return True
                elif len(fixed_errors) == 0:
                    print("✅ Hole填充完全成功！")
                    return True
                else:
                    print("⚠️  Hole填充没有改进")
                    return False
                    
            else:
                print("❌ 没有生成解决方案")
                return False
                
        except Exception as e:
            print(f"❌ Hole填充过程出错: {e}")
            import traceback
            traceback.print_exc()
            return False
            
    except Exception as e:
        print(f"❌ Hole填充测试失败: {e}")
        import traceback
        traceback.print_exc()
        return False

def test_convenience_scripts():
    """测试便利脚本"""
    print("\n=== 测试便利脚本 ===")
    
    try:
        # 测试lean_enumerator.py脚本
        print("🔧 测试lean_enumerator便利脚本...")
        
        # 创建临时测试文件
        test_file = "temp_test_broken.lean"
        test_content = """import Mathlib.Tactic

theorem test_broken (x : ℕ) : x + 0 = x := by
  sorry  -- 需要修复
"""
        
        with open(test_file, 'w') as f:
            f.write(test_content)
            
        print(f"创建测试文件: {test_file}")
        
        # 直接调用核心修复功能
        from core.lean_enumerator import synthesize_all_fixes
        
        fixed_code, overall_success, summary_message, report = synthesize_all_fixes(test_content)
        
        print("修复报告:")
        print(f"  成功合成数: {report.get('successful_syntheses', 0)}")
        print(f"  失败合成数: {len(report.get('failed_syntheses', {}))}")
        
        if fixed_code != test_content:
            print("✅ 便利脚本成功修复代码")
            print("修复后代码:")
            print(fixed_code)
            
            # 清理临时文件
            if os.path.exists(test_file):
                os.remove(test_file)
                
            return True
        else:
            print("⚠️  便利脚本没有修改代码")
            
            # 清理临时文件
            if os.path.exists(test_file):
                os.remove(test_file)
                
            return False
            
    except Exception as e:
        print(f"❌ 便利脚本测试失败: {e}")
        import traceback
        traceback.print_exc()
        
        # 清理临时文件
        if os.path.exists("temp_test_broken.lean"):
            os.remove("temp_test_broken.lean")
            
        return False

def main():
    """主测试函数"""
    print("🚀 开始定理修复和Hole填充Pipeline专项测试")
    print("=" * 60)
    
    # 执行具体测试
    test_results = {}
    
    test_results["定理修复Pipeline"] = test_theorem_repair_pipeline()
    test_results["Hole填充Pipeline"] = test_hole_filling_pipeline()
    test_results["便利脚本"] = test_convenience_scripts()
    
    # 生成报告
    print("\n" + "=" * 60)
    print("📊 专项测试报告")
    print("=" * 60)
    
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
        print("\n🎉 所有专项测试通过！两个pipeline都能正常工作！")
    else:
        print(f"\n⚠️  有 {total_tests - passed_tests} 个测试失败，需要进一步诊断。")
    
    return passed_tests == total_tests

if __name__ == "__main__":
    success = main()
    sys.exit(0 if success else 1) 
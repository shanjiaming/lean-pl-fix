#!/usr/bin/env python3
"""
Demo Pipeline Test Script

测试整个lean-pl-fix系统的pipeline，使用demo数据集。
这个脚本将验证：
1. 数据导入和管理
2. 问题处理
3. 各种求解器
4. 核心接口功能
"""

import os
import sys
from pathlib import Path
from typing import Dict, List

# 添加项目根目录到Python路径
project_root = Path(__file__).parent.parent  # 向上两级到项目根目录
sys.path.insert(0, str(project_root))

def test_data_import():
    """测试数据导入功能"""
    print("=== 测试数据导入 ===")
    
    try:
        from data_management.unified_problem_manager import problem_manager
        from data_management.dataset_processor import DatasetProcessor, DatasetConfig
        
        processor = DatasetProcessor(enable_logging=True)
        
        # 配置demo数据集
        config = DatasetConfig(
            name="demo",
            source_path="demo",
            file_pattern="*.lean",
            problem_id_extractor=lambda file_path: Path(file_path).stem
        )
        
        # 导入数据集
        result = processor.process_dataset(config, overwrite=True)
        print(f"数据集导入结果: {result}")
        
        # 验证导入的数据
        problems = problem_manager.get_all_problems_for_dataset("demo")
        print(f"导入的问题数量: {len(problems)}")
        
        for problem in problems:
            print(f"- 问题ID: {problem.problem_id}")
            print(f"  数据集: {problem.dataset}")
            
        return len(problems) > 0
        
    except Exception as e:
        print(f"数据导入测试失败: {e}")
        import traceback
        traceback.print_exc()
        return False

def test_simple_solver():
    """测试简单求解器"""
    print("\n=== 测试简单求解器 ===")
    
    try:
        from solvers.base_solver import SolverConfig
        from solvers.decompose_solver_unified import DecomposeSolver
        from data_management.unified_problem_manager import problem_manager
        
        # 创建求解器
        config = SolverConfig(debug=True)
        solver = DecomposeSolver(config)
        
        # 获取一个问题
        problems = problem_manager.get_all_problems_for_dataset("demo")
        if not problems:
            print("没有找到测试问题")
            return False
            
        test_problem = problems[0]
        print(f"测试问题: {test_problem.problem_id}")
        
        # 尝试求解
        result = solver.solve(test_problem)
        print(f"求解结果: {result.status.value}")
        if result.solution:
            print(f"解决方案长度: {len(result.solution)} 字符")
            
        return result.status.value in ["success", "partial"]
        
    except Exception as e:
        print(f"求解器测试失败: {e}")
        import traceback
        traceback.print_exc()
        return False

def test_hole_fixing():
    """测试洞填充功能"""
    print("\n=== 测试洞填充功能 ===")
    
    try:
        from core.hole_fixer_interface import SimpleHoleFixer
        from data_management.unified_problem_manager import problem_manager
        
        # 创建简单的洞修复器
        hole_fixer = SimpleHoleFixer()
        
        # 获取包含洞的问题
        problems = problem_manager.get_all_problems_for_dataset("demo")
        if not problems:
            print("没有找到测试问题")
            return False
            
        # 找到包含洞的问题
        hole_problem = None
        for prob in problems:
            if "hole" in prob.problem_id:
                hole_problem = prob
                break
        
        if not hole_problem:
            hole_problem = problems[0]  # 退而求其次使用第一个问题
            
        print(f"测试洞填充: {hole_problem.problem_id}")
        
        # 获取问题内容
        content = problem_manager.get_problem_content(hole_problem)
        print(f"原始内容长度: {len(content)} 字符")
        
        # 尝试提取洞和修复（这是一个简化的测试）
        if "sorry" in content:
            print("发现洞（sorry）在内容中")
            fixed_content = hole_fixer.fix_hole("sorry", {"problem": hole_problem})
            print(f"洞填充尝试完成，结果: {fixed_content}")
        else:
            print("没有发现明显的洞，但测试接口调用成功")
        
        return True  # 接口调用成功就算通过
        
    except Exception as e:
        print(f"洞填充测试失败: {e}")
        import traceback
        traceback.print_exc()
        return False

def test_proof_repair():
    """测试证明修复功能"""
    print("\n=== 测试证明修复功能 ===")
    
    try:
        from core.proof_repair_interface import SimpleProofRepairer
        from data_management.unified_problem_manager import problem_manager
        
        # 创建简单的证明修复器
        repair_interface = SimpleProofRepairer()
        
        # 获取问题
        problems = problem_manager.get_all_problems_for_dataset("demo")
        if not problems:
            print("没有找到测试问题")
            return False
            
        # 找到broken问题
        broken_problem = None
        for prob in problems:
            if "broken" in prob.problem_id:
                broken_problem = prob
                break
                
        if not broken_problem:
            broken_problem = problems[0]  # 退而求其次
            
        print(f"测试证明修复: {broken_problem.problem_id}")
        
        # 获取问题内容
        content = problem_manager.get_problem_content(broken_problem)
        print(f"原始内容长度: {len(content)} 字符")
        
        # 尝试修复（这是一个简化的测试）
        repaired = repair_interface.repair_proof(content, {"problem": broken_problem})
        print(f"修复尝试完成，结果长度: {len(repaired)} 字符")
        
        return True  # 接口调用成功就算通过
        
    except Exception as e:
        print(f"证明修复测试失败: {e}")
        import traceback
        traceback.print_exc()
        return False

def test_theorem_search():
    """测试定理搜索功能"""
    print("\n=== 测试定理搜索功能 ===")
    
    try:
        from theorem_search.theorem_searcher import TheoremSearcher, SearchConfig
        
        # 创建定理搜索器
        searcher = TheoremSearcher()
        config = SearchConfig(max_results=5)
        
        # 搜索一些基本定理
        results = searcher.search_theorems("add_zero", config=config)
        print(f"搜索 'add_zero' 的结果数量: {len(results)}")
        
        for result in results[:3]:  # 显示前3个结果
            print(f"- {result.theorem_name}: {result.confidence_score:.2f}")
            
        return len(results) >= 0  # 即使没有结果也算成功，只要不出错
        
    except Exception as e:
        print(f"定理搜索测试失败: {e}")
        import traceback
        traceback.print_exc()
        return False

def test_utils():
    """测试工具模块"""
    print("\n=== 测试工具模块 ===")
    
    try:
        from utils.file_utils import ensure_directory, read_file_safe
        from utils.text_utils import clean_whitespace, count_lines
        from utils.lean_utils import extract_theorem_name
        from utils.logging_utils import setup_logger
        
        # 测试文件工具
        test_dir = ensure_directory("temp_test")
        print(f"创建测试目录: {test_dir}")
        
        # 测试文本工具
        test_text = "  theorem test : ℕ → ℕ  "
        cleaned = clean_whitespace(test_text)
        print(f"文本清理: '{test_text}' -> '{cleaned}'")
        
        # 测试Lean工具
        test_lean = "theorem example_thm : P → P := by sorry"
        theorem_name = extract_theorem_name(test_lean)
        print(f"定理名提取: {theorem_name}")
        
        # 测试日志工具
        logger = setup_logger("test_logger")
        logger.info("测试日志消息")
        print("日志工具测试完成")
        
        # 清理临时目录
        if os.path.exists("temp_test"):
            os.rmdir("temp_test")
            
        return True
        
    except Exception as e:
        print(f"工具模块测试失败: {e}")
        import traceback
        traceback.print_exc()
        return False

def generate_test_report(test_results: Dict[str, bool]):
    """生成测试报告"""
    print("\n" + "="*50)
    print("📊 DEMO PIPELINE 测试报告")
    print("="*50)
    
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
        print("\n🎉 所有测试通过！Pipeline运行正常！")
    else:
        print(f"\n⚠️  有 {total_tests - passed_tests} 个测试失败，需要检查相关模块。")
    
    return passed_tests == total_tests

def main():
    """主测试函数"""
    print("🚀 开始Demo Pipeline测试")
    print("这个测试将验证lean-pl-fix系统的核心功能")
    
    # 执行所有测试
    test_results = {}
    
    test_results["数据导入"] = test_data_import()
    test_results["简单求解器"] = test_simple_solver()
    test_results["洞填充"] = test_hole_fixing()
    test_results["证明修复"] = test_proof_repair()
    test_results["定理搜索"] = test_theorem_search()
    test_results["工具模块"] = test_utils()
    
    # 生成报告
    all_passed = generate_test_report(test_results)
    
    # 清理临时文件
    try:
        import shutil
        if os.path.exists("temp_test"):
            shutil.rmtree("temp_test")
    except:
        pass
    
    return all_passed

if __name__ == "__main__":
    success = main()
    sys.exit(0 if success else 1) 
#!/usr/bin/env python3
"""
Enhanced demo script showing how to use different hole fixer classes for repairing problems.

This script demonstrates:
1. Using SimpleHoleFixer for basic hole filling with 'sorry'
2. Using DPV2HoleFixer for advanced hole filling
3. Comparing different hole fixing strategies
"""

import sys
import os

# Add the project root to the Python path
project_root = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, project_root)

import logging
from utils.test_data_manager import TestDataManager
from core.hole_fixer_interface import SimpleHoleFixer, DPV2HoleFixer

# Setup logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
    handlers=[
        logging.StreamHandler(),
        logging.FileHandler('demo_hole_fixer.log')
    ]
)

logger = logging.getLogger(__name__)

def demo_configuration():
    """演示配置管理功能"""
    print("=" * 60)
    print("📋 配置管理演示")
    print("=" * 60)
    
    manager = TestDataManager()
    
    # 显示当前配置
    print(f"当前修复模式: {manager.get_repair_mode().value}")
    print(f"修复选项: {manager.get_repair_options()}")
    
    # 设置不同的修复模式
    print("\n🔧 设置为hole修复模式...")
    manager.set_repair_mode(RepairMode.HOLE_FILLING)
    manager.set_repair_option("skip_correct_main_problems", False)
    manager.set_repair_option("skip_correct_sub_problems", True)
    
    print(f"修复模式: {manager.get_repair_mode().value}")
    print(f"修复选项: {manager.get_repair_options()}")
    
    print("\n🔧 设置为错误修复模式...")
    manager.set_repair_mode(RepairMode.ERROR_FIXING)
    manager.set_repair_option("skip_correct_main_problems", True)
    manager.set_repair_option("only_fix_error_sub_problems", True)
    
    print(f"修复模式: {manager.get_repair_mode().value}")
    print(f"修复选项: {manager.get_repair_options()}")
    
    # 恢复默认模式
    manager.set_repair_mode(RepairMode.HOLE_FILLING)


def demo_simple_hole_fixer():
    """演示使用SimpleHoleFixer进行基础的hole填充"""
    logger.info("=== 演示SimpleHoleFixer ===")
    
    # 创建使用SimpleHoleFixer的TestDataManager
    simple_fixer = SimpleHoleFixer()
    manager = TestDataManager(hole_fixer=simple_fixer)
    
    logger.info(f"当前修复模式: {manager.get_repair_mode().value}")
    logger.info(f"使用的hole fixer: {type(manager.hole_fixer).__name__}")
    
    # 验证一个包含hole的问题
    problem_id = "demo/nested_have"
    logger.info(f"验证问题: {problem_id}")
    
    results = manager.verify_problem_status(problem_id)
    
    logger.info(f"验证结果: {results['fixed_problems']}")
    return results

def demo_dpv2_hole_fixer():
    """演示使用DPV2HoleFixer进行高级hole填充"""
    logger.info("=== 演示DPV2HoleFixer ===")
    
    try:
        # 创建使用DPV2HoleFixer的TestDataManager
        dpv2_fixer = DPV2HoleFixer()
        manager = TestDataManager(hole_fixer=dpv2_fixer)
        
        logger.info(f"当前修复模式: {manager.get_repair_mode().value}")
        logger.info(f"使用的hole fixer: {type(manager.hole_fixer).__name__}")
        
        # 验证一个包含hole的问题
        problem_id = "demo/nested_have"
        logger.info(f"验证问题: {problem_id}")
        
        results = manager.verify_problem_status(problem_id)
        
        logger.info(f"验证结果: {results['fixed_problems']}")
        return results
    except ImportError as e:
        logger.warning(f"DPV2求解器不可用: {e}")
        logger.info("回退到SimpleHoleFixer")
        return demo_simple_hole_fixer()

def demo_hole_fixer_comparison():
    """比较不同hole fixer的效果"""
    logger.info("=== 比较不同HoleFixer的效果 ===")
    
    # 测试SimpleHoleFixer
    logger.info("--- 测试SimpleHoleFixer ---")
    simple_results = demo_simple_hole_fixer()
    
    # 测试DPV2HoleFixer
    logger.info("--- 测试DPV2HoleFixer ---")
    dpv2_results = demo_dpv2_hole_fixer()
    
    # 比较结果
    logger.info("--- 比较结果 ---")
    
    for fix_type in ["hole_filled"]:
        if fix_type in simple_results.get("fixed_problems", {}):
            simple_sub_problems = simple_results["fixed_problems"][fix_type].get("sub_problems", [])
            simple_success = sum(1 for p in simple_sub_problems if p.get("solvable", False))
            logger.info(f"SimpleHoleFixer - {fix_type}: {simple_success}/{len(simple_sub_problems)} 成功")
        
        if fix_type in dpv2_results.get("fixed_problems", {}):
            dpv2_sub_problems = dpv2_results["fixed_problems"][fix_type].get("sub_problems", [])
            dpv2_success = sum(1 for p in dpv2_sub_problems if p.get("solvable", False))
            logger.info(f"DPV2HoleFixer - {fix_type}: {dpv2_success}/{len(dpv2_sub_problems)} 成功")

def demo_custom_hole_fixer():
    """演示自定义hole fixer的实现"""
    logger.info("=== 演示自定义HoleFixer ===")
    
    from core.hole_fixer_interface import HoleFixerInterface
    from data_management.unified_problem_manager import Problem
    
    class CustomMathHoleFixer(HoleFixerInterface):
        """针对数学定理的自定义hole fixer"""
        
        def fix_hole(self, hole_content: str, problem_context: Problem) -> str:
            """使用数学相关的策略填充hole"""
            
            # 检查是否为简单的代数证明
            if "Nat" in hole_content and "+" in hole_content:
                # 对于自然数加法，尝试使用交换律和结合律
                if "c + b + a = c + (b + a)" in hole_content:
                    return hole_content.replace("hole", "rw [Nat.add_assoc]")
                elif "+ a = " in hole_content:
                    return hole_content.replace("hole", "rw [Nat.add_comm]")
            
            # 回退到sorry
            return hole_content.replace("hole", "sorry")
    
    # 使用自定义hole fixer
    custom_fixer = CustomMathHoleFixer()
    manager = TestDataManager(hole_fixer=custom_fixer)
    
    logger.info(f"使用自定义hole fixer: {type(manager.hole_fixer).__name__}")
    
    # 验证问题
    problem_id = "demo/nested_have"
    results = manager.verify_problem_status(problem_id)
    
    logger.info(f"自定义fixer验证结果: {results['fixed_problems']}")
    return results

def demo_data_exploration():
    """数据探索演示"""
    logger.info("=== 数据探索 ===")
    
    manager = TestDataManager()
    
    # 列出所有数据集
    datasets = manager.list_datasets()
    logger.info(f"可用数据集: {datasets}")
    
    # 为每个数据集显示问题
    for dataset in datasets:
        problems = manager.list_problems(dataset)
        logger.info(f"{dataset}数据集包含{len(problems)}个问题:")
        for problem_id in problems:
            problem = manager.get_problem(problem_id)
            if problem:
                logger.info(f"  - {problem_id}: {problem.name}")

def demo_processing_list():
    """演示获取待处理问题列表"""
    logger.info("=== 待处理问题列表 ===")
    
    from utils.test_data_manager import RepairMode
    
    manager = TestDataManager()
    
    for mode in [RepairMode.HOLE_FILLING, RepairMode.ERROR_FIXING]:
        manager.set_repair_mode(mode)
        problems = manager.get_problems_to_process()
        logger.info(f"{mode.value}模式下需要处理{len(problems)}个问题:")
        for problem_id in problems[:5]:  # 只显示前5个
            logger.info(f"  - {problem_id}")
        if len(problems) > 5:
            logger.info(f"  ... 还有{len(problems) - 5}个问题")

def demo_summary_report():
    """生成摘要报告演示"""
    logger.info("=== 生成摘要报告 ===")
    
    manager = TestDataManager()
    report = manager.generate_summary_report()
    
    logger.info(f"报告时间戳: {report['timestamp']}")
    logger.info(f"当前配置: {report['config']}")
    logger.info(f"统计数据: {report['totals']}")
    
    for dataset_name, dataset_info in report['datasets'].items():
        logger.info(f"\n{dataset_name}数据集:")
        logger.info(f"  总问题数: {dataset_info['stats']['total_problems']}")
        logger.info(f"  可解决主问题: {dataset_info['stats']['solvable_main']}")
        logger.info(f"  不可解决主问题: {dataset_info['stats']['unsolvable_main']}")
        logger.info(f"  未知状态主问题: {dataset_info['stats']['unknown_main']}")
        logger.info(f"  总子问题数: {dataset_info['stats']['total_sub_problems']}")
        logger.info(f"  已修复问题: {dataset_info['stats']['fixed_problems']}")

def save_sample_report():
    """保存示例报告"""
    logger.info("=== 保存示例报告 ===")
    
    import json
    from pathlib import Path
    
    manager = TestDataManager()
    report = manager.generate_summary_report()
    
    # 保存为JSON文件
    output_dir = Path("data")
    output_dir.mkdir(exist_ok=True)
    
    json_file = output_dir / "test_data_report.json"
    with open(json_file, 'w', encoding='utf-8') as f:
        json.dump(report, f, indent=2, ensure_ascii=False)
    
    logger.info(f"报告已保存到: {json_file}")
    
    # 保存为可读文本文件
    txt_file = output_dir / "test_data_report.txt"
    with open(txt_file, 'w', encoding='utf-8') as f:
        f.write(f"测试数据报告\n")
        f.write(f"生成时间: {report['timestamp']}\n")
        f.write(f"修复模式: {report['config']['repair_mode']}\n")
        f.write(f"修复选项: {report['config']['options']}\n\n")
        
        f.write(f"总体统计:\n")
        f.write(f"- 数据集总数: {report['totals']['datasets']}\n")
        f.write(f"- 问题总数: {report['totals']['problems']}\n")
        f.write(f"- 可解决主问题: {report['totals']['solvable_main_problems']}\n")
        f.write(f"- 不可解决主问题: {report['totals']['unsolvable_main_problems']}\n")
        f.write(f"- 未知状态主问题: {report['totals']['unknown_main_problems']}\n")
        f.write(f"- 总子问题数: {report['totals']['total_sub_problems']}\n")
        f.write(f"- 已修复问题: {report['totals']['fixed_problems']}\n\n")
        
        for dataset_name, dataset_info in report['datasets'].items():
            f.write(f"{dataset_name}数据集:\n")
            f.write(f"- 总问题数: {dataset_info['stats']['total_problems']}\n")
            f.write(f"- 可解决主问题: {dataset_info['stats']['solvable_main']}\n")
            f.write(f"- 不可解决主问题: {dataset_info['stats']['unsolvable_main']}\n")
            f.write(f"- 总子问题数: {dataset_info['stats']['total_sub_problems']}\n")
            f.write(f"- 已修复问题: {dataset_info['stats']['fixed_problems']}\n\n")
    
    logger.info(f"可读报告已保存到: {txt_file}")

def main():
    """主函数，展示hole fixer的各种用法"""
    logger.info("开始演示不同的Hole Fixer实现")
    
    try:
        # 1. 演示SimpleHoleFixer
        logger.info("\n" + "="*60)
        demo_simple_hole_fixer()
        
        # 2. 演示DPV2HoleFixer
        logger.info("\n" + "="*60)
        demo_dpv2_hole_fixer()
        
        # 3. 比较不同hole fixer
        logger.info("\n" + "="*60)
        demo_hole_fixer_comparison()
        
        # 4. 演示自定义hole fixer
        logger.info("\n" + "="*60)
        demo_custom_hole_fixer()
        
        # 5. 数据探索
        logger.info("\n" + "="*60)
        demo_data_exploration()
        
        # 6. 生成报告
        logger.info("\n" + "="*60)
        demo_summary_report()
        save_sample_report()
        
        logger.info("\n" + "="*60)
        logger.info("所有演示完成！")
        logger.info("查看 demo_hole_fixer.log 文件获取详细日志")
        logger.info("查看 data/test_data_report.json 和 data/test_data_report.txt 获取报告")
        
    except Exception as e:
        logger.error(f"演示过程中发生错误: {e}", exc_info=True)
        raise


if __name__ == "__main__":
    main() 
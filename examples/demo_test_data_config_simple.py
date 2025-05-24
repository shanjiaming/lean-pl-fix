#!/usr/bin/env python3
"""
简化版测试数据配置系统演示
跳过验证功能，专注于配置管理和数据浏览
"""

import sys
import json
from pathlib import Path

# 添加项目根目录到Python路径
sys.path.append(str(Path(__file__).parent.parent))

from utils.test_data_manager import TestDataManager, RepairMode
import logging

# 配置日志
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')


def demo_configuration():
    """演示配置管理功能"""
    print("============================================================")
    print("📋 配置管理演示")
    print("============================================================")
    
    manager = TestDataManager()
    
    # 显示当前配置
    current_mode = manager.get_repair_mode()
    current_options = manager.get_repair_options()
    print(f"当前修复模式: {current_mode.value}")
    print(f"修复选项: {current_options}")
    
    # 设置为hole修复模式
    print(f"\n🔧 设置为hole修复模式...")
    manager.set_repair_mode(RepairMode.HOLE_FILLING)
    print(f"修复模式: {manager.get_repair_mode().value}")
    print(f"修复选项: {manager.get_repair_options()}")
    
    # 设置为错误修复模式
    print(f"\n🔧 设置为错误修复模式...")
    manager.set_repair_mode(RepairMode.ERROR_FIXING)
    print(f"修复模式: {manager.get_repair_mode().value}")
    print(f"修复选项: {manager.get_repair_options()}")


def demo_data_exploration():
    """演示数据浏览功能"""
    print("============================================================")
    print("🔍 数据浏览演示")
    print("============================================================")
    
    manager = TestDataManager()
    
    # 列出所有数据集
    datasets = manager.list_datasets()
    print(f"可用数据集: {datasets}")
    
    # 浏览demo数据集
    demo_problems = manager.list_problems("demo")
    print(f"\n📁 demo 数据集:")
    print(f"  问题数量: {len(demo_problems)}")
    print(f"  问题列表: {demo_problems}")
    
    # 查看几个具体问题的详细信息
    for problem_id in demo_problems[:3]:  # 只看前三个
        problem = manager.get_problem(problem_id)
        print(f"\n  📄 {problem_id}:")
        print(f"    描述: {problem.main_problem.description}")
        print(f"    原始可解决: {problem.main_problem.original_solvable}")
        print(f"    分解问题数: {problem.decomposed_problems.get('count', 0)}")
        
        # 检查修复状态
        if 'hole_filled' in problem.fixed_problems and problem.fixed_problems['hole_filled'].main_problem:
            print(f"    hole修复: 是")
        else:
            print(f"    hole修复: 否")
            
        if 'error_fixed' in problem.fixed_problems and problem.fixed_problems['error_fixed'].main_problem:
            print(f"    错误修复: 是")
        else:
            print(f"    错误修复: 否")


def demo_processing_list():
    """演示获取待处理问题列表"""
    print("============================================================")
    print("📝 待处理问题列表演示")
    print("============================================================")
    
    manager = TestDataManager()
    
    # 在不同模式下获取待处理问题
    modes = [RepairMode.HOLE_FILLING, RepairMode.ERROR_FIXING]
    
    for mode in modes:
        print(f"\n🔧 {mode.value} 模式:")
        manager.set_repair_mode(mode)
        
        # 显示当前选项
        options = manager.get_repair_options()
        print(f"  选项: {options}")
        
        # 获取待处理问题
        problems = manager.get_problems_to_process()
        print(f"  待处理问题 ({len(problems)}个):")
        for problem_id in problems:
            print(f"    - {problem_id}")
        
        # 尝试修改选项
        if mode == RepairMode.HOLE_FILLING:
            print(f"\n  📋 修改选项: skip_correct_main_problems = True")
            manager.set_repair_option("skip_correct_main_problems", True)
            problems_filtered = manager.get_problems_to_process()
            print(f"  修改后待处理问题 ({len(problems_filtered)}个):")
            for problem_id in problems_filtered:
                print(f"    - {problem_id}")


def demo_summary_report():
    """演示摘要报告功能"""
    print("============================================================")
    print("📊 摘要报告演示")
    print("============================================================")
    
    manager = TestDataManager()
    
    # 生成报告
    report = manager.generate_summary_report()
    
    print(f"报告时间: {report['timestamp']}")
    print(f"当前配置:")
    print(f"  修复模式: {report['config']['repair_mode']}")
    print(f"  选项: {report['config']['options']}")
    
    print(f"\n📈 总体统计:")
    totals = report['totals']
    print(f"  数据集数量: {totals['datasets']}")
    print(f"  总问题数: {totals['problems']}")
    print(f"  可解决主问题: {totals['solvable_main_problems']}")
    print(f"  不可解决主问题: {totals['unsolvable_main_problems']}")
    print(f"  未知状态主问题: {totals['unknown_main_problems']}")
    print(f"  总子问题数: {totals['total_sub_problems']}")
    print(f"  已修复问题: {totals['fixed_problems']}")
    
    print(f"\n📁 各数据集详情:")
    for dataset_name, dataset_info in report['datasets'].items():
        stats = dataset_info['stats']
        print(f"  {dataset_name}: {dataset_info['description']}")
        print(f"    问题数: {stats['total_problems']}")
        print(f"    可解决: {stats['solvable_main']}, 不可解决: {stats['unsolvable_main']}, 未知: {stats['unknown_main']}")
        print(f"    子问题数: {stats['total_sub_problems']}")
        print(f"    已修复: {stats['fixed_problems']}")
        
        # 显示问题详情
        if dataset_info['problems']:
            print(f"    问题列表:")
            for problem_info in dataset_info['problems']:
                status_icon = "✅" if problem_info['main_problem_solvable'] is True else "❌" if problem_info['main_problem_solvable'] is False else "❓"
                print(f"      {status_icon} {problem_info['id']} (分解:{problem_info['decomposed_count']}, hole修复:{problem_info['has_hole_fix']}, 错误修复:{problem_info['has_error_fix']})")


def save_sample_report():
    """保存示例报告到文件"""
    print("============================================================")
    print("💾 保存示例报告")
    print("============================================================")
    
    manager = TestDataManager()
    
    # 生成报告
    report = manager.generate_summary_report()
    
    # 保存到文件
    report_path = "data/test_data_report.json"
    Path(report_path).parent.mkdir(exist_ok=True)
    
    with open(report_path, 'w', encoding='utf-8') as f:
        json.dump(report, f, ensure_ascii=False, indent=2)
    
    print(f"报告已保存到: {report_path}")
    
    # 同时保存一个简化的文本版本
    text_report_path = "data/test_data_summary.txt"
    with open(text_report_path, 'w', encoding='utf-8') as f:
        f.write("Lean证明修复系统 - 测试数据摘要\n")
        f.write("=" * 50 + "\n\n")
        f.write(f"报告时间: {report['timestamp']}\n")
        f.write(f"修复模式: {report['config']['repair_mode']}\n\n")
        
        f.write("总体统计:\n")
        totals = report['totals']
        f.write(f"  数据集数量: {totals['datasets']}\n")
        f.write(f"  总问题数: {totals['problems']}\n")
        f.write(f"  可解决主问题: {totals['solvable_main_problems']}\n")
        f.write(f"  不可解决主问题: {totals['unsolvable_main_problems']}\n")
        f.write(f"  未知状态主问题: {totals['unknown_main_problems']}\n")
        f.write(f"  总子问题数: {totals['total_sub_problems']}\n")
        f.write(f"  已修复问题: {totals['fixed_problems']}\n\n")
        
        f.write("各数据集详情:\n")
        for dataset_name, dataset_info in report['datasets'].items():
            stats = dataset_info['stats']
            f.write(f"  {dataset_name}: {dataset_info['description']}\n")
            f.write(f"    问题数: {stats['total_problems']}\n")
            f.write(f"    可解决: {stats['solvable_main']}, 不可解决: {stats['unsolvable_main']}, 未知: {stats['unknown_main']}\n")
            f.write(f"    子问题数: {stats['total_sub_problems']}\n")
            f.write(f"    已修复: {stats['fixed_problems']}\n")
    
    print(f"文本摘要已保存到: {text_report_path}")


def main():
    """主函数"""
    try:
        print("🚀 Lean证明修复系统 - 测试数据配置演示（简化版）")
        print("这个演示展示了如何使用测试数据管理器来管理和配置测试数据")
        
        # 运行各个演示
        demo_configuration()
        demo_data_exploration()
        demo_processing_list()
        demo_summary_report()
        save_sample_report()
        
        print("\n" + "=" * 60)
        print("✅ 演示完成！")
        print("配置文件: config/test_data_config.json")
        print("报告文件: data/test_data_report.json")
        print("文本摘要: data/test_data_summary.txt")
        print("=" * 60)
        
    except Exception as e:
        print(f"❌ 演示过程中出现错误: {e}")
        import traceback
        traceback.print_exc()


if __name__ == "__main__":
    main() 
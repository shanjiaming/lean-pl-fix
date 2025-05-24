#!/usr/bin/env python3
"""
Demo Tiny Dataset Configuration

用于快速配置和导入demo数据集的脚本。
"""

import sys
import os
from pathlib import Path

# 添加项目路径
project_root = Path(__file__).parent.parent  # 向上两级到项目根目录
sys.path.insert(0, str(project_root))

def setup_demo_dataset():
    """设置demo数据集"""
    print("🔧 配置Demo Tiny数据集...")
    
    try:
        from data_management.unified_problem_manager import problem_manager, ProblemMetadata
        from data_management.dataset_processor import DatasetProcessor, DatasetConfig
        
        # 创建数据集处理器
        processor = DatasetProcessor(enable_logging=False)
        
        # 定义数据集配置
        config = DatasetConfig(
            name="demo",
            source_path="demo",
            file_pattern="*.lean",
            problem_id_extractor=lambda path: Path(path).stem
        )
        
        # 处理数据集
        print("导入数据集文件...")
        result = processor.process_dataset(config, overwrite=True)
        
        print(f"✅ 数据集导入完成:")
        print(f"   - 处理文件数: {result.get('processed_files', 0)}")
        print(f"   - 成功导入: {result.get('successful_imports', 0)}")
        
        # 验证导入结果
        problems = problem_manager.get_all_problems_for_dataset("demo")
        print(f"   - 总问题数: {len(problems)}")
        
        # 显示问题列表
        print("\n📋 导入的问题:")
        for problem in problems:
            print(f"   - {problem.problem_id} ({problem.dataset})")
            
        return True
        
    except Exception as e:
        print(f"❌ 配置失败: {e}")
        return False

def create_test_metadata():
    """为测试问题创建元数据"""
    print("\n📝 创建测试元数据...")
    
    try:
        from data_management.metadata_manager import MetadataManager, AnnotationEntry
        from datetime import datetime
        
        metadata_manager = MetadataManager(enable_logging=False)
        
        # 为每个问题添加元数据
        test_problems = [
            ("simple_add", "basic", ["arithmetic", "addition"]),
            ("simple_mul", "basic", ["arithmetic", "multiplication"]),
            ("simple_refl", "trivial", ["equality", "reflexivity"]),
            ("broken_add", "basic", ["arithmetic", "broken"]),
            ("hole_proof", "intermediate", ["holes", "commutativity"])
        ]
        
        for problem_id, difficulty, tags in test_problems:
            # 添加难度标注
            metadata_manager.annotate_difficulty(
                "demo", problem_id, difficulty, 
                "system", confidence=1.0, notes="Auto-generated for demo"
            )
            
            # 添加标签
            for tag in tags:
                metadata_manager.add_tag(
                    "demo", problem_id, tag, "system"
                )
                
            # 添加状态
            status = "pass" if problem_id.startswith("simple") else "fail"
            metadata_manager.annotate_status(
                "demo", problem_id, status, "system"
            )
        
        print("✅ 元数据创建完成")
        return True
        
    except Exception as e:
        print(f"❌ 元数据创建失败: {e}")
        return False

def validate_setup():
    """验证设置是否正确"""
    print("\n🔍 验证设置...")
    
    try:
        from data_management.unified_problem_manager import problem_manager
        
        # 检查问题管理器
        problems = problem_manager.get_all_problems_for_dataset("demo")
        if not problems:
            print("❌ 没有找到任何问题")
            return False
            
        # 检查文件是否存在
        all_exist = True
        for problem in problems:
            if not problem.exists():
                print(f"❌ 问题文件不存在: {problem.problem_id}")
                all_exist = False
            else:
                # 检查内容
                content = problem_manager.get_problem_content(problem)
                if not content.strip():
                    print(f"❌ 问题内容为空: {problem.problem_id}")
                    all_exist = False
                    
        if all_exist:
            print("✅ 所有问题文件验证通过")
            
        # 显示统计信息
        stats = problem_manager.get_statistics()
        print(f"\n📊 统计信息:")
        print(f"   - 总数据集: {stats.get('total_datasets', 0)}")
        print(f"   - 总问题数: {stats.get('total_problems', 0)}")
        print(f"   - demo问题数: {len(problems)}")
        
        return all_exist
        
    except Exception as e:
        print(f"❌ 验证失败: {e}")
        return False

def main():
    """主函数"""
    print("🚀 Demo Tiny数据集配置脚本")
    print("=" * 40)
    
    # 执行配置步骤
    success = True
    
    success &= setup_demo_dataset()
    success &= create_test_metadata()
    success &= validate_setup()
    
    print("\n" + "=" * 40)
    if success:
        print("🎉 Demo数据集配置完成！")
        print("现在可以运行 test_demo_pipeline.py 来测试整个系统。")
    else:
        print("❌ 配置过程中出现错误，请检查上述信息。")
    
    return success

if __name__ == "__main__":
    success = main()
    sys.exit(0 if success else 1) 
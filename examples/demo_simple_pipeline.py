#!/usr/bin/env python3
"""
简化的Lean证明修复Pipeline演示
专注于展示分解solver对包含have嵌套结构问题的处理能力
"""

import logging
import json
import os
from datetime import datetime
from pathlib import Path

# 导入必要的类
from data_management.unified_problem_manager import Problem, UnifiedProblemManager
from solvers.decompose_solver_unified import DecomposeSolver

def setup_logging():
    """设置日志"""
    # 创建日志目录
    log_dir = Path("demo_pipeline_logs")
    log_dir.mkdir(exist_ok=True)
    
    # 设置日志文件
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    log_file = log_dir / f"simple_pipeline_{timestamp}.log"
    
    # 配置日志
    logging.basicConfig(
        level=logging.INFO,
        format='%(asctime)s - %(levelname)s - %(message)s',
        handlers=[
            logging.FileHandler(log_file, encoding='utf-8'),
            logging.StreamHandler()
        ]
    )
    
    return str(log_file)

def load_demo_problems():
    """加载有意义的demo问题（包含have嵌套）"""
    with open('data/unified_problems_metadata.json', 'r') as f:
        all_metadata = json.load(f)
    
    # 筛选demo问题，优先选择复杂的have结构
    demo_problems = {}
    priority_problems = ['nested_have', 'complex_have', 'hole_proof']
    
    for problem_id, metadata in all_metadata.items():
        if metadata.get('dataset') == 'demo':
            demo_problems[problem_id] = metadata
    
    # 按优先级排序
    sorted_problems = {}
    for priority in priority_problems:
        key = f"demo/{priority}"
        if key in demo_problems:
            sorted_problems[key] = demo_problems[key]
    
    # 添加其他demo问题
    for key, metadata in demo_problems.items():
        if key not in sorted_problems:
            sorted_problems[key] = metadata
    
    return sorted_problems

def create_problem_from_metadata(metadata_info):
    """从metadata创建Problem实例"""
    try:
        # 路径映射：demo -> demo
        dataset = metadata_info['dataset']
        if dataset == 'demo':
            dataset = 'demo'
        
        problem_id = metadata_info['problem_id']
        
        # 构建文件路径
        header_path = f"unified_problems/{dataset}/{problem_id}/header.lean"
        problem_path = f"unified_problems/{dataset}/{problem_id}/problem.lean"
        decomposed_dir = f"unified_problems/{dataset}/{problem_id}/decomposed"
        hole_dir = f"unified_problems/{dataset}/{problem_id}/hole"
        
        # 读取文件
        with open(header_path, 'r') as f:
            header_content = f.read()
        with open(problem_path, 'r') as f:
            problem_content = f.read()
        
        # 创建Problem实例
        problem = Problem(
            dataset=metadata_info['dataset'],
            problem_id=problem_id,
            header_path=header_path,
            problem_path=problem_path,
            decomposed_dir=decomposed_dir,
            hole_dir=hole_dir,
            original_path=None
        )
        
        # 添加内容属性
        problem.content = header_content + "\n" + problem_content
        
        return problem
    except Exception as e:
        print(f"❌ Error creating problem: {e}")
        return None

def count_have_statements(content):
    """统计have语句数量"""
    lines = content.split('\n')
    have_count = 0
    nested_level = 0
    max_nested = 0
    
    for line in lines:
        stripped = line.strip()
        if stripped.startswith('have '):
            have_count += 1
            # 简单的嵌套级别计算
            indent = len(line) - len(line.lstrip())
            current_level = indent // 2
            max_nested = max(max_nested, current_level)
    
    return have_count, max_nested

def demo_simple_pipeline():
    """运行简化的pipeline演示"""
    print("🚀 Simple Lean Proof Pipeline Demo (Focus on Decomposition)")
    print("=" * 70)
    
    # 设置日志
    log_file = setup_logging()
    logging.info("Simple pipeline demo started")
    
    # 加载demo问题
    demo_problems = load_demo_problems()
    print(f"📋 Found {len(demo_problems)} demo problems:")
    for problem_id in demo_problems:
        print(f"  - {problem_id}")
    
    # 创建分解solver
    print("\n🔧 Initializing Decompose Solver...")
    solver = DecomposeSolver()
    print(f"✅ Solver ready: {solver.get_solver_info()['name']}")
    
    # 处理每个问题
    successful_decompositions = 0
    problems_with_have = 0
    
    for problem_id, metadata_info in demo_problems.items():
        print(f"\n🧪 Processing: {problem_id}")
        print("=" * 60)
        
        # 创建problem实例
        problem = create_problem_from_metadata(metadata_info)
        if not problem:
            continue
        
        # 分析problem内容
        have_count, max_nested = count_have_statements(problem.content)
        if have_count > 0:
            problems_with_have += 1
            print(f"📊 Analysis: {have_count} have statements, max nesting level: {max_nested}")
        else:
            print("📊 Analysis: No have statements found")
        
        print(f"📝 Original problem:")
        print(problem.content)
        print()
        
        # 运行分解solver
        print("🔧 Running decomposition...")
        try:
            result = solver.solve(problem)
            
            print(f"📊 Decomposition result:")
            print(f"  Status: {result.status}")
            print(f"  Is Success: {result.is_success()}")
            
            if result.is_success():
                successful_decompositions += 1
                print("✅ Decomposition successful!")
                
                # 显示结果
                if hasattr(result, 'solution') and result.solution:
                    print(f"📝 Decomposed content:")
                    print(result.solution)
                
                # 检查分解后的文件
                decomposed_dir = Path(problem.decomposed_dir)
                if decomposed_dir.exists():
                    decomposed_files = list(decomposed_dir.glob("*.lean"))
                    if decomposed_files:
                        print(f"📁 Generated {len(decomposed_files)} decomposed files:")
                        for f in decomposed_files:
                            print(f"  - {f.name}")
                    else:
                        print("📁 No decomposed files generated")
                else:
                    print("📁 Decomposed directory not created")
            else:
                print("❌ Decomposition failed")
                if hasattr(result, 'error_message'):
                    print(f"   Error: {result.error_message}")
        
        except Exception as e:
            print(f"❌ Exception during decomposition: {e}")
            logging.exception(f"Error processing {problem_id}")
    
    # 总结
    print(f"\n🏁 Pipeline Demo Completed!")
    print("=" * 70)
    print(f"📊 Summary:")
    print(f"  Total problems processed: {len(demo_problems)}")
    print(f"  Problems with have statements: {problems_with_have}")
    print(f"  Successful decompositions: {successful_decompositions}")
    print(f"  Success rate: {successful_decompositions/len(demo_problems)*100:.1f}%")
    print(f"📋 Full log saved to: {log_file}")

if __name__ == "__main__":
    demo_simple_pipeline() 
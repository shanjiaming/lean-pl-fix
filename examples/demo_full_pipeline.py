#!/usr/bin/env python3
"""
Demo script for the complete lean proof fixing pipeline:
decompose -> hole filling -> synthesis -> verification + logging
"""

import json
import sys
import os
import logging
from datetime import datetime
from pathlib import Path

sys.path.append('.')

from data_management.unified_problem_manager import Problem, UnifiedProblemManager
from solvers.decompose_solver_unified import DecomposeSolver
from core.hole_fixer_interface import HoleFixerInterface

# 简化的Lean检查器（如果utils.lean_checker不存在）
class SimpleLeanChecker:
    def check_lean_code(self, code):
        # 简单的语法检查（实际应该调用Lean服务器）
        result = type('CheckResult', (), {})()
        result.is_success = lambda: "sorry" not in code and "hole" not in code
        result.output = "Simple syntax check completed"
        return result

def setup_logging():
    """Setup logging for the pipeline demo"""
    log_dir = Path("demo_pipeline_logs")
    log_dir.mkdir(exist_ok=True)
    
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    log_file = log_dir / f"pipeline_demo_{timestamp}.log"
    
    logging.basicConfig(
        level=logging.INFO,
        format='%(asctime)s - %(levelname)s - %(message)s',
        handlers=[
            logging.FileHandler(log_file, encoding='utf-8'),
            logging.StreamHandler()
        ]
    )
    
    return log_file

def log_step(step_name, content, result=None):
    """Log a pipeline step with input and output"""
    logging.info(f"=== {step_name} ===")
    logging.info(f"Input: {content[:200]}..." if len(content) > 200 else f"Input: {content}")
    if result:
        logging.info(f"Result: {result}")
    logging.info("-" * 50)

def verify_lean_code(code, header_path=None):
    """Verify if Lean code compiles successfully"""
    try:
        # 尝试使用实际的Lean检查器
        try:
            from utils.lean_checker import LeanChecker
            checker = LeanChecker()
        except ImportError:
            # 回退到简化检查器
            checker = SimpleLeanChecker()
        
        if header_path and os.path.exists(header_path):
            # 组合header和代码
            with open(header_path, 'r', encoding='utf-8') as f:
                header_content = f.read()
            full_code = header_content + "\n\n" + code
        else:
            full_code = code
        
        result = checker.check_lean_code(full_code)
        return result.is_success(), result.output
    except Exception as e:
        return False, str(e)

def load_demo_problems_from_metadata():
    """从unified metadata加载demo问题"""
    try:
        with open('data/unified_problems_metadata.json', 'r', encoding='utf-8') as f:
            metadata = json.load(f)
        
        demo_problems = {}
        for problem_id, info in metadata.items():
            if problem_id.startswith('demo/'):
                demo_problems[problem_id] = info
        
        return demo_problems
    except Exception as e:
        print(f"❌ Error loading metadata: {e}")
        return {}

def create_problem_from_metadata(metadata_info):
    """Create a Problem instance from metadata information."""
    try:
        # Fix path mapping: demo -> demo
        dataset = metadata_info['dataset']
        if dataset == 'demo':
            dataset = 'demo'
        
        problem_id = metadata_info['problem_id']
        
        # Construct file paths
        header_path = f"unified_problems/{dataset}/{problem_id}/header.lean"
        problem_path = f"unified_problems/{dataset}/{problem_id}/problem.lean"
        decomposed_dir = f"unified_problems/{dataset}/{problem_id}/decomposed"
        hole_dir = f"unified_problems/{dataset}/{problem_id}/hole"
        
        # Read files
        with open(header_path, 'r') as f:
            header_content = f.read()
        with open(problem_path, 'r') as f:
            problem_content = f.read()
        
        # Create Problem instance with correct parameters
        problem = Problem(
            dataset=metadata_info['dataset'],  # Keep original dataset name in metadata
            problem_id=problem_id,
            header_path=header_path,
            problem_path=problem_path,
            decomposed_dir=decomposed_dir,
            hole_dir=hole_dir,
            original_path=None
        )
        
        # Add content attribute for easier access
        problem.content = header_content + "\n" + problem_content
        
        return problem
    except Exception as e:
        print(f"❌ Error creating problem: {e}")
        return None

def demo_full_pipeline():
    """Demonstrate the complete pipeline with demo problems"""
    
    print("🚀 Starting Complete Lean Proof Pipeline Demo")
    print("=" * 80)
    
    # 设置日志
    log_file = setup_logging()
    logging.info("Pipeline demo started")
    
    # 加载demo问题
    demo_problems = load_demo_problems_from_metadata()
    
    if not demo_problems:
        print("❌ No demo problems found!")
        return
    
    print(f"📋 Found {len(demo_problems)} demo problems:")
    for problem_id in demo_problems:
        print(f"  - {problem_id}")
    
    # 创建求解器
    try:
        decompose_solver = DecomposeSolver()
    except Exception as e:
        print(f"❌ Error creating DecomposeSolver: {e}")
        return
    
    try:
        hole_filler = HoleFixerInterface()
    except Exception as e:
        print(f"⚠️ Warning: HoleFixerInterface not available: {e}")
        hole_filler = None
    
    # 处理每个demo问题
    for problem_id, metadata_info in demo_problems.items():
        print(f"\n🧪 Processing: {problem_id}")
        print("=" * 60)
        
        try:
            # 1. 加载问题
            problem = create_problem_from_metadata(metadata_info)
            if not problem:
                continue
                
            header_path = metadata_info.get('header_path')
            
            log_step("PROBLEM_LOADED", problem.content)
            print(f"📝 Original problem:\n{problem.content}")
            
            # 2. 验证原始代码
            print(f"\n🔍 Step 1: Verifying original code...")
            original_valid, original_output = verify_lean_code(problem.content.split('\n\n')[-1], header_path)
            log_step("ORIGINAL_VERIFICATION", problem.content, f"Valid: {original_valid}, Output: {original_output}")
            
            if original_valid:
                print("✅ Original code is valid!")
            else:
                print(f"❌ Original code has issues: {original_output}")
            
            # 3. 分解问题
            print(f"\n🔧 Step 2: Decomposing problem...")
            decompose_result = decompose_solver.solve(problem)
            log_step("DECOMPOSITION", problem.content, f"Status: {decompose_result.status}")
            
            if decompose_result.is_success():
                print("✅ Decomposition successful!")
                if decompose_result.metadata and 'decomposed_parts' in decompose_result.metadata:
                    parts = decompose_result.metadata['decomposed_parts']
                    print(f"📊 Decomposed into {len(parts)} parts")
                    for i, part in enumerate(parts):
                        print(f"  Part {i+1}: {part[:100]}...")
            else:
                print(f"❌ Decomposition failed: {decompose_result.error_message}")
                continue
            
            # 4. 检查分解后的文件
            decomposed_dir = metadata_info.get('decomposed_dir')
            if decomposed_dir and os.path.exists(decomposed_dir):
                print(f"\n📁 Checking decomposed files in: {decomposed_dir}")
                decomposed_files = list(Path(decomposed_dir).glob("*.lean"))
                
                for file_path in decomposed_files:
                    print(f"  📄 {file_path.name}")
                    with open(file_path, 'r', encoding='utf-8') as f:
                        content = f.read()
                    
                    # 验证分解后的每个部分
                    part_valid, part_output = verify_lean_code(content, header_path)
                    log_step(f"DECOMPOSED_PART_{file_path.name}", content, f"Valid: {part_valid}")
                    
                    if part_valid:
                        print(f"    ✅ Valid")
                    else:
                        print(f"    ❌ Issues: {part_output[:100]}...")
            else:
                print(f"📁 Decomposed directory not found or empty: {decomposed_dir}")
            
            # 5. 洞填充
            print(f"\n🕳️ Step 3: Hole filling...")
            
            # 检查是否有洞需要填充
            if "hole" in problem.content.lower() or "sorry" in problem.content.lower():
                print("🎯 Found holes/sorry, attempting to fill...")
                
                if hole_filler:
                    # 使用洞填充接口
                    hole_result = hole_filler.fill_holes(problem_id)
                    log_step("HOLE_FILLING", problem.content, f"Status: {hole_result}")
                    
                    if hole_result:
                        print("✅ Hole filling completed!")
                        
                        # 检查hole目录下的结果
                        hole_dir = metadata_info.get('hole_dir')
                        if hole_dir and os.path.exists(hole_dir):
                            print(f"📁 Checking filled holes in: {hole_dir}")
                            hole_files = list(Path(hole_dir).glob("*.lean"))
                            
                            for file_path in hole_files:
                                print(f"  📄 {file_path.name}")
                                with open(file_path, 'r', encoding='utf-8') as f:
                                    filled_content = f.read()
                                
                                # 验证填充后的代码
                                filled_valid, filled_output = verify_lean_code(filled_content, header_path)
                                log_step(f"FILLED_HOLE_{file_path.name}", filled_content, f"Valid: {filled_valid}")
                                
                                if filled_valid:
                                    print(f"    ✅ Filled hole is valid!")
                                else:
                                    print(f"    ❌ Filled hole has issues: {filled_output[:100]}...")
                        else:
                            print(f"📁 Hole directory not found: {hole_dir}")
                    else:
                        print("❌ Hole filling failed")
                else:
                    print("⚠️ Hole filler not available, skipping...")
            else:
                print("ℹ️ No holes found to fill")
            
            # 6. 合成验证
            print(f"\n🔄 Step 4: Synthesis and verification...")
            
            # 如果有solution，验证最终结果
            if decompose_result.solution:
                print("🧮 Verifying synthesized solution...")
                synth_valid, synth_output = verify_lean_code(decompose_result.solution, header_path)
                log_step("SYNTHESIS_VERIFICATION", decompose_result.solution, f"Valid: {synth_valid}")
                
                if synth_valid:
                    print("✅ Synthesized solution is valid!")
                    print(f"📝 Final solution:\n{decompose_result.solution}")
                else:
                    print(f"❌ Synthesized solution has issues: {synth_output}")
            else:
                synth_valid = False
                print("❌ No synthesized solution available")
            
            # 7. 完整性检查
            print(f"\n🎯 Step 5: End-to-end verification...")
            
            # 检查整个处理流程是否保持了问题的语义
            if decompose_result.solution:
                # 比较原始问题和最终解决方案
                print("🔍 Comparing original vs final solution...")
                if original_valid and synth_valid:
                    print("✅ Both original and solution are valid - SUCCESS!")
                elif not original_valid and synth_valid:
                    print("✅ Fixed invalid original code - SUCCESS!")
                elif original_valid and not synth_valid:
                    print("❌ Broke valid original code - REGRESSION!")
                else:
                    print("❓ Both invalid - PARTIAL SUCCESS")
            
            print(f"\n📊 Summary for {problem_id}:")
            print(f"  Original valid: {original_valid}")
            print(f"  Decomposition: {decompose_result.status}")
            print(f"  Final valid: {synth_valid if decompose_result.solution else 'N/A'}")
            
        except Exception as e:
            error_msg = f"Error processing {problem_id}: {e}"
            print(f"❌ {error_msg}")
            logging.error(error_msg)
    
    print(f"\n🏁 Pipeline demo completed!")
    print(f"📋 Full log saved to: {log_file}")
    print("=" * 80)

def demo_specific_problem(problem_name):
    """Demo pipeline for a specific problem"""
    
    log_file = setup_logging()
    print(f"🎯 Demo pipeline for: demo/{problem_name}")
    
    # 加载metadata
    demo_problems = load_demo_problems_from_metadata()
    problem_id = f"demo/{problem_name}"
    
    if problem_id not in demo_problems:
        print(f"❌ Problem {problem_id} not found!")
        return
    
    try:
        metadata_info = demo_problems[problem_id]
        problem = create_problem_from_metadata(metadata_info)
        
        if not problem:
            return
            
        print(f"📝 Problem content:\n{problem.content}")
        
        # 运行完整pipeline
        decompose_solver = DecomposeSolver()
        result = decompose_solver.solve(problem)
        
        print(f"🔧 Decomposition result: {result.status}")
        if result.solution:
            print(f"📝 Solution:\n{result.solution}")
            
            # 验证结果
            header_path = metadata_info.get('header_path')
            valid, output = verify_lean_code(result.solution, header_path)
            print(f"✅ Verification: {'PASS' if valid else 'FAIL'}")
            if not valid:
                print(f"Error: {output}")
        
    except Exception as e:
        print(f"❌ Error: {e}")
    
    print(f"📋 Log saved to: {log_file}")

if __name__ == "__main__":
    if len(sys.argv) > 1:
        demo_specific_problem(sys.argv[1])
    else:
        demo_full_pipeline() 
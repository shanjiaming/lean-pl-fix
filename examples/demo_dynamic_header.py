#!/usr/bin/env python3
"""
Demo script to show dynamic header loading for hole execution
"""

import os
import sys
from pathlib import Path

# Add the parent directory to Python path for imports
sys.path.append(str(Path(__file__).parent.parent))

from data_management.unified_problem_manager import problem_manager
from solvers.decompose_solver_unified import get_unified_env


def demo_dynamic_header_loading():
    """Demo dynamic header loading for hole execution"""
    print("🔧 Dynamic Header Loading Demo")
    print("=" * 60)
    
    # Get unified environment
    env = get_unified_env()
    
    # Load a demo problem
    dataset = "demo"
    problem_id = "nested_have"
    
    try:
        problem = problem_manager.get_problem(dataset, problem_id)
        print(f"📋 Loaded problem: {dataset}/{problem_id}")
        
        # Show original header content
        header_content = problem_manager.get_header_content(problem)
        print(f"\n📝 Original header content:")
        print("-" * 40)
        print(header_content)
        
        # Load a decomposed file (without header)
        decomposed_file = Path(problem.decomposed_dir) / "decomposed_00_h1.lean"
        if decomposed_file.exists():
            with open(decomposed_file, 'r', encoding='utf-8') as f:
                decomposed_content = f.read()
            
            print(f"\n📁 Decomposed file content (header-free):")
            print("-" * 40)
            print(decomposed_content)
            
            # Demonstrate dynamic header loading
            print(f"\n🔧 Running with dynamic header loading...")
            result = env.run_decomposed_with_header(problem, decomposed_content)
            print(f"✅ Execution result: {result}")
        
        # Load hole file (without header)
        hole_file = Path(problem.hole_dir) / f"hole_{problem.problem_id}.lean"
        if hole_file.exists():
            with open(hole_file, 'r', encoding='utf-8') as f:
                hole_content = f.read()
            
            print(f"\n📁 Hole file content (header-free):")
            print("-" * 40)
            print(hole_content)
            
            # Demonstrate dynamic header loading for hole
            print(f"\n🔧 Running hole with dynamic header loading...")
            result = env.run_hole_with_header(problem, hole_content)
            print(f"✅ Execution result: {result}")
            
    except Exception as e:
        print(f"❌ Error: {e}")
    
    print(f"\n🎯 Demo Summary:")
    print(f"✅ Files are stored without headers (saves space)")
    print(f"✅ Headers are dynamically loaded when needed")
    print(f"✅ Hole macro is automatically added for execution")
    print(f"✅ Original header information is preserved and accessible")


def demo_header_with_hole_macro():
    """Demo showing the complete header with hole macro"""
    print("\n🎯 Header Construction Demo")
    print("=" * 60)
    
    # Get unified environment
    env = get_unified_env()
    
    # Load a demo problem
    dataset = "demo"
    problem_id = "nested_have"
    
    try:
        problem = problem_manager.get_problem(dataset, problem_id)
        
        # Get original header
        header_content = problem_manager.get_header_content(problem)
        
        # Construct full header with hole macro
        hole_macro = 'macro "hole" : tactic => `(tactic| admit)'
        full_header = f"{header_content}\n\n{hole_macro}\n\n"
        
        print(f"📝 Complete header with hole macro:")
        print("-" * 50)
        print(full_header)
        
        # Example of how this would be used with a decomposed file
        decomposed_content = 'theorem sub_theorem_h1 a + b = b + a := by\n  hole\n'
        complete_file = f"{full_header}{decomposed_content}"
        
        print(f"📄 Complete executable file example:")
        print("-" * 50)
        print(complete_file)
        
    except Exception as e:
        print(f"❌ Error: {e}")


if __name__ == "__main__":
    demo_dynamic_header_loading()
    demo_header_with_hole_macro() 
#!/usr/bin/env python3

import os
import glob
from unified_problem_manager import problem_manager

def migrate_demo_dataset():
    """Migrate demo dataset to unified structure"""
    
    demo_dir = "demo"
    if not os.path.exists(demo_dir):
        print(f"Demo directory {demo_dir} does not exist")
        return
    
    # Find all .lean files in demo directory
    lean_files = glob.glob(os.path.join(demo_dir, "*.lean"))
    print(f"Found {len(lean_files)} .lean files in demo directory")
    
    for lean_file in lean_files:
        # Extract problem ID from filename
        basename = os.path.basename(lean_file)
        problem_id = os.path.splitext(basename)[0]
        
        print(f"Migrating {problem_id}...")
        
        # Read the lean file
        with open(lean_file, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # Extract header (imports) and problem content
        lines = content.split('\n')
        header_lines = []
        problem_lines = []
        
        # Find where imports end
        import_phase = True
        for line in lines:
            if import_phase and (line.startswith('import ') or line.strip() == '' or line.startswith('--')):
                header_lines.append(line)
            else:
                import_phase = False
                problem_lines.append(line)
        
        # If no imports found, create a basic header
        if not header_lines:
            header_content = "import Mathlib\n"
        else:
            header_content = '\n'.join(header_lines) + '\n'
        
        problem_content = '\n'.join(problem_lines)
        
        # Add to unified structure
        problem = problem_manager.add_problem(
            dataset="demo",
            problem_id=problem_id,
            header_content=header_content,
            problem_content=problem_content,
            original_path=lean_file
        )
        
        print(f"✓ Migrated {problem_id} to {problem.base_dir}")
    
    print(f"\nMigration complete! Migrated {len(lean_files)} problems to unified structure.")
    
    # List the migrated problems
    demo_problems = problem_manager.list_problems("demo")
    print(f"Available demo problems: {[p.problem_id for p in demo_problems]}")

if __name__ == "__main__":
    migrate_demo_dataset()
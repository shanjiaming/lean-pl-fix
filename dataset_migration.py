import os
import re
from pathlib import Path
from unified_problem_manager import problem_manager
from typing import Dict, List, Optional

def extract_header_and_theorem(content: str) -> tuple[str, str]:
    """
    Extract header (imports, set_option, etc.) and theorem content from a file.
    
    Returns:
        tuple: (header_content, theorem_content)
    """
    lines = content.split('\n')
    header_lines = []
    theorem_lines = []
    
    theorem_started = False
    for line in lines:
        if line.strip().startswith('theorem '):
            theorem_started = True
            theorem_lines.append(line)
        elif theorem_started:
            theorem_lines.append(line)
        elif (line.strip().startswith('import ') or 
              line.strip().startswith('set_option ') or 
              line.strip().startswith('open ') or
              line.strip().startswith('macro ') or
              line.strip() == ''):
            header_lines.append(line)
        else:
            # This might be part of theorem content before formal theorem declaration
            if not theorem_started and any(keyword in line for keyword in ['theorem', 'lemma', 'def']):
                theorem_started = True
                theorem_lines.append(line)
            elif theorem_started:
                theorem_lines.append(line)
            else:
                # Could be variable declarations or other global content
                header_lines.append(line)
    
    header_content = '\n'.join(header_lines).strip()
    theorem_content = '\n'.join(theorem_lines).strip()
    
    return header_content, theorem_content

def get_problem_id_from_filename(filename: str) -> str:
    """Extract problem ID from filename, removing .lean extension"""
    return filename.replace('.lean', '')

def migrate_minif2f():
    """Migrate minif2f dataset"""
    dataset_name = "minif2f"
    
    # Look for minif2f data in various possible locations
    possible_dirs = [
        "minif2f-dspv2/test_passed",
        "minif2f/test", 
        "dataset/minif2f",
        "minif2f-dspv2/test_failed_fixed_unknown_failed"
    ]
    
    for base_dir in possible_dirs:
        if not os.path.exists(base_dir):
            continue
            
        print(f"Migrating from {base_dir}")
        
        # Handle directory structure (could be nested)
        if os.path.isdir(base_dir):
            for item in os.listdir(base_dir):
                item_path = os.path.join(base_dir, item)
                
                if os.path.isfile(item_path) and item.endswith('.lean'):
                    # Direct .lean file
                    migrate_single_file(dataset_name, item_path, get_problem_id_from_filename(item))
                    
                elif os.path.isdir(item_path):
                    # Directory containing .lean files
                    for subitem in os.listdir(item_path):
                        if subitem.endswith('.lean'):
                            subitem_path = os.path.join(item_path, subitem)
                            problem_id = f"{item}/{get_problem_id_from_filename(subitem)}"
                            migrate_single_file(dataset_name, subitem_path, problem_id)

def migrate_proverbench():
    """Migrate proverbench dataset"""
    dataset_name = "proverbench"
    
    possible_dirs = [
        "dataset/proverbench_simpleheader_failed",
        "dataset/proverbench",
        "proverbench"
    ]
    
    for base_dir in possible_dirs:
        if not os.path.exists(base_dir):
            continue
            
        print(f"Migrating proverbench from {base_dir}")
        
        if os.path.isdir(base_dir):
            for item in os.listdir(base_dir):
                item_path = os.path.join(base_dir, item)
                
                if os.path.isfile(item_path) and item.endswith('.lean'):
                    migrate_single_file(dataset_name, item_path, get_problem_id_from_filename(item))
                    
                elif os.path.isdir(item_path):
                    for subitem in os.listdir(item_path):
                        if subitem.endswith('.lean'):
                            subitem_path = os.path.join(item_path, subitem)
                            problem_id = f"{item}/{get_problem_id_from_filename(subitem)}"
                            migrate_single_file(dataset_name, subitem_path, problem_id)

def migrate_putnam():
    """Migrate putnam dataset"""
    dataset_name = "putnam"
    
    possible_dirs = [
        "dataset/putnam",
        "putnam"
    ]
    
    for base_dir in possible_dirs:
        if not os.path.exists(base_dir):
            continue
            
        print(f"Migrating putnam from {base_dir}")
        
        if os.path.isdir(base_dir):
            for item in os.listdir(base_dir):
                item_path = os.path.join(base_dir, item)
                
                if os.path.isfile(item_path) and item.endswith('.lean'):
                    migrate_single_file(dataset_name, item_path, get_problem_id_from_filename(item))
                    
                elif os.path.isdir(item_path):
                    for subitem in os.listdir(item_path):
                        if subitem.endswith('.lean'):
                            subitem_path = os.path.join(item_path, subitem)
                            problem_id = f"{item}/{get_problem_id_from_filename(subitem)}"
                            migrate_single_file(dataset_name, subitem_path, problem_id)

def migrate_single_file(dataset_name: str, file_path: str, problem_id: str):
    """Migrate a single file to the unified structure"""
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()
        
        header_content, theorem_content = extract_header_and_theorem(content)
        
        # If no header found, use default
        if not header_content:
            header_content = """import Mathlib
import Aesop
set_option maxHeartbeats 0
set_option pp.coercions.types true
open BigOperators Real Nat Topology Rat"""
        
        # Add the problem to unified structure
        problem = problem_manager.add_problem(
            dataset=dataset_name,
            problem_id=problem_id,
            header_content=header_content,
            problem_content=theorem_content,
            original_path=file_path
        )
        
        print(f"Migrated {dataset_name}/{problem_id} from {file_path}")
        
    except Exception as e:
        print(f"Failed to migrate {file_path}: {e}")

def show_migration_summary():
    """Show summary of migrated problems"""
    datasets = problem_manager.list_datasets()
    print("\nMigration Summary:")
    print("=" * 50)
    
    for dataset in datasets:
        problems = problem_manager.list_problems(dataset)
        print(f"{dataset}: {len(problems)} problems")
        
        # Show first few problem IDs as example
        for i, problem in enumerate(problems[:3]):
            print(f"  - {problem.problem_id}")
        if len(problems) > 3:
            print(f"  ... and {len(problems) - 3} more")
    
    print(f"\nTotal: {len(problem_manager.list_problems())} problems across {len(datasets)} datasets")

def main():
    """Run the migration process"""
    print("Starting dataset migration to unified structure...")
    
    # Create backup of existing data first
    print("Note: Original data will remain in place as backup")
    
    # Migrate each dataset
    migrate_minif2f()
    migrate_proverbench() 
    migrate_putnam()
    
    # Show summary
    show_migration_summary()
    
    # Export metadata for reference
    problem_manager.export_metadata("unified_problems_metadata.json")
    print(f"\nMetadata exported to unified_problems_metadata.json")

if __name__ == "__main__":
    main() 
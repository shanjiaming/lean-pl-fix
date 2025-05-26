import os
import re
import json
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
    
    # Find the first top-level theorem
    theorem_start_index = None
    for i, line in enumerate(lines):
        stripped_line = line.strip()
        # Check if this is a top-level theorem (starts at beginning of line, no indentation)
        if line.startswith('theorem '):
            theorem_start_index = i
            break
    
    if theorem_start_index is None:
        # No theorem found, everything is header
        return content.strip(), ""
    
    # Split at the theorem line
    header_lines = lines[:theorem_start_index]
    theorem_lines = lines[theorem_start_index:]
    
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
    """Migrate proverbench dataset: header from HuggingFace, problem content from local files"""
    dataset_name = "proverbench"
    
    try:
        from datasets import load_dataset
        print("Loading ProverBench dataset from Hugging Face...")
        ds = load_dataset("deepseek-ai/DeepSeek-ProverBench")["train"]
        
        print(f"Found {len(ds)} problems in ProverBench dataset")
        
        # Create a mapping from problem name to header and formal_statement
        problem_metadata = {}
        for problem in ds:
            problem_metadata[problem['name']] = {
                'header': problem['header'].strip(),
                'formal_statement': problem['formal_statement'].strip()
            }
        
        print(f"Created metadata mapping for {len(problem_metadata)} problems")
        
        # Now migrate from local files, using remote headers
        possible_dirs = [
            "dataset/proverbench_simpleheader_failed", 
            "dataset/proverbench",
            "proverbench"
        ]
        
        migrated_count = 0
        for base_dir in possible_dirs:
            if not os.path.exists(base_dir):
                continue
                
            print(f"Migrating proverbench from {base_dir} with HuggingFace headers")
            
            if os.path.isdir(base_dir):
                for item in os.listdir(base_dir):
                    item_path = os.path.join(base_dir, item)
                    
                    if os.path.isfile(item_path) and item.endswith('.lean'):
                        problem_id = get_problem_id_from_filename(item)
                        migrate_proverbench_single_file(dataset_name, item_path, problem_id, problem_metadata)
                        migrated_count += 1
                        
                    elif os.path.isdir(item_path):
                        for subitem in os.listdir(item_path):
                            if subitem.endswith('.lean'):
                                subitem_path = os.path.join(item_path, subitem)
                                problem_id = f"{item}/{get_problem_id_from_filename(subitem)}"
                                migrate_proverbench_single_file(dataset_name, subitem_path, problem_id, problem_metadata)
                                migrated_count += 1
        
        print(f"Successfully migrated {migrated_count} proverbench problems")
            
    except ImportError:
        print("datasets package not available, falling back to local files...")
        migrate_proverbench_from_files()
    except Exception as e:
        print(f"Failed to load from Hugging Face: {e}")
        print("Falling back to local files...")
        migrate_proverbench_from_files()

def migrate_proverbench_single_file(dataset_name: str, file_path: str, problem_id: str, problem_metadata: dict):
    """Migrate a single proverbench file with header from HuggingFace and content from local file"""
    try:
        # Read local file content (may contain proof)
        with open(file_path, 'r', encoding='utf-8') as f:
            local_content = f.read()
        
        # Get header and formal_statement from HuggingFace if available
        assert problem_id in problem_metadata, f"Problem {problem_id} not found in HuggingFace metadata"
        header_content = problem_metadata[problem_id]['header']
        formal_statement = problem_metadata[problem_id]['formal_statement']
        print(f"Using HuggingFace header for {problem_id}")
        
        # Extract theorem content from local file (may include proof)
        _, theorem_content = extract_header_and_theorem(local_content)
        assert theorem_content, f"No theorem content found for {problem_id}"
        
        # Add the problem to unified structure
        problem = problem_manager.add_problem(
            dataset=dataset_name,
            problem_id=problem_id,
            header_content=header_content,
            problem_content=theorem_content,
            original_path=file_path,
            formal_statement=formal_statement
        )
        
        print(f"Migrated {dataset_name}/{problem_id} (header: HuggingFace, content: {file_path})")
        
    except Exception as e:
        print(f"Failed to migrate {file_path}: {e}")

def migrate_proverbench_from_files():
    """Migrate proverbench dataset from local files (fallback method)"""
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
    """Migrate putnam dataset: header from dataset/putnam.jsonl, problem content from local files"""
    dataset_name = "putnam"
    
    try:
        # Try to load from dataset/putnam.jsonl
        jsonl_path = "dataset/putnam.jsonl"
        if os.path.exists(jsonl_path):
            print(f"Loading Putnam dataset from {jsonl_path}...")
            
            # Create a mapping from problem name to metadata
            problem_metadata = {}
            with open(jsonl_path, 'r', encoding='utf-8') as f:
                for line in f:
                    line = line.strip()
                    if line:  # Skip empty lines
                        problem = json.loads(line)
                        problem_metadata[problem['name']] = {
                            'header': problem['header'].strip(),
                            'formal_statement': problem['formal_statement'].strip(),
                            'informal_statement': problem.get('informal_statement', ''),
                            'informal_solution': problem.get('informal_solution', ''),
                            'tags': problem.get('tags', [])
                        }
            
            print(f"Created metadata mapping for {len(problem_metadata)} problems")
            
            # Now migrate from local files, using jsonl headers
            possible_dirs = [
                "dataset/putnam",
                "putnam"
            ]
            
            migrated_count = 0
            for base_dir in possible_dirs:
                if not os.path.exists(base_dir):
                    continue
                    
                print(f"Migrating putnam from {base_dir} with jsonl headers")
                
                if os.path.isdir(base_dir):
                    for item in os.listdir(base_dir):
                        item_path = os.path.join(base_dir, item)
                        
                        if os.path.isfile(item_path) and item.endswith('.lean'):
                            problem_id = get_problem_id_from_filename(item)
                            migrate_putnam_single_file(dataset_name, item_path, problem_id, problem_metadata)
                            migrated_count += 1
                            
                        elif os.path.isdir(item_path):
                            for subitem in os.listdir(item_path):
                                if subitem.endswith('.lean'):
                                    subitem_path = os.path.join(item_path, subitem)
                                    problem_id = f"{item}/{get_problem_id_from_filename(subitem)}"
                                    migrate_putnam_single_file(dataset_name, subitem_path, problem_id, problem_metadata)
                                    migrated_count += 1
            
            print(f"Successfully migrated {migrated_count} putnam problems")
        else:
            print(f"Putnam jsonl file not found at {jsonl_path}, falling back to local files...")
            migrate_putnam_from_files()
            
    except Exception as e:
        print(f"Failed to load from jsonl: {e}")
        print("Falling back to local files...")
        migrate_putnam_from_files()

def migrate_putnam_single_file(dataset_name: str, file_path: str, problem_id: str, problem_metadata: dict):
    """Migrate a single putnam file with header from jsonl and content from local file"""
    try:
        # Read local file content (may contain proof)
        with open(file_path, 'r', encoding='utf-8') as f:
            local_content = f.read()
        
        # Get header and formal_statement from jsonl if available
        assert problem_id in problem_metadata, f"Problem {problem_id} not found in jsonl metadata"
        header_content = problem_metadata[problem_id]['header']
        formal_statement = problem_metadata[problem_id]['formal_statement']
        print(f"Using jsonl header for {problem_id}")
        
        # Extract theorem content from local file (may include proof)
        _, theorem_content = extract_header_and_theorem(local_content)
        assert theorem_content, f"No theorem content found for {problem_id}"
        
        # Add the problem to unified structure
        problem = problem_manager.add_problem(
            dataset=dataset_name,
            problem_id=problem_id,
            header_content=header_content,
            problem_content=theorem_content,
            original_path=file_path,
            formal_statement=formal_statement
        )
        
        print(f"Migrated {dataset_name}/{problem_id} (header: jsonl, content: {file_path})")
        
    except Exception as e:
        print(f"Failed to migrate {file_path}: {e}")

def migrate_putnam_from_files():
    """Migrate putnam dataset from local files (fallback method)"""
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
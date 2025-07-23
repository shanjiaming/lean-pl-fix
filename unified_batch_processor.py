#!/usr/bin/env python3
"""
Unified Batch Processor for Lean Problem Management

This script provides a unified interface for managing all operations on the
unified problem management system, including migration and decomposition.
Streamlined version supporting only demo and putnam datasets.
"""

import os
import sys
import argparse
from pathlib import Path

# Import all necessary modules
from unified_problem_manager import problem_manager
from dataset_migration import migrate_putnam, show_migration_summary
import migrate_demo
from decompose_hole_merge_pipeline import DecomposeHoleMergePipeline


def migrate_all_datasets():
    """Migrate all datasets to unified structure - streamlined version"""
    print("=== Starting Dataset Migration (Demo + Putnam) ===")
    
    # Create backup first
    print("Creating backups...")
    os.makedirs("backups", exist_ok=True)
    
    # Migrate each dataset
    print("Migrating demo...")
    migrate_demo.migrate_demo_dataset()
    
    print("Migrating putnam...")
    migrate_putnam()
    
    # Show summary
    show_migration_summary()
    
    # Export metadata
    print("Exporting metadata...")
    problem_manager.export_metadata("unified_problems/metadata.json")
    
    print("=== Migration Complete ===")


def decompose_all_problems():
    """Decompose all problems using the streamlined pipeline"""
    print("=== Starting Problem Decomposition ===")
    
    # Initialize pipeline
    pipeline = DecomposeHoleMergePipeline()
    
    # Process problems for each dataset
    datasets = ['demo', 'putnam']
    
    for dataset in datasets:
        print(f"Decomposing problems for dataset: {dataset}")
        try:
            problems = problem_manager.get_problems_by_dataset(dataset)
            print(f"Found {len(problems)} problems in {dataset}")
            
            for problem in problems:
                result = pipeline.process_problem(problem)
                print(f"✓ Processed {problem.problem_id}")
                
            print(f"✓ Completed decomposition for {dataset}")
        except Exception as e:
            print(f"✗ Error decomposing {dataset}: {e}")
    
    print("=== Problem Decomposition Complete ===")


def process_dataset(dataset_name: str, operations: list):
    """Process a specific dataset with given operations - streamlined version"""
    if dataset_name not in ['demo', 'putnam']:
        print(f"Error: Only 'demo' and 'putnam' datasets are supported")
        return
        
    print(f"=== Processing Dataset: {dataset_name} ===")
    
    # Initialize pipeline
    pipeline = DecomposeHoleMergePipeline()
    
    for operation in operations:
        if operation == "migrate":
            print(f"Migrating {dataset_name}...")
            if dataset_name == "demo":
                migrate_demo.migrate_demo_dataset()
            elif dataset_name == "putnam":
                migrate_putnam()
        elif operation == "decompose":
            print(f"Decomposing problems for {dataset_name}...")
            problems = problem_manager.get_problems_by_dataset(dataset_name)
            for problem in problems:
                pipeline.process_problem(problem)
        else:
            print(f"Unknown operation: {operation}. Supported: migrate, decompose")
    
    print(f"=== Dataset {dataset_name} Processing Complete ===")


def show_status():
    """Show current status of the unified system"""
    print("=== Unified Problem Management System Status ===")
    
    datasets = problem_manager.list_datasets()
    if not datasets:
        print("No datasets found. Run migration first.")
        return
    
    total_problems = 0
    for dataset in datasets:
        problems = problem_manager.list_problems(dataset)
        count = len(problems)
        total_problems += count
        print(f"{dataset}: {count} problems")
    
    print(f"Total: {total_problems} problems across {len(datasets)} datasets")
    
    # Check for generated files
    print("\nGenerated Files Status:")
    for dataset in datasets:
        problems = problem_manager.list_problems(dataset)
        holes_count = 0
        decomposed_count = 0
        
        for problem in problems:
            # Check for hole files
            hole_files = list(Path(problem.hole_dir).glob("*.lean"))
            if hole_files:
                holes_count += 1
            
            # Check for decomposed files
            decomposed_files = list(Path(problem.decomposed_dir).glob("*.lean"))
            if decomposed_files:
                decomposed_count += 1
        
        print(f"  {dataset}: {holes_count} holes, {decomposed_count} decomposed")


def main():
    """Main entry point for the streamlined batch processor"""
    parser = argparse.ArgumentParser(
        description="Streamlined Batch Processor for Lean Problem Management (Demo + Putnam)",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  python unified_batch_processor.py migrate          # Migrate demo + putnam datasets
  python unified_batch_processor.py decompose        # Decompose all problems
  python unified_batch_processor.py status           # Show system status
  python unified_batch_processor.py full             # Run complete pipeline
  python unified_batch_processor.py dataset --dataset demo --operations migrate decompose
        """
    )
    
    parser.add_argument('command', choices=[
        'migrate', 'decompose', 'status', 'full', 'dataset'
    ], help='Command to execute')
    
    parser.add_argument('--dataset', choices=['demo', 'putnam'],
                       help='Dataset name (required for dataset command)')
    
    parser.add_argument('--operations', nargs='+', choices=['migrate', 'decompose'],
                       help='Operations to perform on dataset')
    
    args = parser.parse_args()
    
    if args.command == 'migrate':
        migrate_all_datasets()
    elif args.command == 'decompose':
        decompose_all_problems()
    elif args.command == 'status':
        show_status()
    elif args.command == 'full':
        print("Running complete streamlined pipeline...")
        migrate_all_datasets()
        decompose_all_problems()
        print("Complete pipeline finished!")
        show_status()
    elif args.command == 'dataset':
        if not args.dataset or not args.operations:
            print("Error: --dataset and --operations required for dataset command")
            print("Example: python unified_batch_processor.py dataset --dataset demo --operations migrate decompose")
            sys.exit(1)
        process_dataset(args.dataset, args.operations)
    else:
        parser.print_help()


if __name__ == "__main__":
    main() 
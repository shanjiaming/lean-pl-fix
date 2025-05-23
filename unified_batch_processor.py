#!/usr/bin/env python3
"""
Unified Batch Processor for Lean Problem Management

This script provides a unified interface for managing all operations on the
unified problem management system, including migration, solving, hole generation,
and decomposition.
"""

import os
import sys
import argparse
from pathlib import Path

# Import all necessary modules
from unified_problem_manager import problem_manager
from dataset_migration import migrate_minif2f, migrate_proverbench, migrate_putnam, show_migration_summary
from dpv2_batch_solver import batch_fix_unified, batch_fix_dataset
from substep_saver_hole import generate_holes_for_dataset, generate_holes_for_all
from substep_saver_decompose import generate_decomposed_for_dataset, generate_decomposed_for_all


def migrate_all_datasets():
    """Migrate all datasets to unified structure"""
    print("=== Starting Dataset Migration ===")
    
    # Create backup first
    print("Creating backups...")
    os.makedirs("backups", exist_ok=True)
    
    # Migrate each dataset
    print("Migrating minif2f...")
    migrate_minif2f()
    
    print("Migrating proverbench...")
    migrate_proverbench()
    
    print("Migrating putnam...")
    migrate_putnam()
    
    # Show summary
    show_migration_summary()
    
    # Export metadata
    print("Exporting metadata...")
    problem_manager.export_metadata("unified_problems/metadata.json")
    
    print("=== Migration Complete ===")


def solve_all_problems():
    """Solve all problems using DPv2"""
    print("=== Starting Problem Solving ===")
    batch_fix_unified()
    print("=== Problem Solving Complete ===")


def generate_all_holes():
    """Generate hole versions for all problems"""
    print("=== Starting Hole Generation ===")
    generate_holes_for_all()
    print("=== Hole Generation Complete ===")


def generate_all_decomposed():
    """Generate decomposed versions for all problems"""
    print("=== Starting Decomposition ===")
    generate_decomposed_for_all()
    print("=== Decomposition Complete ===")


def process_dataset(dataset_name: str, operations: list):
    """Process a specific dataset with given operations"""
    print(f"=== Processing Dataset: {dataset_name} ===")
    
    for operation in operations:
        if operation == "solve":
            print(f"Solving problems in {dataset_name}...")
            batch_fix_dataset(dataset_name)
        elif operation == "holes":
            print(f"Generating holes for {dataset_name}...")
            generate_holes_for_dataset(dataset_name)
        elif operation == "decompose":
            print(f"Generating decomposed versions for {dataset_name}...")
            generate_decomposed_for_dataset(dataset_name)
        else:
            print(f"Unknown operation: {operation}")
    
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


def full_pipeline():
    """Run the complete pipeline: migrate -> solve -> generate holes -> decompose"""
    print("=== Running Full Pipeline ===")
    
    migrate_all_datasets()
    solve_all_problems()
    generate_all_holes()
    generate_all_decomposed()
    
    print("=== Full Pipeline Complete ===")
    show_status()


def main():
    parser = argparse.ArgumentParser(
        description="Unified Batch Processor for Lean Problem Management",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  python unified_batch_processor.py migrate          # Migrate all datasets
  python unified_batch_processor.py solve            # Solve all problems
  python unified_batch_processor.py holes            # Generate holes for all
  python unified_batch_processor.py decompose        # Generate decomposed for all
  python unified_batch_processor.py status           # Show system status
  python unified_batch_processor.py full             # Run complete pipeline
  python unified_batch_processor.py dataset minif2f solve holes  # Process specific dataset
        """
    )
    
    parser.add_argument('command', choices=[
        'migrate', 'solve', 'holes', 'decompose', 'status', 'full', 'dataset'
    ], help='Command to execute')
    
    parser.add_argument('dataset_name', nargs='?', 
                       help='Dataset name (required for dataset command)')
    
    parser.add_argument('operations', nargs='*', 
                       choices=['solve', 'holes', 'decompose'],
                       help='Operations to perform on dataset')
    
    args = parser.parse_args()
    
    if args.command == 'migrate':
        migrate_all_datasets()
    elif args.command == 'solve':
        solve_all_problems()
    elif args.command == 'holes':
        generate_all_holes()
    elif args.command == 'decompose':
        generate_all_decomposed()
    elif args.command == 'status':
        show_status()
    elif args.command == 'full':
        full_pipeline()
    elif args.command == 'dataset':
        if not args.dataset_name:
            print("Error: dataset_name is required for dataset command")
            sys.exit(1)
        if not args.operations:
            print("Error: at least one operation is required for dataset command")
            sys.exit(1)
        process_dataset(args.dataset_name, args.operations)
    else:
        parser.print_help()


if __name__ == "__main__":
    main() 
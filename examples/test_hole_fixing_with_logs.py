#!/usr/bin/env python3
"""
Test script for demonstrating detailed logging in hole fixing interface.

This script showcases the new logging functionality that tracks:
- Input content for each hole
- Attempted repair strategies
- Success/failure of each repair
- Overall dataset statistics
"""

import argparse
from pathlib import Path
from hole_fixer_interface import SimpleHoleFixer, DatasetProcessor
from simple_hole_demo import SimpleHoleFixerDemo, CustomHoleFixerDemo, MockDatasetProcessor
from unified_problem_manager import problem_manager


def test_real_hole_fixing_with_logs(dataset: str = "minif2f", max_problems: int = 3):
    """Test real hole fixing with detailed logging"""
    print(f"\n=== Testing Real Hole Fixing with Logging ===")
    print(f"Dataset: {dataset}, Max problems: {max_problems}")
    
    # Create a simple fixer with logging enabled
    fixer = SimpleHoleFixer()
    processor = DatasetProcessor(fixer, enable_logging=True)
    
    # Get a few problems for testing
    problems = problem_manager.list_problems(dataset)[:max_problems]
    
    print(f"\nProcessing {len(problems)} problems...")
    print("Check the console output and log files for detailed information.")
    
    # Process each problem individually to see detailed logs
    for i, problem in enumerate(problems):
        print(f"\n[{i+1}/{len(problems)}] Processing {problem.problem_id}...")
        try:
            result = processor.process_problem(problem)
            print(f"✓ Completed: {result.synthesized_status.value}")
        except Exception as e:
            print(f"✗ Error: {e}")
    
    print(f"\nReal hole fixing test completed.")
    print(f"Detailed logs saved in: hole_fixing_logs/")


def test_demo_hole_fixing_with_logs(dataset: str = "minif2f", max_problems: int = 3):
    """Test demo hole fixing with detailed logging"""
    print(f"\n=== Testing Demo Hole Fixing with Logging ===")
    print(f"Dataset: {dataset}, Max problems: {max_problems}")
    
    # Test different fixers
    fixers = {
        "Simple": SimpleHoleFixerDemo(),
        "Custom(simp)": CustomHoleFixerDemo("simp"),
        "Custom(tauto)": CustomHoleFixerDemo("tauto")
    }
    
    for fixer_name, fixer in fixers.items():
        print(f"\n--- Testing {fixer_name} Fixer ---")
        
        processor = MockDatasetProcessor(fixer, enable_logging=True)
        results = processor.process_dataset(dataset, max_problems=max_problems)
        
        print(f"Processed {len(results)} problems with {fixer_name}")
        print("Check the console output and log files for detailed information.")
    
    print(f"\nDemo hole fixing test completed.")
    print(f"Detailed logs saved in: hole_fixing_logs/")


def compare_fixers_with_logs(dataset: str = "minif2f", max_problems: int = 2):
    """Compare different fixers with detailed logging"""
    print(f"\n=== Comparing Fixers with Detailed Logging ===")
    print(f"Dataset: {dataset}, Max problems: {max_problems}")
    
    # Test different strategies
    strategies = ["simp", "tauto", "ring", "norm_num"]
    results = {}
    
    for strategy in strategies:
        print(f"\n--- Testing strategy: {strategy} ---")
        
        fixer = CustomHoleFixerDemo(strategy)
        processor = MockDatasetProcessor(fixer, enable_logging=True)
        strategy_results = processor.process_dataset(dataset, max_problems=max_problems)
        
        # Calculate success rates
        total_problems = len(strategy_results)
        synthesis_success = sum(1 for r in strategy_results if r.synthesized_status == "pass")
        
        results[strategy] = {
            'total': total_problems,
            'success': synthesis_success,
            'rate': synthesis_success / total_problems * 100
        }
        
        print(f"Strategy {strategy}: {synthesis_success}/{total_problems} ({results[strategy]['rate']:.1f}%)")
    
    # Print comparison summary
    print(f"\n--- Comparison Summary ---")
    print(f"{'Strategy':<12} {'Success Rate':<12} {'Problems':<10}")
    print("-" * 40)
    
    for strategy, stats in results.items():
        print(f"{strategy:<12} {stats['rate']:<12.1f}% {stats['success']}/{stats['total']}")
    
    print(f"\nDetailed logs for each strategy saved in: hole_fixing_logs/")


def show_log_files():
    """Show available log files"""
    log_dir = Path("hole_fixing_logs")
    
    if not log_dir.exists():
        print("No log directory found. Run some tests first.")
        return
    
    log_files = list(log_dir.glob("*.log"))
    
    if not log_files:
        print("No log files found.")
        return
    
    print(f"\n=== Available Log Files ===")
    print(f"Log directory: {log_dir.absolute()}")
    
    for log_file in sorted(log_files, key=lambda x: x.stat().st_mtime, reverse=True):
        size = log_file.stat().st_size
        print(f"  {log_file.name} ({size:,} bytes)")
    
    # Show tail of most recent log
    if log_files:
        latest_log = max(log_files, key=lambda x: x.stat().st_mtime)
        print(f"\n--- Last 10 lines of {latest_log.name} ---")
        
        try:
            with open(latest_log, 'r') as f:
                lines = f.readlines()
                for line in lines[-10:]:
                    print(line.rstrip())
        except Exception as e:
            print(f"Error reading log file: {e}")


def demonstrate_logging_features():
    """Demonstrate all logging features"""
    print("="*70)
    print("HOLE FIXING INTERFACE - LOGGING DEMONSTRATION")
    print("="*70)
    
    print("\nThis demonstration will show:")
    print("1. Input content for each hole")
    print("2. Attempted repair strategies") 
    print("3. Success/failure status for each repair")
    print("4. Overall dataset statistics")
    print("5. Detailed log files for later analysis")
    
    print("\nStarting demonstration...")
    
    # Test demo version (fast, no Lean compilation)
    test_demo_hole_fixing_with_logs("minif2f", max_problems=2)
    
    # Show comparison
    compare_fixers_with_logs("minif2f", max_problems=2)
    
    # Show log files
    show_log_files()
    
    print("\n" + "="*70)
    print("DEMONSTRATION COMPLETED")
    print("="*70)
    print("\nKey features demonstrated:")
    print("✓ Detailed input/output logging for each hole")
    print("✓ Strategy attempt tracking")
    print("✓ Success/failure indicators (✓/✗)")
    print("✓ Per-problem and dataset-level statistics")
    print("✓ Timestamped log files for analysis")
    print(f"\nAll logs are saved in: {Path('hole_fixing_logs').absolute()}")


def main():
    parser = argparse.ArgumentParser(
        description="Test Hole Fixing Interface with Detailed Logging",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  python test_hole_fixing_with_logs.py demo           # Full demonstration
  python test_hole_fixing_with_logs.py test-demo      # Test demo version
  python test_hole_fixing_with_logs.py test-real      # Test real version (slower)
  python test_hole_fixing_with_logs.py compare        # Compare strategies
  python test_hole_fixing_with_logs.py logs           # Show log files
        """
    )
    
    parser.add_argument('command', 
                       choices=['demo', 'test-demo', 'test-real', 'compare', 'logs'],
                       help='Command to execute')
    
    parser.add_argument('--dataset', default='minif2f',
                       choices=['minif2f', 'proverbench', 'putnam'],
                       help='Dataset to use for testing')
    
    parser.add_argument('--max-problems', type=int, default=3,
                       help='Maximum number of problems to process')
    
    args = parser.parse_args()
    
    if args.command == 'demo':
        demonstrate_logging_features()
        
    elif args.command == 'test-demo':
        test_demo_hole_fixing_with_logs(args.dataset, args.max_problems)
        
    elif args.command == 'test-real':
        test_real_hole_fixing_with_logs(args.dataset, args.max_problems)
        
    elif args.command == 'compare':
        compare_fixers_with_logs(args.dataset, args.max_problems)
        
    elif args.command == 'logs':
        show_log_files()


if __name__ == "__main__":
    main() 
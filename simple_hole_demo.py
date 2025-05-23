#!/usr/bin/env python3
"""
Simplified Hole Fixing Interface Demo

This script demonstrates the hole fixing interface without triggering
the full Lean build process during imports, with detailed logging.
"""

import argparse
import json
import logging
from typing import Dict, List
import time
from pathlib import Path
from datetime import datetime

from unified_problem_manager import problem_manager, Problem


class MockProofStatus:
    """Mock proof status for demonstration"""
    PASS = "pass"
    FAIL = "fail"
    ERROR = "error"
    UNKNOWN = "unknown"


class MockHoleResult:
    """Mock hole result for demonstration"""
    def __init__(self, hole_id: str, original_content: str, fixed_content: str, 
                 original_status: str, fixed_status: str, error_message: str = None):
        self.hole_id = hole_id
        self.original_content = original_content
        self.fixed_content = fixed_content
        self.original_status = original_status
        self.fixed_status = fixed_status
        self.error_message = error_message


class MockProofSynthesisResult:
    """Mock proof synthesis result for demonstration"""
    def __init__(self, problem_id: str, dataset: str, original_proof_status: str,
                 hole_results: List[MockHoleResult], synthesized_proof: str,
                 synthesized_status: str, partial_fix_status: str, error_message: str = None):
        self.problem_id = problem_id
        self.dataset = dataset
        self.original_proof_status = original_proof_status
        self.hole_results = hole_results
        self.synthesized_proof = synthesized_proof
        self.synthesized_status = synthesized_status
        self.partial_fix_status = partial_fix_status
        self.error_message = error_message


class SimpleHoleFixerDemo:
    """Simple hole fixer for demonstration"""
    
    def fix_hole(self, hole_content: str, problem_context: Problem) -> str:
        """Fix hole by replacing 'hole' with 'sorry'"""
        if "hole" in hole_content:
            return hole_content.replace("hole", "sorry")
        return hole_content + "\n  sorry"


class CustomHoleFixerDemo:
    """Custom hole fixer for demonstration"""
    
    def __init__(self, strategy: str = "simp"):
        self.strategy = strategy
    
    def fix_hole(self, hole_content: str, problem_context: Problem) -> str:
        """Fix hole using specified strategy"""
        if "hole" in hole_content:
            return hole_content.replace("hole", self.strategy)
        return hole_content + f"\n  {self.strategy}"


class ProgressiveHoleFixerDemo:
    """Progressive hole fixer for demonstration"""
    
    def __init__(self):
        self.strategies = ["simp", "tauto", "ring", "norm_num", "sorry"]
    
    def fix_hole(self, hole_content: str, problem_context: Problem) -> str:
        """Try multiple strategies (mock implementation)"""
        # In a real implementation, this would test each strategy
        # For demo purposes, we'll just use the first strategy
        strategy = self.strategies[0]
        if "hole" in hole_content:
            return hole_content.replace("hole", strategy)
        return hole_content + f"\n  {strategy}"


class MockDatasetProcessor:
    """Mock dataset processor for demonstration with logging"""
    
    def __init__(self, hole_fixer, enable_logging: bool = True):
        self.hole_fixer = hole_fixer
        self.enable_logging = enable_logging
        
        if enable_logging:
            self._setup_logging()
    
    def _setup_logging(self):
        """Setup detailed logging for the demo"""
        timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
        log_dir = Path("hole_fixing_logs")
        log_dir.mkdir(exist_ok=True)
        
        # Create logger
        self.logger = logging.getLogger('HoleFixingDemo')
        self.logger.setLevel(logging.INFO)
        
        # Clear existing handlers
        self.logger.handlers.clear()
        
        # File handler for detailed logs
        log_file = log_dir / f"hole_fixing_demo_{timestamp}.log"
        file_handler = logging.FileHandler(log_file)
        file_handler.setLevel(logging.INFO)
        
        # Console handler for important info
        console_handler = logging.StreamHandler()
        console_handler.setLevel(logging.INFO)
        
        # Formatter
        formatter = logging.Formatter(
            '%(asctime)s - %(levelname)s - %(message)s',
            datefmt='%Y-%m-%d %H:%M:%S'
        )
        file_handler.setFormatter(formatter)
        console_handler.setFormatter(formatter)
        
        self.logger.addHandler(file_handler)
        self.logger.addHandler(console_handler)
        
        self.logger.info(f"=== Hole Fixing Demo Session Started ===")
        self.logger.info(f"Fixer: {type(self.hole_fixer).__name__}")
        self.logger.info(f"Log file: {log_file}")
    
    def process_problem(self, problem: Problem) -> MockProofSynthesisResult:
        """Mock processing of a single problem with detailed logging"""
        
        if self.enable_logging:
            self.logger.info(f"\n--- Processing Problem: {problem.dataset}/{problem.problem_id} ---")
        
        # Simulate extracting holes from the problem
        mock_holes = [
            "have h1 : P → Q := hole",
            "have h2 : Q → R := hole", 
            "exact hole"
        ]
        
        if self.enable_logging:
            self.logger.info(f"Extracted {len(mock_holes)} holes from problem")
        
        hole_results = []
        for i, hole_content in enumerate(mock_holes):
            hole_id = f"hole_{i}"
            
            if self.enable_logging:
                self.logger.info(f"\n  --> Processing {hole_id}")
                self.logger.info(f"  Input: {hole_content.strip()}")
            
            # Mock original status (randomly assign for demo)
            original_status = MockProofStatus.FAIL if i % 2 == 0 else MockProofStatus.PASS
            
            if self.enable_logging:
                self.logger.info(f"  Original hole status: {original_status}")
            
            # Fix the hole
            if self.enable_logging:
                self.logger.info(f"  Attempting repair with {type(self.hole_fixer).__name__}...")
            
            fixed_content = self.hole_fixer.fix_hole(hole_content, problem)
            
            if self.enable_logging:
                self.logger.info(f"  Fixed content: {fixed_content.strip()}")
            
            # Mock fixed status (assume fixing improves things)
            fixed_status = MockProofStatus.PASS if original_status == MockProofStatus.FAIL else MockProofStatus.PASS
            
            if self.enable_logging:
                success_indicator = "✓" if fixed_status == MockProofStatus.PASS else "✗"
                self.logger.info(f"  Repair result: {fixed_status} {success_indicator}")
            
            hole_results.append(MockHoleResult(
                hole_id=hole_id,
                original_content=hole_content,
                fixed_content=fixed_content,
                original_status=original_status,
                fixed_status=fixed_status
            ))
        
        # Log hole processing summary
        if self.enable_logging:
            successful_fixes = sum(1 for h in hole_results if h.fixed_status == MockProofStatus.PASS)
            improved_holes = sum(1 for h in hole_results 
                               if h.original_status == MockProofStatus.FAIL and h.fixed_status == MockProofStatus.PASS)
            self.logger.info(f"\nHole processing summary:")
            self.logger.info(f"  Total holes: {len(hole_results)}")
            self.logger.info(f"  Successful fixes: {successful_fixes}")
            self.logger.info(f"  Improved holes: {improved_holes}")
        
        # Mock synthesis results
        original_proof_status = MockProofStatus.FAIL
        synthesized_status = MockProofStatus.PASS if len([h for h in hole_results if h.fixed_status == MockProofStatus.PASS]) > 1 else MockProofStatus.FAIL
        partial_fix_status = MockProofStatus.PASS if any(h.fixed_status == MockProofStatus.PASS for h in hole_results if h.original_status == MockProofStatus.FAIL) else MockProofStatus.FAIL
        
        if self.enable_logging:
            synthesis_indicator = "✓" if synthesized_status == MockProofStatus.PASS else "✗"
            self.logger.info(f"Synthesis result: {synthesized_status} {synthesis_indicator}")
            
            partial_indicator = "✓" if partial_fix_status == MockProofStatus.PASS else "✗"
            self.logger.info(f"Partial fix result: {partial_fix_status} {partial_indicator}")
            
            # Final summary for this problem
            self.logger.info(f"Problem {problem.problem_id} summary:")
            self.logger.info(f"  Original: {original_proof_status}")
            self.logger.info(f"  Full synthesis: {synthesized_status}")
            self.logger.info(f"  Partial fix: {partial_fix_status}")
        
        return MockProofSynthesisResult(
            problem_id=problem.problem_id,
            dataset=problem.dataset,
            original_proof_status=original_proof_status,
            hole_results=hole_results,
            synthesized_proof="mock synthesized proof",
            synthesized_status=synthesized_status,
            partial_fix_status=partial_fix_status
        )
    
    def process_dataset(self, dataset_name: str, max_problems: int = 5):
        """Mock processing of a dataset with detailed logging"""
        problems = problem_manager.list_problems(dataset_name)[:max_problems]
        results = []
        
        if self.enable_logging:
            self.logger.info(f"\n{'='*60}")
            self.logger.info(f"PROCESSING DATASET: {dataset_name}")
            self.logger.info(f"{'='*60}")
            self.logger.info(f"Total problems to process: {len(problems)}")
        
        for i, problem in enumerate(problems):
            if self.enable_logging:
                self.logger.info(f"\n[{i+1}/{len(problems)}] Starting problem {problem.problem_id}")
            
            result = self.process_problem(problem)
            results.append(result)
            
            if self.enable_logging:
                self.logger.info(f"[{i+1}/{len(problems)}] Completed problem {problem.problem_id}")
        
        # Log dataset statistics
        if self.enable_logging:
            self._log_dataset_statistics(dataset_name, results)
        
        return results
    
    def _log_dataset_statistics(self, dataset_name: str, results: List[MockProofSynthesisResult]):
        """Log detailed dataset statistics"""
        if not self.enable_logging:
            return
            
        total_problems = len(results)
        original_pass = sum(1 for r in results if r.original_proof_status == MockProofStatus.PASS)
        synthesis_pass = sum(1 for r in results if r.synthesized_status == MockProofStatus.PASS)
        partial_pass = sum(1 for r in results if r.partial_fix_status == MockProofStatus.PASS)
        
        self.logger.info(f"\n{'='*60}")
        self.logger.info(f"DATASET STATISTICS: {dataset_name}")
        self.logger.info(f"{'='*60}")
        
        # Basic statistics
        self.logger.info(f"Total problems: {total_problems}")
        self.logger.info(f"Original pass count: {original_pass}")
        self.logger.info(f"Original pass rate: {original_pass/total_problems*100:.1f}%")
        
        self.logger.info(f"Synthesis pass count: {synthesis_pass}")
        self.logger.info(f"Synthesis pass rate: {synthesis_pass/total_problems*100:.1f}%")
        
        self.logger.info(f"Partial fix pass count: {partial_pass}")
        self.logger.info(f"Partial fix pass rate: {partial_pass/total_problems*100:.1f}%")
        
        # Improvement metrics
        synthesis_improvement = synthesis_pass - original_pass
        partial_improvement = partial_pass - original_pass
        
        self.logger.info(f"\nImprovement metrics:")
        self.logger.info(f"Full synthesis improvement: +{synthesis_improvement} problems")
        self.logger.info(f"Partial fix improvement: +{partial_improvement} problems")
        
        # Hole-level statistics
        total_holes = sum(len(r.hole_results) for r in results)
        successful_holes = sum(sum(1 for h in r.hole_results if h.fixed_status == MockProofStatus.PASS) for r in results)
        
        self.logger.info(f"Total holes processed: {total_holes}")
        self.logger.info(f"Successful hole fixes: {successful_holes}")
        self.logger.info(f"Hole fix rate: {successful_holes/total_holes*100:.1f}%")
        
        self.logger.info(f"{'='*60}")


def demo_simple_fixer():
    """Demonstrate simple hole fixer"""
    print("\n=== Demo: Simple Hole Fixer ===")
    
    fixer = SimpleHoleFixerDemo()
    processor = MockDatasetProcessor(fixer)
    
    # Process a few problems from minif2f for demo
    results = processor.process_dataset("minif2f", max_problems=3)
    
    for result in results:
        print(f"\nProblem: {result.problem_id}")
        print(f"Original Status: {result.original_proof_status}")
        print(f"Synthesis Status: {result.synthesized_status}")
        print(f"Partial Fix Status: {result.partial_fix_status}")
        print(f"Holes Processed: {len(result.hole_results)}")
        
        for hole_result in result.hole_results:
            print(f"  {hole_result.hole_id}: {hole_result.original_status} → {hole_result.fixed_status}")
            print(f"    Original: {hole_result.original_content}")
            print(f"    Fixed: {hole_result.fixed_content}")


def demo_custom_fixer():
    """Demonstrate custom hole fixer"""
    print("\n=== Demo: Custom Hole Fixer (simp strategy) ===")
    
    fixer = CustomHoleFixerDemo("simp")
    processor = MockDatasetProcessor(fixer)
    
    # Process a few problems from proverbench for demo
    results = processor.process_dataset("proverbench", max_problems=2)
    
    for result in results:
        print(f"\nProblem: {result.problem_id}")
        print(f"Synthesis Status: {result.synthesized_status}")
        print(f"Holes Fixed: {sum(1 for h in result.hole_results if h.fixed_status == MockProofStatus.PASS)}/{len(result.hole_results)}")


def demo_progressive_fixer():
    """Demonstrate progressive hole fixer"""
    print("\n=== Demo: Progressive Hole Fixer ===")
    
    fixer = ProgressiveHoleFixerDemo()
    processor = MockDatasetProcessor(fixer)
    
    # Process a few problems from putnam for demo
    results = processor.process_dataset("putnam", max_problems=2)
    
    for result in results:
        print(f"\nProblem: {result.problem_id}")
        print(f"Original Status: {result.original_proof_status}")
        print(f"Synthesis Status: {result.synthesized_status}")
        print(f"Improvement: {result.original_proof_status} → {result.synthesized_status}")


def compare_fixers():
    """Compare different hole fixers"""
    print("\n=== Demo: Comparing Different Fixers ===")
    
    fixers = {
        "simple": SimpleHoleFixerDemo(),
        "custom_simp": CustomHoleFixerDemo("simp"),
        "custom_tauto": CustomHoleFixerDemo("tauto"),
        "progressive": ProgressiveHoleFixerDemo()
    }
    
    dataset = "minif2f"
    results = {}
    
    for fixer_name, fixer in fixers.items():
        print(f"\nTesting {fixer_name} fixer...")
        processor = MockDatasetProcessor(fixer)
        fixer_results = processor.process_dataset(dataset, max_problems=3)
        results[fixer_name] = fixer_results
    
    # Compare results
    print(f"\n--- Comparison Results for {dataset} ---")
    print(f"{'Fixer':<15} {'Problems':<10} {'Synthesis Pass':<15} {'Partial Pass':<12}")
    print("-" * 60)
    
    for fixer_name, fixer_results in results.items():
        total_problems = len(fixer_results)
        synthesis_pass = sum(1 for r in fixer_results if r.synthesized_status == MockProofStatus.PASS)
        partial_pass = sum(1 for r in fixer_results if r.partial_fix_status == MockProofStatus.PASS)
        
        print(f"{fixer_name:<15} {total_problems:<10} {synthesis_pass:<15} {partial_pass:<12}")


def show_system_status():
    """Show the current status of the unified system"""
    print("\n=== System Status ===")
    
    datasets = problem_manager.list_datasets()
    print(f"Available datasets: {len(datasets)}")
    
    total_problems = 0
    for dataset in datasets:
        problems = problem_manager.list_problems(dataset)
        print(f"  {dataset}: {len(problems)} problems")
        total_problems += len(problems)
    
    print(f"Total problems: {total_problems}")
    
    # Check if hole and decompose versions exist
    print("\nChecking processed versions...")
    for dataset in datasets:
        problems = problem_manager.list_problems(dataset)
        sample_problem = problems[0] if problems else None
        
        if sample_problem:
            hole_dir = Path(sample_problem.hole_dir)
            decompose_dir = Path(sample_problem.decomposed_dir)
            
            hole_exists = hole_dir.exists() and any(hole_dir.iterdir())
            decompose_exists = decompose_dir.exists() and any(decompose_dir.iterdir())
            
            print(f"  {dataset}: hole_versions={'✓' if hole_exists else '✗'}, decompose_versions={'✓' if decompose_exists else '✗'}")


def main():
    parser = argparse.ArgumentParser(
        description="Simplified Hole Fixing Interface Demonstration",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  python simple_hole_demo.py demo                    # Run all demos
  python simple_hole_demo.py simple                  # Demo simple fixer
  python simple_hole_demo.py custom                  # Demo custom fixer
  python simple_hole_demo.py progressive             # Demo progressive fixer
  python simple_hole_demo.py compare                 # Compare fixers
  python simple_hole_demo.py status                  # Show system status
        """
    )
    
    parser.add_argument('command', 
                       choices=['demo', 'simple', 'custom', 'progressive', 'compare', 'status'],
                       help='Command to execute')
    
    args = parser.parse_args()
    
    print("Hole Fixing Interface Demonstration")
    print("=" * 50)
    
    if args.command == 'demo':
        print("Running all demonstrations...")
        show_system_status()
        demo_simple_fixer()
        demo_custom_fixer()
        demo_progressive_fixer()
        compare_fixers()
        
    elif args.command == 'simple':
        demo_simple_fixer()
        
    elif args.command == 'custom':
        demo_custom_fixer()
        
    elif args.command == 'progressive':
        demo_progressive_fixer()
        
    elif args.command == 'compare':
        compare_fixers()
        
    elif args.command == 'status':
        show_system_status()
    
    print("\n" + "=" * 50)
    print("Demo completed!")


if __name__ == "__main__":
    main() 
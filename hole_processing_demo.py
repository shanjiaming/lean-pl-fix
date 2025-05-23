#!/usr/bin/env python3
"""
Demonstration of Hole Fixing Interface

This script shows how to use the hole fixing interface with different
callback functions and generate comprehensive reports for datasets.
"""

import argparse
import json
from typing import Dict
import time

from hole_fixer_interface import (
    HoleFixerInterface, DatasetProcessor, SimpleHoleFixer, DPV2HoleFixer,
    ProofStatus, DatasetReport
)
from unified_problem_manager import problem_manager, Problem


class CustomHoleFixer(HoleFixerInterface):
    """Example custom hole fixer"""
    
    def __init__(self, strategy: str = "simp"):
        self.strategy = strategy
    
    def fix_hole(self, hole_content: str, problem_context: Problem) -> str:
        """Fix hole using specified strategy"""
        if "hole" in hole_content:
            if self.strategy == "simp":
                return hole_content.replace("hole", "simp")
            elif self.strategy == "tauto":
                return hole_content.replace("hole", "tauto")
            elif self.strategy == "ring":
                return hole_content.replace("hole", "ring")
            elif self.strategy == "norm_num":
                return hole_content.replace("hole", "norm_num")
            else:
                return hole_content.replace("hole", "sorry")
        
        return hole_content + f"\n  {self.strategy}"


class ProgressiveHoleFixer(HoleFixerInterface):
    """Hole fixer that tries multiple strategies progressively"""
    
    def __init__(self):
        self.strategies = ["simp", "tauto", "ring", "norm_num", "sorry"]
        self.processor = None
    
    def set_processor(self, processor):
        """Set the processor for checking status"""
        self.processor = processor
    
    def fix_hole(self, hole_content: str, problem_context: Problem) -> str:
        """Try multiple strategies until one works"""
        for strategy in self.strategies:
            if "hole" in hole_content:
                candidate = hole_content.replace("hole", strategy)
            else:
                candidate = hole_content + f"\n  {strategy}"
            
            # Check if this strategy works
            if self.processor:
                status, _ = self.processor.synthesizer.check_proof_status(problem_context, candidate)
                if status == ProofStatus.PASS:
                    return candidate
        
        # If nothing works, return sorry
        return hole_content.replace("hole", "sorry") if "hole" in hole_content else hole_content + "\n  sorry"


def print_summary_report(reports: Dict[str, DatasetReport]):
    """Print a comprehensive summary of all reports"""
    print("\n" + "="*80)
    print("COMPREHENSIVE HOLE FIXING REPORT")
    print("="*80)
    
    total_problems = 0
    total_original_pass = 0
    total_synthesis_pass = 0
    total_partial_fix_pass = 0
    
    for dataset_name, report in reports.items():
        print(f"\n--- Dataset: {dataset_name} ---")
        print(f"Total Problems: {report.total_problems}")
        print(f"Original Pass Rate: {report.original_pass_count}/{report.total_problems} ({report.original_pass_count/report.total_problems*100:.1f}%)")
        print(f"Full Synthesis Pass Rate: {report.synthesis_pass_count}/{report.total_problems} ({report.synthesis_pass_count/report.total_problems*100:.1f}%)")
        print(f"Partial Fix Pass Rate: {report.partial_fix_pass_count}/{report.total_problems} ({report.partial_fix_pass_count/report.total_problems*100:.1f}%)")
        
        # Show improvement metrics
        synthesis_improvement = report.synthesis_pass_count - report.original_pass_count
        partial_improvement = report.partial_fix_pass_count - report.original_pass_count
        
        print(f"Full Synthesis Improvement: +{synthesis_improvement} problems")
        print(f"Partial Fix Improvement: +{partial_improvement} problems")
        
        # Show hole-level statistics
        if report.hole_pass_rates:
            avg_hole_pass_rate = sum(report.hole_pass_rates.values()) / len(report.hole_pass_rates)
            print(f"Average Hole Fix Rate: {avg_hole_pass_rate*100:.1f}%")
            print(f"Total Holes Tracked: {len(report.hole_pass_rates)}")
        
        total_problems += report.total_problems
        total_original_pass += report.original_pass_count
        total_synthesis_pass += report.synthesis_pass_count
        total_partial_fix_pass += report.partial_fix_pass_count
    
    print(f"\n--- Overall Summary ---")
    print(f"Total Problems Across All Datasets: {total_problems}")
    print(f"Overall Original Pass Rate: {total_original_pass}/{total_problems} ({total_original_pass/total_problems*100:.1f}%)")
    print(f"Overall Full Synthesis Pass Rate: {total_synthesis_pass}/{total_problems} ({total_synthesis_pass/total_problems*100:.1f}%)")
    print(f"Overall Partial Fix Pass Rate: {total_partial_fix_pass}/{total_problems} ({total_partial_fix_pass/total_problems*100:.1f}%)")
    print(f"Overall Full Synthesis Improvement: +{total_synthesis_pass - total_original_pass} problems")
    print(f"Overall Partial Fix Improvement: +{total_partial_fix_pass - total_original_pass} problems")


def demo_simple_fixer():
    """Demonstrate simple hole fixer"""
    print("\n=== Demo: Simple Hole Fixer ===")
    
    fixer = SimpleHoleFixer()
    processor = DatasetProcessor(fixer)
    
    # Process just the first few problems from minif2f for demo
    problems = problem_manager.list_problems("minif2f")[:3]
    
    for problem in problems:
        print(f"\nProcessing: {problem.problem_id}")
        result = processor.process_problem(problem)
        
        print(f"Original Status: {result.original_proof_status.value}")
        print(f"Synthesis Status: {result.synthesized_status.value}")
        print(f"Partial Fix Status: {result.partial_fix_status.value}")
        print(f"Holes Processed: {len(result.hole_results)}")


def demo_progressive_fixer():
    """Demonstrate progressive hole fixer"""
    print("\n=== Demo: Progressive Hole Fixer ===")
    
    fixer = ProgressiveHoleFixer()
    processor = DatasetProcessor(fixer)
    fixer.set_processor(processor)
    
    # Process just the first few problems from minif2f for demo
    problems = problem_manager.list_problems("minif2f")[:2]
    
    for problem in problems:
        print(f"\nProcessing: {problem.problem_id}")
        result = processor.process_problem(problem)
        
        print(f"Original Status: {result.original_proof_status.value}")
        print(f"Synthesis Status: {result.synthesized_status.value}")
        print(f"Holes Fixed: {sum(1 for h in result.hole_results if h.fixed_status == ProofStatus.PASS)}/{len(result.hole_results)}")


def run_full_dataset_analysis(fixer_type: str, dataset: str = None):
    """Run full dataset analysis with specified fixer"""
    print(f"\n=== Running Full Analysis with {fixer_type} Fixer ===")
    
    # Create the appropriate fixer
    if fixer_type == "simple":
        fixer = SimpleHoleFixer()
    elif fixer_type == "progressive":
        fixer = ProgressiveHoleFixer()
        processor = DatasetProcessor(fixer)
        fixer.set_processor(processor)
    elif fixer_type == "dpv2":
        fixer = DPV2HoleFixer()
    elif fixer_type == "custom_simp":
        fixer = CustomHoleFixer("simp")
    elif fixer_type == "custom_tauto":
        fixer = CustomHoleFixer("tauto")
    else:
        print(f"Unknown fixer type: {fixer_type}")
        return
    
    if fixer_type != "progressive":
        processor = DatasetProcessor(fixer)
    
    start_time = time.time()
    
    if dataset:
        # Process single dataset
        print(f"Processing dataset: {dataset}")
        report = processor.process_dataset(dataset)
        reports = {dataset: report}
    else:
        # Process all datasets
        print("Processing all datasets...")
        reports = processor.process_all_datasets()
    
    end_time = time.time()
    processing_time = end_time - start_time
    
    # Print summary
    print_summary_report(reports)
    print(f"\nProcessing completed in {processing_time:.2f} seconds")
    
    # Save detailed report
    timestamp = time.strftime("%Y%m%d_%H%M%S")
    output_file = f"hole_fixing_report_{fixer_type}_{timestamp}.json"
    processor.save_report(reports, output_file)
    
    return reports


def compare_fixers(dataset: str = "minif2f"):
    """Compare different hole fixers on the same dataset"""
    print(f"\n=== Comparing Different Fixers on {dataset} ===")
    
    fixers = {
        "simple": SimpleHoleFixer(),
        "custom_simp": CustomHoleFixer("simp"),
        "custom_tauto": CustomHoleFixer("tauto"),
        # "dpv2": DPV2HoleFixer(),  # Commented out as it might be slow
    }
    
    results = {}
    
    for fixer_name, fixer in fixers.items():
        print(f"\nTesting {fixer_name} fixer...")
        
        processor = DatasetProcessor(fixer)
        report = processor.process_dataset(dataset)
        results[fixer_name] = report
    
    # Compare results
    print(f"\n--- Comparison Results for {dataset} ---")
    print(f"{'Fixer':<15} {'Original':<10} {'Synthesis':<10} {'Partial':<10} {'Improvement':<12}")
    print("-" * 65)
    
    for fixer_name, report in results.items():
        orig_rate = report.original_pass_count / report.total_problems * 100
        synth_rate = report.synthesis_pass_count / report.total_problems * 100
        partial_rate = report.partial_fix_pass_count / report.total_problems * 100
        improvement = report.synthesis_pass_count - report.original_pass_count
        
        print(f"{fixer_name:<15} {orig_rate:<10.1f} {synth_rate:<10.1f} {partial_rate:<10.1f} +{improvement:<11}")


def main():
    parser = argparse.ArgumentParser(
        description="Hole Fixing Interface Demonstration",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  python hole_processing_demo.py demo                    # Run basic demos
  python hole_processing_demo.py analyze simple          # Analyze with simple fixer
  python hole_processing_demo.py analyze dpv2 --dataset minif2f  # Analyze minif2f with DPV2
  python hole_processing_demo.py compare --dataset proverbench    # Compare fixers on proverbench
        """
    )
    
    parser.add_argument('command', choices=['demo', 'analyze', 'compare'],
                       help='Command to execute')
    
    parser.add_argument('fixer_type', nargs='?', 
                       choices=['simple', 'progressive', 'dpv2', 'custom_simp', 'custom_tauto'],
                       help='Type of hole fixer to use (for analyze command)')
    
    parser.add_argument('--dataset', 
                       choices=['minif2f', 'proverbench', 'putnam'],
                       help='Specific dataset to process')
    
    args = parser.parse_args()
    
    if args.command == 'demo':
        print("Running demonstration of hole fixing interface...")
        demo_simple_fixer()
        demo_progressive_fixer()
        
    elif args.command == 'analyze':
        if not args.fixer_type:
            print("Error: fixer_type is required for analyze command")
            return
        run_full_dataset_analysis(args.fixer_type, args.dataset)
        
    elif args.command == 'compare':
        dataset = args.dataset or 'minif2f'
        compare_fixers(dataset)


if __name__ == "__main__":
    main() 
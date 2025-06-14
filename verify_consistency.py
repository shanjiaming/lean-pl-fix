#!/usr/bin/env python3

import json
import os
import sys
from typing import List, Dict, Tuple

def load_pipeline_results(dataset_name: str) -> List[Dict]:
    """Load pipeline results from JSON file"""
    results_path = f"decomposition_results/{dataset_name}_pipeline_results.json"
    
    if not os.path.exists(results_path):
        print(f"❌ Pipeline results file not found: {results_path}")
        return []
    
    try:
        with open(results_path, 'r') as f:
            return json.load(f)
    except Exception as e:
        print(f"❌ Error loading {results_path}: {e}")
        return []

def check_verification_consistency(records: List[Dict], dataset_name: str) -> Tuple[List[str], List[str]]:
    """
    Check verification consistency rules:
    1. original_verification_pass=True → hole_verification_pass=True
    2. hole_verification_pass=True → filled_verification_pass=True
    
    Returns:
        Tuple of (rule1_violations, rule2_violations)
    """
    rule1_violations = []  # original=True but hole=False
    rule2_violations = []  # hole=True but filled=False
    
    for record in records:
        problem_id = record.get("problem_id", "unknown")
        original_pass = record.get("original_verification_pass")
        hole_pass = record.get("hole_verification_pass")
        filled_pass = record.get("filled_verification_pass")
        
        # Rule 1: original_verification_pass=True → hole_verification_pass=True
        if original_pass is True and hole_pass is not True:
            rule1_violations.append(problem_id)
        
        # Rule 2: hole_verification_pass=True → filled_verification_pass=True
        if hole_pass is True and filled_pass is not True:
            rule2_violations.append(problem_id)
    
    return rule1_violations, rule2_violations

def print_violations(rule1_violations: List[str], rule2_violations: List[str], dataset_name: str):
    """Print violation report"""
    print(f"\n=== Verification Consistency Report for {dataset_name} ===")
    
    total_violations = len(rule1_violations) + len(rule2_violations)
    
    if total_violations == 0:
        print("✅ All verification results are consistent!")
        return
    
    print(f"❌ Found {total_violations} consistency violations:")
    print()
    
    # Rule 1 violations
    if rule1_violations:
        print(f"📋 Rule 1 Violations ({len(rule1_violations)} problems):")
        print("   original_verification_pass=True but hole_verification_pass≠True")
        for problem_id in rule1_violations:
            print(f"   • {problem_id}")
        print()
    
    # Rule 2 violations
    if rule2_violations:
        print(f"📋 Rule 2 Violations ({len(rule2_violations)} problems):")
        print("   hole_verification_pass=True but filled_verification_pass≠True")
        for problem_id in rule2_violations:
            print(f"   • {problem_id}")
        print()

def print_detailed_violations(records: List[Dict], rule1_violations: List[str], rule2_violations: List[str], dataset_name: str):
    """Print detailed violation information"""
    if not rule1_violations and not rule2_violations:
        return
    
    print(f"=== Detailed Violation Information for {dataset_name} ===")
    
    # Create a lookup for records
    record_lookup = {r["problem_id"]: r for r in records}
    
    if rule1_violations:
        print(f"\n📋 Rule 1 Violations Details:")
        print("   Problem ID                           | Original | Hole   | Filled")
        print("   -------------------------------------|----------|--------|--------")
        for problem_id in rule1_violations:
            record = record_lookup.get(problem_id, {})
            original = record.get("original_verification_pass", "?")
            hole = record.get("hole_verification_pass", "?")
            filled = record.get("filled_verification_pass", "?")
            print(f"   {problem_id:<35} | {str(original):<8} | {str(hole):<6} | {str(filled)}")
    
    if rule2_violations:
        print(f"\n📋 Rule 2 Violations Details:")
        print("   Problem ID                           | Original | Hole   | Filled")
        print("   -------------------------------------|----------|--------|--------")
        for problem_id in rule2_violations:
            record = record_lookup.get(problem_id, {})
            original = record.get("original_verification_pass", "?")
            hole = record.get("hole_verification_pass", "?")
            filled = record.get("filled_verification_pass", "?")
            print(f"   {problem_id:<35} | {str(original):<8} | {str(hole):<6} | {str(filled)}")

def verify_all_datasets():
    """Verify consistency for all available datasets"""
    datasets = []
    
    # Find all available pipeline results files
    results_dir = "decomposition_results"
    if os.path.exists(results_dir):
        for filename in os.listdir(results_dir):
            if filename.endswith("_pipeline_results.json"):
                dataset_name = filename.replace("_pipeline_results.json", "")
                datasets.append(dataset_name)
    
    if not datasets:
        print("❌ No pipeline results files found in decomposition_results/")
        return
    
    print(f"Found {len(datasets)} datasets: {', '.join(datasets)}")
    
    total_rule1_violations = 0
    total_rule2_violations = 0
    
    for dataset_name in datasets:
        records = load_pipeline_results(dataset_name)
        if not records:
            continue
        
        rule1_violations, rule2_violations = check_verification_consistency(records, dataset_name)
        
        total_rule1_violations += len(rule1_violations)
        total_rule2_violations += len(rule2_violations)
        
        print_violations(rule1_violations, rule2_violations, dataset_name)
        print_detailed_violations(records, rule1_violations, rule2_violations, dataset_name)
    
    # Overall summary
    print("\n" + "="*60)
    print("=== OVERALL SUMMARY ===")
    total_violations = total_rule1_violations + total_rule2_violations
    
    if total_violations == 0:
        print("🎉 All datasets pass verification consistency checks!")
    else:
        print(f"⚠️  Total violations across all datasets: {total_violations}")
        print(f"   Rule 1 violations: {total_rule1_violations}")
        print(f"   Rule 2 violations: {total_rule2_violations}")
        
    print(f"Verified {len(datasets)} datasets")

def main():
    """Main function"""
    if len(sys.argv) > 1:
        dataset_name = sys.argv[1]
        print(f"Verifying consistency for dataset: {dataset_name}")
        
        records = load_pipeline_results(dataset_name)
        if records:
            rule1_violations, rule2_violations = check_verification_consistency(records, dataset_name)
            print_violations(rule1_violations, rule2_violations, dataset_name)
            print_detailed_violations(records, rule1_violations, rule2_violations, dataset_name)
    else:
        print("Verifying consistency for all datasets...")
        verify_all_datasets()

if __name__ == "__main__":
    main()
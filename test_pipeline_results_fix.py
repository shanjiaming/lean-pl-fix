#!/usr/bin/env python3

import json
import subprocess
import sys
import os
import time

def test_pipeline_results_consistency():
    """Test that pipeline_results.json now uses final verification results"""
    
    # Use a simple problem to test 
    problem_id = "putnam_1962_a1"  # This one should pass verification
    
    print(f"=== Testing pipeline_results.json consistency fix ===")
    print(f"Problem: {problem_id}")
    print()
    
    # Run the pipeline for this problem
    print("Running pipeline...")
    start_time = time.time()
    
    try:
        result = subprocess.run([
            "python", "decompose_hole_merge_pipeline.py", 
            "problem", "putnam", problem_id
        ], capture_output=True, text=True, timeout=300)  # 5 minute timeout
        
        if result.returncode != 0:
            print(f"❌ Pipeline failed:")
            print(f"STDOUT: {result.stdout}")
            print(f"STDERR: {result.stderr}")
            return
            
        print(f"✅ Pipeline completed in {time.time() - start_time:.1f}s")
        
    except subprocess.TimeoutExpired:
        print("⏰ Pipeline timed out")
        return
    except Exception as e:
        print(f"❌ Pipeline error: {e}")
        return
    
    # Check consistency between decomposition.json and pipeline_results.json
    print("\n=== Checking consistency ===")
    
    # Read decomposition.json
    decomp_path = f"decomposition_results/putnam/decomposed/{problem_id}/decomposition.json"
    if not os.path.exists(decomp_path):
        print(f"❌ decomposition.json not found at {decomp_path}")
        return
        
    with open(decomp_path, 'r') as f:
        decomp_data = json.load(f)
    
    # Read pipeline_results.json
    pipeline_path = "decomposition_results/putnam_pipeline_results.json"
    if not os.path.exists(pipeline_path):
        print(f"❌ pipeline_results.json not found at {pipeline_path}")
        return
        
    with open(pipeline_path, 'r') as f:
        pipeline_data = json.load(f)
    
    # Find the record for our problem (it should be the last one)
    target_record = None
    for record in reversed(pipeline_data):
        if record["problem_id"] == problem_id:
            target_record = record
            break
    
    if not target_record:
        print(f"❌ Problem {problem_id} not found in pipeline_results.json")
        return
    
    # Compare results
    decomp_hole = decomp_data.get("hole_verification_pass")
    decomp_filled = decomp_data.get("filled_verification_pass")
    
    pipeline_hole = target_record.get("hole_verification_pass")
    pipeline_filled = target_record.get("filled_verification_pass")
    
    print(f"decomposition.json: hole={decomp_hole}, filled={decomp_filled}")
    print(f"pipeline_results.json: hole={pipeline_hole}, filled={pipeline_filled}")
    
    # Check consistency
    hole_consistent = decomp_hole == pipeline_hole
    filled_consistent = decomp_filled == pipeline_filled
    
    if hole_consistent and filled_consistent:
        print("✅ Results are consistent between files!")
        print("🔧 Fix successful - pipeline_results.json now uses final verification results")
    else:
        print("⚠️  Results are inconsistent:")
        if not hole_consistent:
            print(f"  hole_verification_pass: decomp={decomp_hole} vs pipeline={pipeline_hole}")
        if not filled_consistent:
            print(f"  filled_verification_pass: decomp={decomp_filled} vs pipeline={pipeline_filled}")
        print("❌ Fix may not be working correctly")
    
    print(f"\nTimestamp: {target_record.get('timestamp')}")

if __name__ == "__main__":
    test_pipeline_results_consistency()
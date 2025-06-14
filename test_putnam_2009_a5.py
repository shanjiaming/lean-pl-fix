#!/usr/bin/env python3

import os
from decompose_hole_merge_pipeline import DecomposeHoleMergePipeline

def test_putnam_2009_a5():
    """Test putnam_2009_a5 with our fixed verification logic"""
    
    # Initialize the pipeline
    pipeline = DecomposeHoleMergePipeline()
    
    # Test with putnam_2009_a5 case
    problem_dir = "/home/matheye/lean-pl-fix/decomposition_results/putnam/decomposed/putnam_2009_a5"
    
    # Check if files exist
    hole_path = os.path.join(problem_dir, "hole_version.lean")
    filled_path = os.path.join(problem_dir, "complete_fixed_proof.lean")
    header_path = os.path.join(problem_dir, "header.lean")
    
    if not all(os.path.exists(p) for p in [hole_path, filled_path, header_path]):
        print("❌ Required files do not exist for putnam_2009_a5")
        print(f"  hole_version.lean exists: {os.path.exists(hole_path)}")
        print(f"  complete_fixed_proof.lean exists: {os.path.exists(filled_path)}")
        print(f"  header.lean exists: {os.path.exists(header_path)}")
        return
    
    # Read the header
    with open(header_path, 'r') as f:
        header_content = f.read()
    
    # Read hole and filled versions
    with open(hole_path, 'r') as f:
        hole_content = f.read()
    
    with open(filled_path, 'r') as f:
        filled_content = f.read()
    
    print("=== Testing putnam_2009_a5 ===")
    print(f"Header length: {len(header_content)} chars")
    print(f"Hole version length: {len(hole_content)} chars")
    print(f"Filled version length: {len(filled_content)} chars")
    print()
    
    print("=== Testing Hole Version ===")
    hole_result = pipeline.verify_lean_code(header_content, hole_content, with_macro=False)
    print(f"Hole verification result: {hole_result}")
    
    print("=== Testing Filled Version ===")
    filled_result = pipeline.verify_lean_code(header_content, filled_content, with_macro=False)
    print(f"Filled verification result: {filled_result}")
    
    print("=== Testing Individual Hole Verification ===")
    steps = pipeline.load_decomposition(problem_dir)
    if steps:
        print(f"Testing individual hole verification for first 5 holes...")
        for i, step in enumerate(steps[:5]):
            individual_result = pipeline._verify_single_hole_in_context(
                header_content, step.step_id, hole_content)
            print(f"  {step.step_id}: {individual_result}")
    print()
    
    print("=== Analysis ===")
    print(f"Overall hole verification: {hole_result}")
    print(f"Overall filled verification: {filled_result}")
    print(f"Individual holes (first 5): {[pipeline._verify_single_hole_in_context(header_content, step.step_id, hole_content) for step in steps[:5]] if steps else 'No steps'}")
    
    if hole_result == filled_result:
        print("✅ Overall verification results are consistent!")
    else:
        print("⚠️  Overall verification mismatch detected!")
    
    # Check if individual results match overall
    if steps:
        individual_results = [pipeline._verify_single_hole_in_context(header_content, step.step_id, hole_content) for step in steps[:5]]
        if all(r == hole_result for r in individual_results):
            print("✅ Individual hole verification matches overall hole verification!")
        else:
            print("⚠️  Individual hole verification does not match overall!")
    
if __name__ == "__main__":
    test_putnam_2009_a5()
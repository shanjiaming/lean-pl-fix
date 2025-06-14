#!/usr/bin/env python3

import os
import sys
from decompose_hole_merge_pipeline import DecomposeHoleMergePipeline

def test_verification_issue():
    """Test the verification issue where hole_verification_pass is true but filled_verification_pass is false"""
    
    # Initialize the pipeline
    pipeline = DecomposeHoleMergePipeline()
    
    # Test with putnam_1962_a1 case (should pass verification)
    problem_dir = "/home/matheye/lean-pl-fix/decomposition_results/putnam/decomposed/putnam_1962_a1"
    
    # Read the header
    header_path = os.path.join(problem_dir, "header.lean")
    with open(header_path, 'r') as f:
        header_content = f.read()
    
    print("=== Header Content ===")
    print(header_content)
    print()
    
    # Read hole version
    hole_path = os.path.join(problem_dir, "hole_version.lean")
    with open(hole_path, 'r') as f:
        hole_content = f.read()
    
    # Read filled version  
    filled_path = os.path.join(problem_dir, "complete_fixed_proof.lean")
    with open(filled_path, 'r') as f:
        filled_content = f.read()
    
    print("=== Testing Hole Version ===")
    hole_result = pipeline.verify_lean_code(header_content, hole_content, with_macro=False)
    print(f"Hole verification result: {hole_result}")
    
    # Get detailed error info for hole version
    result_obj = pipeline.lean_verifier.run_with_header(header_content, hole_content)
    if hasattr(result_obj, 'get_errors'):
        hole_errors = result_obj.get_errors()
        print(f"Hole errors ({len(hole_errors)} total):")
        for i, error in enumerate(hole_errors[:5]):  # Show first 5 errors
            print(f"  {i+1}. {error}")
    print()
    
    print("=== Testing Filled Version ===")
    filled_result = pipeline.verify_lean_code(header_content, filled_content, with_macro=False)
    print(f"Filled verification result: {filled_result}")
    
    # Get detailed error info for filled version
    result_obj = pipeline.lean_verifier.run_with_header(header_content, filled_content)
    if hasattr(result_obj, 'get_errors'):
        filled_errors = result_obj.get_errors()
        print(f"Filled errors ({len(filled_errors)} total):")
        for i, error in enumerate(filled_errors[:5]):  # Show first 5 errors
            print(f"  {i+1}. {error}")
    print()
    
    print("=== Testing Individual Hole Verification ===")
    # Test the new individual hole verification method
    if os.path.exists(hole_path):
        # Test the first few holes
        steps = pipeline.load_decomposition(problem_dir)
        if steps:
            print(f"Testing individual hole verification for first 3 holes...")
            for i, step in enumerate(steps[:3]):
                individual_result = pipeline._verify_single_hole_in_context(
                    header_content, step.step_id, hole_content)
                print(f"  {step.step_id}: {individual_result}")
    
    print()
    print("=== Analysis ===")
    print(f"Expected: hole_result == filled_result (both should be {hole_result})")
    print(f"Actual: hole_result={hole_result}, filled_result={filled_result}")
    
    if hole_result != filled_result:
        print("⚠️  VERIFICATION MISMATCH DETECTED!")
        print("This indicates a bug in the verification logic.")
    else:
        print("✅ Verification results are consistent.")
        print("🔧 Individual hole verification should now match overall verification.")

if __name__ == "__main__":
    test_verification_issue()
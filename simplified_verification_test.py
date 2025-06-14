#!/usr/bin/env python3
"""
Simplified test to demonstrate the verification issue clearly
"""

from decompose_hole_merge_pipeline import DecomposeHoleMergePipeline
import os

def main():
    # Initialize pipeline
    pipeline = DecomposeHoleMergePipeline()
    
    # Read the files for putnam_1964_a1
    test_dir = "/home/matheye/lean-pl-fix/decomposition_results/putnam/decomposed/putnam_1964_a1"
    
    with open(os.path.join(test_dir, "header.lean"), "r") as f:
        header = f.read()
    
    with open(os.path.join(test_dir, "hole_version.lean"), "r") as f:
        hole_version = f.read()
    
    with open(os.path.join(test_dir, "complete_fixed_proof.lean"), "r") as f:
        complete_fixed = f.read()
    
    print("=== Verification Results ===")
    print(f"Hole version passes: {pipeline.verify_lean_code(header, hole_version)}")
    print(f"Complete fixed passes: {pipeline.verify_lean_code(header, complete_fixed)}")
    
    print("\n=== Error Details for Hole Version ===")
    result = pipeline.lean_verifier.run_with_header(header, hole_version)
    if hasattr(result, 'get_errors'):
        errors = result.get_errors()
        print(f"Number of errors: {len(errors)}")
        for i, error in enumerate(errors[:3]):  # Show first 3 errors
            print(f"Error {i+1}: {error.data}")
    
    print("\n=== Error Details for Complete Fixed ===")
    result = pipeline.lean_verifier.run_with_header(header, complete_fixed)
    if hasattr(result, 'get_errors'):
        errors = result.get_errors()
        print(f"Number of errors: {len(errors)}")
        for i, error in enumerate(errors[:3]):  # Show first 3 errors
            print(f"Error {i+1}: {error.data}")
    
    print("\n=== Analysis ===")
    print("Both files fail verification due to type errors in the original source code.")
    print("The individual hole verification results in decomposition.json are misleading")
    print("because they don't test the holes in the complete context of the proof.")

if __name__ == "__main__":
    main()
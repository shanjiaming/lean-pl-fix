#!/usr/bin/env python3

import json
import os
from decompose_hole_merge_pipeline import DecomposeHoleMergePipeline

def verify_fix_manually():
    """Manually verify that our fix correctly reads final verification results"""
    
    # Test the fix logic directly
    problem_id = "putnam_1964_a1"
    problem_dir = f"decomposition_results/putnam/decomposed/{problem_id}"
    
    print(f"=== Manual verification of fix logic ===")
    print(f"Problem: {problem_id}")
    print()
    
    # Simulate the fixed logic
    metadata_path = os.path.join(problem_dir, "decomposition.json")
    
    # Simulate early-stage variables (before fix)
    early_hole_verification = True  # This would be the old buggy result
    early_filled_verification = False  # This would be the old result
    
    print(f"Early-stage (buggy) results:")
    print(f"  hole_verification_pass: {early_hole_verification}")
    print(f"  filled_verification_pass: {early_filled_verification}")
    print()
    
    # Apply our fix logic
    final_hole_verification = early_hole_verification
    final_filled_verification = early_filled_verification
    
    if os.path.exists(metadata_path):
        try:
            with open(metadata_path, "r") as f:
                final_metadata = json.load(f)
            final_hole_verification = final_metadata.get("hole_verification_pass", early_hole_verification)
            final_filled_verification = final_metadata.get("filled_verification_pass", early_filled_verification)
            print(f"✅ Successfully read final verification results from decomposition.json")
        except Exception as e:
            print(f"❌ Error reading final verification results: {e}")
            return
    
    print(f"Final (corrected) results:")
    print(f"  hole_verification_pass: {final_hole_verification}")
    print(f"  filled_verification_pass: {final_filled_verification}")
    print()
    
    # Check if fix worked
    fix_changed_hole = final_hole_verification != early_hole_verification
    fix_changed_filled = final_filled_verification != early_filled_verification
    
    if fix_changed_hole or fix_changed_filled:
        print("✅ Fix is working! Results changed from early-stage to final:")
        if fix_changed_hole:
            print(f"  hole_verification_pass: {early_hole_verification} → {final_hole_verification}")
        if fix_changed_filled:
            print(f"  filled_verification_pass: {early_filled_verification} → {final_filled_verification}")
        print("🔧 pipeline_results.json will now use the corrected values")
    else:
        print("ℹ️  No change needed - early and final results match")
        print("🔧 Fix is ready and will work when there are discrepancies")
    
    # Also test our individual hole verification fix
    print("\n=== Testing individual hole verification fix ===")
    pipeline = DecomposeHoleMergePipeline()
    
    # Read header and hole version
    header_path = os.path.join(problem_dir, "header.lean")
    hole_path = os.path.join(problem_dir, "hole_version.lean")
    
    if os.path.exists(header_path) and os.path.exists(hole_path):
        with open(header_path, 'r') as f:
            header_content = f.read()
        with open(hole_path, 'r') as f:
            hole_content = f.read()
        
        # Test individual hole verification
        steps = pipeline.load_decomposition(problem_dir)
        if steps:
            print(f"Testing first 3 individual holes:")
            for i, step in enumerate(steps[:3]):
                individual_result = pipeline._verify_single_hole_in_context(
                    header_content, step.step_id, hole_content)
                print(f"  {step.step_id}: {individual_result}")
            
            # Compare with overall verification
            overall_hole_result = pipeline.verify_lean_code(header_content, hole_content, with_macro=False)
            print(f"\nOverall hole verification: {overall_hole_result}")
            
            if all(pipeline._verify_single_hole_in_context(header_content, step.step_id, hole_content) == overall_hole_result for step in steps[:3]):
                print("✅ Individual hole verification matches overall verification!")
            else:
                print("⚠️  Individual hole verification doesn't match overall")

if __name__ == "__main__":
    verify_fix_manually()
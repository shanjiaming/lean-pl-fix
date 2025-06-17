#!/usr/bin/env python3
"""
Test script for the new clear version hole generation functionality.
"""

from decompose_hole_merge_pipeline import DecomposeHoleMergePipeline
from unified_problem_manager import problem_manager

def test_clear_version():
    """Test the clear version generation with demo problem"""
    
    # Initialize pipeline
    pipeline = DecomposeHoleMergePipeline()
    
    # Get demo problem
    problem = problem_manager.get_problem('demo', 'demo_complex_p1')
    
    if not problem:
        print("Error: Could not find demo problem 'demo_complex_p1'")
        return
    
    print("=== Testing Clear Version Generation ===")
    print(f"Problem: {problem.dataset}/{problem.problem_id}")
    
    try:
        # Run the test
        result = pipeline.test_clear_version_generation(problem)
        
        print("\n=== Test Results ===")
        verification = result["verification"]
        print(f"Original verification: {'✓' if verification['original'] else '✗'}")
        print(f"Hole version verification: {'✓' if verification['hole'] else '✗'}")
        print(f"Clear version verification: {'✓' if verification['clear'] else '✗'}")
        
        # Save results for inspection  
        with open("/home/matheye/lean-pl-fix/clear_version_test_output.txt", "w") as f:
            f.write("=== ORIGINAL CONTENT ===\n")
            f.write(result["original_content"])
            f.write("\n\n=== HOLE VERSION (RAW) ===\n")
            f.write(result["hole_content"])
            f.write("\n\n=== CLEAR VERSION (RAW) ===\n")
            f.write(result["clear_content"])
            
            # Add the complete versions with macros that are actually used for verification
            hole_list = result["hole_list"]
            hole_macros = []
            for info in hole_list:
                hole_id = info['hole_id']
                hole_macros.append(f'macro "{hole_id}" : tactic => `(tactic| admit)')
            
            if hole_macros:
                f.write("\n\n=== HOLE VERSION (WITH MACROS) ===\n")
                macros_str = '\n'.join(hole_macros)
                hole_with_macros = f"""{macros_str}

{result["hole_content"]}"""
                f.write(hole_with_macros)
                
                f.write("\n\n=== CLEAR VERSION (WITH MACROS) ===\n")
                clear_macros = hole_macros.copy()
                clear_macros.append('macro "skip_hole" : term => `(sorry)')
                clear_macros_str = '\n'.join(clear_macros)
                clear_with_macros = f"""{clear_macros_str}

{result["clear_content"]}"""
                f.write(clear_with_macros)
            
            f.write(f"\n\n=== HOLE LIST ===\n")
            for hole in hole_list:
                f.write(f"{hole}\n")
            f.write(f"\n\n=== VERIFICATION RESULTS ===\n")
            f.write(f"Original: {'PASS' if verification['original'] else 'FAIL'}\n")
            f.write(f"Hole: {'PASS' if verification['hole'] else 'FAIL'}\n")
            f.write(f"Clear: {'PASS' if verification['clear'] else 'FAIL'}\n")
        
        print("Detailed results saved to: clear_version_test_output.txt")
        
        # Determine overall success
        if verification['clear']:
            print("\n🎉 SUCCESS: Clear version generation and verification passed!")
            return True
        else:
            print("\n❌ FAILURE: Clear version failed verification")
            return False
            
    except Exception as e:
        print(f"\n❌ ERROR during testing: {e}")
        import traceback
        traceback.print_exc()
        return False

if __name__ == "__main__":
    success = test_clear_version()
    exit(0 if success else 1)
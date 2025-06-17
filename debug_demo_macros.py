#!/usr/bin/env python3
"""Debug what the demo function generates vs what's in the clear_version file"""

from unified_problem_manager import problem_manager
from decompose_hole_merge_pipeline import DecomposeHoleMergePipeline

def debug_demo_generation():
    # Get demo problem
    problem = problem_manager.get_problem('demo', 'demo_complex_p1')
    
    # Generate clear version exactly like demo does
    pipeline = DecomposeHoleMergePipeline()
    hole_content, hole_list = pipeline.generate_in_place_holes(problem)
    
    # Add macros
    hole_macros = []
    for hole_info in hole_list:
        hole_id = hole_info['hole_id']
        hole_macros.append(f'macro "{hole_id}" : tactic => `(tactic| sorry)')  # NOTE: sorry, not admit
    
    hole_macros.append('macro "skip_hole" : term => `(sorry)')
    
    # Generate clear version
    clear_content = pipeline.generate_clear_version(hole_content, hole_list)
    clear_with_macros = '\n'.join(hole_macros) + '\n\n' + clear_content
    
    print("=== Demo Generated Macros ===")
    for macro in hole_macros:
        print(macro)
    
    print("\n=== Clear Version File Macros ===")
    with open("decomposition_results/demo/decomposed/demo_complex_p1/clear_version.lean", 'r') as f:
        file_content = f.read()
    
    file_lines = file_content.split('\n')
    for i, line in enumerate(file_lines[:10]):  # First 10 lines
        if 'macro' in line:
            print(line)
    
    print("\n=== Difference Found ===")
    print("Demo generates: macro \"hole_X\" : tactic => `(tactic| sorry)")
    print("File contains:  macro \"hole_X\" : tactic => `(tactic| admit)")
    print("\nThis explains why MinimalLeanProofStepIntegrator finds 0 sorries in the file!")

if __name__ == "__main__":
    debug_demo_generation()
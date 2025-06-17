#!/usr/bin/env python3
"""Debug content difference between session analyzer and file"""

import os
from unified_problem_manager import problem_manager
from proofstep_integration import ProofStepIntegrator

def debug_content_difference():
    # Get demo problem
    problem = problem_manager.get_problem('demo', 'demo_complex_p1')
    header_content = problem_manager.get_header_content(problem)
    
    # Read clear version file
    clear_version_path = "decomposition_results/demo/decomposed/demo_complex_p1/clear_version.lean"
    with open(clear_version_path, 'r') as f:
        file_content = f.read()
    
    print("=== Clear Version File Content ===")
    print("Length:", len(file_content))
    print("Content:")
    for i, line in enumerate(file_content.split('\n'), 1):
        print(f"  {i:2}: {line}")
    
    print("\n=== Session Analyzer Generated Content ===")
    session_analyzer = ProofStepIntegrator(header_content)
    session = session_analyzer.initialize_session(file_content)
    
    # But what does the session analyzer expect vs what it gets?
    # The session analyzer analyzes the file content, but maybe minimal_verification_pipeline
    # is supposed to pass something different?
    
    # Let me check what content would be passed if we used the workflow like demo function
    from decompose_hole_merge_pipeline import DecomposeHoleMergePipeline
    pipeline = DecomposeHoleMergePipeline()
    hole_content, hole_list = pipeline.generate_in_place_holes(problem)
    
    # Add macros like demo does
    hole_macros = []
    for hole_info in hole_list:
        hole_id = hole_info['hole_id']
        hole_macros.append(f'macro "{hole_id}" : tactic => `(tactic| admit)')  # Use admit like current system
    
    hole_macros.append('macro "skip_hole" : term => `(sorry)')
    
    # Generate clear version like demo does
    clear_content = pipeline.generate_clear_version(hole_content, hole_list)
    generated_clear_with_macros = '\n'.join(hole_macros) + '\n\n' + clear_content
    
    print("Generated content length:", len(generated_clear_with_macros))
    print("Generated content:")
    for i, line in enumerate(generated_clear_with_macros.split('\n'), 1):
        print(f"  {i:2}: {line}")
    
    print("\n=== Difference Analysis ===")
    file_lines = file_content.split('\n')
    generated_lines = generated_clear_with_macros.split('\n')
    
    print(f"File lines: {len(file_lines)}")
    print(f"Generated lines: {len(generated_lines)}")
    
    # Check for differences
    different_lines = []
    max_lines = max(len(file_lines), len(generated_lines))
    
    for i in range(max_lines):
        file_line = file_lines[i] if i < len(file_lines) else "<MISSING>"
        gen_line = generated_lines[i] if i < len(generated_lines) else "<MISSING>"
        
        if file_line != gen_line:
            different_lines.append((i+1, file_line, gen_line))
    
    if different_lines:
        print("Found differences:")
        for line_num, file_line, gen_line in different_lines[:10]:  # Show first 10 differences
            print(f"  Line {line_num}:")
            print(f"    File:      '{file_line}'")
            print(f"    Generated: '{gen_line}'")
    else:
        print("No differences found!")

if __name__ == "__main__":
    debug_content_difference()
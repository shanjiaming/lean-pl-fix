#!/usr/bin/env python3
"""Add new demo problems with nested have structures to metadata."""

import json
import os

def add_new_demo_problems():
    """Add new demo problems to the unified metadata."""
    
    # Read existing metadata
    with open('data/unified_problems_metadata.json', 'r') as f:
        metadata = json.load(f)
    
    # New problems with nested have structures
    new_problems = [
        {
            'dataset': 'demo',
            'problem_id': 'nested_have',
            'header_path': 'unified_problems/demo/nested_have/header.lean',
            'problem_path': 'unified_problems/demo/nested_have/problem.lean',
            'decomposed_dir': 'unified_problems/demo/nested_have/decomposed',
            'hole_dir': 'unified_problems/demo/nested_have/hole',
            'theorem_name': 'nested_proof',
            'difficulty': 'medium',
            'tags': ['nested_have', 'arithmetic'],
            'description': 'Complex nested have structure for testing decomposition'
        },
        {
            'dataset': 'demo',
            'problem_id': 'complex_have',
            'header_path': 'unified_problems/demo/complex_have/header.lean',
            'problem_path': 'unified_problems/demo/complex_have/problem.lean',
            'decomposed_dir': 'unified_problems/demo/complex_have/decomposed',
            'hole_dir': 'unified_problems/demo/complex_have/hole',
            'theorem_name': 'complex_calculation',
            'difficulty': 'hard',
            'tags': ['nested_have', 'arithmetic', 'sorry'],
            'description': 'Complex have structure with sorry for testing fixing'
        }
    ]
    
    # Create directories
    for prob in new_problems:
        problem_dir = f"unified_problems/demo/{prob['problem_id']}"
        os.makedirs(f"{problem_dir}/decomposed", exist_ok=True)
        os.makedirs(f"{problem_dir}/hole", exist_ok=True)
    
    # Add to metadata
    for prob in new_problems:
        key = f"{prob['dataset']}/{prob['problem_id']}"
        metadata[key] = prob
    
    # Save updated metadata
    with open('data/unified_problems_metadata.json', 'w') as f:
        json.dump(metadata, f, indent=2)
    
    print(f"✅ Added {len(new_problems)} new demo problems")
    print(f"📊 Total problems in metadata: {len(metadata)}")
    
    # List the new problems
    print("\n🆕 New problems added:")
    for prob in new_problems:
        print(f"  - {prob['dataset']}/{prob['problem_id']}: {prob['description']}")

if __name__ == "__main__":
    add_new_demo_problems() 
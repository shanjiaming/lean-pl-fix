#!/usr/bin/env python3
"""
Sorry Indexing Test

Test how different sorry patterns are indexed and handled by Lean.
"""

import tempfile
import os
from typing import Dict
from lean_interact import AutoLeanServer
from decompose_hole_merge_pipeline import DecomposeHoleMergePipeline

class SorryIndexingTest:
    """Test sorry indexing behavior with different patterns"""
    
    def __init__(self):
        self.pipeline = DecomposeHoleMergePipeline()
    
    def create_test_cases(self) -> Dict[str, str]:
        """Create various test cases with different sorry patterns"""
        
        test_cases = {
            "simple_sorries": """
theorem test1 (n : ℕ) : n + 0 = n := by
  sorry
  
theorem test2 (n : ℕ) : 0 + n = n := by
  sorry
""",
            
            "macro_holes": """
macro "hole_1" : tactic => `(tactic| sorry)
macro "hole_2" : tactic => `(tactic| sorry)

theorem test_macro (n : ℕ) : n + 0 = n := by
  hole_1
  
theorem test_macro2 (n : ℕ) : 0 + n = n := by
  hole_2
""",
            
            "mixed_holes_and_skips": """
macro "hole_1" : tactic => `(tactic| sorry)
macro "hole_2" : tactic => `(tactic| sorry)
macro "skip_hole" : term => `(sorry)

theorem test_mixed (n : ℕ) (h : n > 0) : n + n ≥ n := by
  have h1 : n ≥ 1 := by
    hole_1
  clear h1
  have h1 : n ≥ 1 := skip_hole
  have h2 : n + n ≥ n + 1 := by
    hole_2
  sorry
""",
            
            "nested_haves": """
macro "hole_1" : tactic => `(tactic| sorry)
macro "hole_2" : tactic => `(tactic| sorry)
macro "hole_3" : tactic => `(tactic| sorry)
macro "skip_hole" : term => `(sorry)

theorem nested_test (n : ℕ) : n + n = 2 * n := by
  have h1 : n + n = n + n := by
    hole_1
  clear h1
  have h1 : n + n = n + n := skip_hole
  have h2 : n + n = 2 * n := by
    have h3 : 2 * n = n + n := by
      hole_2
    clear h3
    have h3 : 2 * n = n + n := skip_hole
    hole_3
  sorry
""",
            
            "clear_version_pattern": """
macro "hole_2" : tactic => `(tactic| sorry)
macro "hole_4" : tactic => `(tactic| sorry)
macro "hole_3" : tactic => `(tactic| sorry)
macro "hole_5" : tactic => `(tactic| sorry)
macro "hole_1" : tactic => `(tactic| sorry)
macro "skip_hole" : term => `(sorry)

theorem complex_have_chain (n : ℕ) (h : n > 0) : n + n ≥ n := by
  have h1 : n ≥ 1 := by
    hole_2
  clear h1
  have h1 : n ≥ 1 := skip_hole
  have h2 : n + n ≥ n + 1 := by
    have h3 : n ≥ 1 := h1
    have h4 : n + n = n + n := rfl
    have h5 : n + 1 ≤ n + n := by
      hole_4
    clear h5
    have h5 : n + 1 ≤ n + n := skip_hole
    hole_3
  clear h2
  have h2 : n + n ≥ n + 1 := skip_hole
  have h6 : n + 1 ≥ n := by
    hole_5
  clear h6
  have h6 : n + 1 ≥ n := skip_hole
  hole_1
"""
        }
        
        return test_cases
    
    def count_sorries_in_code(self, code: str) -> Dict:
        """Count and analyze sorry occurrences in code"""
        import re
        
        # Count raw 'sorry' occurrences
        sorry_matches = list(re.finditer(r'\bsorry\b', code))
        
        # Count macro usages that expand to sorry
        hole_matches = list(re.finditer(r'\bhole_\d+\b', code))
        skip_matches = list(re.finditer(r'\bskip_hole\b', code))
        
        # Analyze line by line
        lines = code.split('\n')
        sorry_lines = []
        hole_lines = []
        skip_lines = []
        
        for i, line in enumerate(lines, 1):
            if 'sorry' in line and not line.strip().startswith('macro'):
                sorry_lines.append((i, line.strip()))
            if re.search(r'\bhole_\d+\b', line):
                hole_lines.append((i, line.strip()))
            if 'skip_hole' in line and not line.strip().startswith('macro'):
                skip_lines.append((i, line.strip()))
        
        return {
            'raw_sorries': len(sorry_matches),
            'hole_macros': len(hole_matches),
            'skip_macros': len(skip_matches),
            'total_sorries_when_expanded': len(sorry_matches) + len(hole_matches) + len(skip_matches),
            'sorry_lines': sorry_lines,
            'hole_lines': hole_lines,
            'skip_lines': skip_lines
        }
    
    def test_lean_verification(self, code: str, test_name: str) -> Dict:
        """Test if the code verifies with Lean"""
        try:
            result = self.pipeline.verify_lean_code("import Mathlib", code)
            return {
                'test_name': test_name,
                'verifies': result,
                'error': None
            }
        except Exception as e:
            return {
                'test_name': test_name,
                'verifies': False,
                'error': str(e)
            }
    
    def analyze_proofstep_implications(self, sorry_analysis: Dict) -> Dict:
        """Analyze what this means for ProofStep integration"""
        
        total_sorries = sorry_analysis['total_sorries_when_expanded']
        hole_count = sorry_analysis['hole_macros']
        skip_count = sorry_analysis['skip_macros']
        raw_count = sorry_analysis['raw_sorries']
        
        # ProofStep would assign indices 0, 1, 2, ... to all sorries
        # We need to figure out which indices correspond to holes vs skips
        
        proofstep_indices = list(range(total_sorries))
        hole_indices = []
        skip_indices = []
        unknown_indices = []
        
        # This is a simplified analysis - in reality we'd need to parse the AST
        # to get the exact order of sorry expansion
        index = 0
        
        # Approximate mapping based on line order
        all_sorry_items = []
        
        for line_num, line_content in sorry_analysis['sorry_lines']:
            all_sorry_items.append(('raw_sorry', line_num, line_content))
        
        for line_num, line_content in sorry_analysis['hole_lines']:
            all_sorry_items.append(('hole', line_num, line_content))
        
        for line_num, line_content in sorry_analysis['skip_lines']:
            all_sorry_items.append(('skip', line_num, line_content))
        
        # Sort by line number to get approximate order
        all_sorry_items.sort(key=lambda x: x[1])
        
        for sorry_type, line_num, line_content in all_sorry_items:
            if sorry_type == 'hole':
                hole_indices.append(index)
            elif sorry_type == 'skip':
                skip_indices.append(index)
            else:
                unknown_indices.append(index)
            index += 1
        
        return {
            'total_proofstep_indices': total_sorries,
            'hole_indices': hole_indices,
            'skip_indices': skip_indices,
            'unknown_indices': unknown_indices,
            'enumeration_strategy': {
                'enumerate_indices': hole_indices + unknown_indices,
                'skip_indices': skip_indices
            },
            'index_mapping': {
                i: {
                    'type': 'hole' if i in hole_indices else 'skip' if i in skip_indices else 'unknown',
                    'should_enumerate': i not in skip_indices
                }
                for i in range(total_sorries)
            }
        }
    
    def run_all_tests(self):
        """Run all sorry indexing tests"""
        print("🧪 Sorry Indexing Tests")
        print("=" * 60)
        
        test_cases = self.create_test_cases()
        
        for test_name, code in test_cases.items():
            print(f"\n📋 Test Case: {test_name}")
            print("-" * 40)
            
            # Analyze sorry structure
            sorry_analysis = self.count_sorries_in_code(code)
            print(f"Raw sorries: {sorry_analysis['raw_sorries']}")
            print(f"Hole macros: {sorry_analysis['hole_macros']}")
            print(f"Skip macros: {sorry_analysis['skip_macros']}")
            print(f"Total when expanded: {sorry_analysis['total_sorries_when_expanded']}")
            
            # Test Lean verification
            verification = self.test_lean_verification(code, test_name)
            print(f"Lean verification: {'✅ PASS' if verification['verifies'] else '❌ FAIL'}")
            if verification['error']:
                print(f"Error: {verification['error']}")
            
            # Analyze ProofStep implications
            proofstep_analysis = self.analyze_proofstep_implications(sorry_analysis)
            print(f"ProofStep would see {proofstep_analysis['total_proofstep_indices']} sorries")
            print(f"Should enumerate indices: {proofstep_analysis['enumeration_strategy']['enumerate_indices']}")
            print(f"Should skip indices: {proofstep_analysis['enumeration_strategy']['skip_indices']}")
            
            # Show detailed mapping
            print("Index mapping:")
            for idx, mapping in proofstep_analysis['index_mapping'].items():
                should_enum = "ENUM" if mapping['should_enumerate'] else "SKIP"
                print(f"  Index {idx}: {mapping['type']} -> {should_enum}")
        
        print("\n" + "=" * 60)
        print("✅ All tests completed!")
        
        return test_cases

def main():
    """Main function"""
    tester = SorryIndexingTest()
    test_cases = tester.run_all_tests()
    
    # Save one of the test cases for manual inspection
    if 'clear_version_pattern' in test_cases:
        with open('/home/matheye/lean-pl-fix/sorry_test_pattern.lean', 'w') as f:
            f.write(test_cases['clear_version_pattern'])
        print(f"\nSaved test pattern to: sorry_test_pattern.lean")

if __name__ == "__main__":
    main()
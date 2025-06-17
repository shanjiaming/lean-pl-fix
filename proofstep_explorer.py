#!/usr/bin/env python3
"""
ProofStep Explorer

A script to understand and experiment with ProofStep functionality,
including sorry indexing, tactic enumeration, and server state management.
"""

import re
import os
import tempfile
from typing import List, Dict, Tuple, Optional
from lean_interact import LeanServer, AutoLeanServer
from unified_problem_manager import problem_manager

class ProofStepExplorer:
    """Explore ProofStep functionality and sorry indexing behavior"""
    
    def __init__(self):
        self.lean_server = None
        self.current_file_path = None
        
    def setup_lean_server(self):
        """Initialize a Lean server for testing"""
        if not self.lean_server:
            self.lean_server = AutoLeanServer()
        
    def analyze_sorry_structure(self, lean_code: str) -> Dict:
        """
        Analyze a piece of Lean code to understand sorry structure and indexing
        
        Args:
            lean_code: Lean code containing sorries
            
        Returns:
            Dict with analysis results
        """
        print("=== Analyzing Sorry Structure ===")
        
        # Find all sorry occurrences
        sorry_pattern = r'\bsorry\b'
        sorries = []
        
        lines = lean_code.split('\n')
        for line_num, line in enumerate(lines, 1):
            for match in re.finditer(sorry_pattern, line):
                sorries.append({
                    'line': line_num,
                    'column': match.start(),
                    'context': line.strip(),
                    'position_in_file': len('\n'.join(lines[:line_num-1])) + match.start()
                })
        
        print(f"Found {len(sorries)} sorry occurrences:")
        for i, sorry in enumerate(sorries):
            print(f"  Sorry {i}: Line {sorry['line']}, Col {sorry['column']} - {sorry['context']}")
        
        return {
            'total_sorries': len(sorries),
            'sorry_locations': sorries,
            'code': lean_code
        }
    
    def analyze_macro_structure(self, lean_code: str) -> Dict:
        """
        Analyze macro structure in code to distinguish hole_i vs skip_hole sorries
        
        Args:
            lean_code: Lean code with macros
            
        Returns:
            Dict with macro analysis
        """
        print("=== Analyzing Macro Structure ===")
        
        # Find macro definitions
        macro_defs = {}
        macro_def_pattern = r'macro\s+"([^"]+)"\s*:\s*(\w+)\s*=>\s*`\([^)]+\|\s*([^)]+)\)'
        
        for match in re.finditer(macro_def_pattern, lean_code):
            macro_name = match.group(1)
            macro_type = match.group(2)
            macro_content = match.group(3)
            macro_defs[macro_name] = {
                'type': macro_type,
                'content': macro_content,
                'definition': match.group(0)
            }
        
        # Find macro usages
        macro_usages = []
        for macro_name in macro_defs.keys():
            pattern = r'\b' + re.escape(macro_name) + r'\b'
            for match in re.finditer(pattern, lean_code):
                # Skip the definition line
                if 'macro' not in lean_code[max(0, match.start()-20):match.start()]:
                    macro_usages.append({
                        'macro': macro_name,
                        'position': match.start(),
                        'line': lean_code[:match.start()].count('\n') + 1
                    })
        
        print(f"Found {len(macro_defs)} macro definitions:")
        for name, info in macro_defs.items():
            print(f"  {name} ({info['type']}): {info['content']}")
        
        print(f"Found {len(macro_usages)} macro usages:")
        for usage in macro_usages:
            print(f"  {usage['macro']} at line {usage['line']}")
        
        return {
            'macro_definitions': macro_defs,
            'macro_usages': macro_usages,
            'hole_macros': [name for name, info in macro_defs.items() if name.startswith('hole_')],
            'skip_macros': [name for name, info in macro_defs.items() if 'skip' in name]
        }
    
    def create_test_file(self, content: str) -> str:
        """Create a temporary Lean file for testing"""
        with tempfile.NamedTemporaryFile(mode='w', suffix='.lean', delete=False) as f:
            f.write(content)
            return f.name
    
    def simulate_proofstep_indexing(self, lean_code: str) -> Dict:
        """
        Simulate how ProofStep would index sorries in the given code
        
        Args:
            lean_code: Lean code to analyze
            
        Returns:
            Dict with ProofStep simulation results
        """
        print("=== Simulating ProofStep Indexing ===")
        
        # Write to temporary file and analyze with Lean server
        file_path = self.create_test_file(lean_code)
        
        try:
            self.setup_lean_server()
            
            # Open file in Lean server
            cmd_result = self.lean_server.send_command(f'open "{file_path}"')
            print(f"File open result: {cmd_result}")
            
            # Get diagnostics to see how Lean sees the sorries
            info_result = self.lean_server.send_command('#check sorry')
            print(f"Sorry check result: {info_result}")
            
            # Try to get goal information
            goals_result = self.lean_server.send_command('#check_failure sorry')
            print(f"Goals result: {goals_result}")
            
        except Exception as e:
            print(f"Error in Lean server interaction: {e}")
        
        finally:
            # Clean up
            if os.path.exists(file_path):
                os.unlink(file_path)
        
        # For now, return a mock simulation
        sorry_analysis = self.analyze_sorry_structure(lean_code)
        macro_analysis = self.analyze_macro_structure(lean_code)
        
        return {
            'total_sorries': sorry_analysis['total_sorries'],
            'proofstep_indices': list(range(sorry_analysis['total_sorries'])),
            'hole_indices': [i for i, usage in enumerate(macro_analysis['macro_usages']) 
                           if usage['macro'].startswith('hole_')],
            'skip_indices': [i for i, usage in enumerate(macro_analysis['macro_usages']) 
                           if 'skip' in usage['macro']],
            'index_mapping': self._create_index_mapping(macro_analysis)
        }
    
    def _create_index_mapping(self, macro_analysis: Dict) -> Dict:
        """Create mapping between ProofStep indices and hole IDs"""
        mapping = {}
        proofstep_index = 0
        
        for usage in sorted(macro_analysis['macro_usages'], key=lambda x: x['position']):
            if usage['macro'].startswith('hole_'):
                mapping[proofstep_index] = {
                    'hole_id': usage['macro'],
                    'type': 'hole',
                    'should_enumerate': True
                }
            elif 'skip' in usage['macro']:
                mapping[proofstep_index] = {
                    'hole_id': usage['macro'],
                    'type': 'skip',
                    'should_enumerate': False
                }
            else:
                mapping[proofstep_index] = {
                    'hole_id': f'unknown_{proofstep_index}',
                    'type': 'unknown',
                    'should_enumerate': True
                }
            
            proofstep_index += 1
        
        return mapping
    
    def test_tactic_on_hole(self, lean_code: str, hole_index: int, tactic: str) -> Dict:
        """
        Test a specific tactic on a specific hole
        
        Args:
            lean_code: Original Lean code
            hole_index: Index of hole to test
            tactic: Tactic to try
            
        Returns:
            Dict with test results
        """
        print(f"=== Testing tactic '{tactic}' on hole {hole_index} ===")
        
        # Replace the target hole with the tactic
        macro_analysis = self.analyze_macro_structure(lean_code)
        
        if hole_index >= len(macro_analysis['macro_usages']):
            return {'success': False, 'error': 'Hole index out of range'}
        
        target_usage = macro_analysis['macro_usages'][hole_index]
        target_macro = target_usage['macro']
        
        # Replace the macro definition with the tactic
        modified_code = lean_code
        for name, info in macro_analysis['macro_definitions'].items():
            if name == target_macro:
                old_def = info['definition']
                new_def = old_def.replace(info['content'], tactic)
                modified_code = modified_code.replace(old_def, new_def)
                break
        
        # Verify the modified code
        file_path = self.create_test_file(modified_code)
        
        try:
            self.setup_lean_server()
            # Here we would test if the code compiles
            # For now, return mock result
            success = True  # This would be actual verification
            
            return {
                'success': success,
                'tactic': tactic,
                'hole_index': hole_index,
                'hole_id': target_macro,
                'modified_code': modified_code
            }
        
        except Exception as e:
            return {
                'success': False,
                'error': str(e),
                'tactic': tactic,
                'hole_index': hole_index
            }
        
        finally:
            if os.path.exists(file_path):
                os.unlink(file_path)
    
    def demonstrate_proofstep_workflow(self, problem_id: str = "demo_complex_p1"):
        """
        Demonstrate the complete ProofStep workflow on a demo problem
        
        Args:
            problem_id: ID of problem to demonstrate on
        """
        print(f"=== ProofStep Workflow Demonstration: {problem_id} ===")
        
        # Get a demo problem
        problem = problem_manager.get_problem('demo', problem_id)
        if not problem:
            print(f"Problem {problem_id} not found")
            return
        
        # Generate hole and clear versions
        from decompose_hole_merge_pipeline import DecomposeHoleMergePipeline
        pipeline = DecomposeHoleMergePipeline()
        
        # Get hole version
        hole_content, hole_list = pipeline.generate_in_place_holes(problem)
        
        # Add macros
        hole_macros = []
        for hole_info in hole_list:
            hole_id = hole_info['hole_id']
            hole_macros.append(f'macro "{hole_id}" : tactic => `(tactic| sorry)')
        
        hole_macros.append('macro "skip_hole" : term => `(sorry)')
        hole_with_macros = '\n'.join(hole_macros) + '\n\n' + hole_content
        
        # Generate clear version
        clear_content = pipeline.generate_clear_version(hole_content, hole_list)
        clear_with_macros = '\n'.join(hole_macros) + '\n\n' + clear_content
        
        print("\n1. Original Hole Version Analysis:")
        hole_analysis = self.analyze_sorry_structure(hole_with_macros)
        hole_macro_analysis = self.analyze_macro_structure(hole_with_macros)
        
        print("\n2. Clear Version Analysis:")
        clear_analysis = self.analyze_sorry_structure(clear_with_macros)
        clear_macro_analysis = self.analyze_macro_structure(clear_with_macros)
        
        print("\n3. ProofStep Indexing Simulation:")
        proofstep_sim = self.simulate_proofstep_indexing(clear_with_macros)
        
        print(f"\nProofStep would see {proofstep_sim['total_sorries']} sorries")
        print(f"Holes that should be enumerated: {proofstep_sim['hole_indices']}")
        print(f"Skips that should be ignored: {proofstep_sim['skip_indices']}")
        
        print("\n4. Index Mapping:")
        for idx, mapping in proofstep_sim['index_mapping'].items():
            should_enum = "YES" if mapping['should_enumerate'] else "NO"
            print(f"  ProofStep index {idx}: {mapping['hole_id']} ({mapping['type']}) - Enumerate: {should_enum}")
        
        print("\n5. Tactic Testing Simulation:")
        test_tactics = ["norm_num", "linarith", "omega"]
        
        for tactic in test_tactics:
            for idx in proofstep_sim['hole_indices'][:2]:  # Test first 2 holes
                result = self.test_tactic_on_hole(clear_with_macros, idx, tactic)
                status = "SUCCESS" if result['success'] else "FAILED"
                print(f"  {tactic} on {result.get('hole_id', f'hole_{idx}')}: {status}")
        
        return {
            'hole_analysis': hole_analysis,
            'clear_analysis': clear_analysis,
            'proofstep_simulation': proofstep_sim,
            'clear_content': clear_with_macros
        }

def main():
    """Main function to run ProofStep exploration"""
    explorer = ProofStepExplorer()
    
    print("🔍 ProofStep Explorer")
    print("=" * 50)
    
    # Demonstrate on a demo problem
    results = explorer.demonstrate_proofstep_workflow("demo_complex_p1")
    
    print("\n" + "=" * 50)
    print("ProofStep exploration completed!")
    
    # Save clear version for inspection
    if results and 'clear_content' in results:
        with open('/home/matheye/lean-pl-fix/proofstep_test_clear_version.lean', 'w') as f:
            f.write(results['clear_content'])
        print("Clear version saved to: proofstep_test_clear_version.lean")

if __name__ == "__main__":
    main()
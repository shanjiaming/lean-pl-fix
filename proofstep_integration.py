#!/usr/bin/env python3
"""
ProofStep Integration System

Core system for integrating with ProofStep for selective tactic enumeration.
Handles sorry indexing, hole vs skip identification, and server state management.
"""

import re
import tempfile
import os
from typing import Dict, List, Tuple, Optional, Set
from dataclasses import dataclass
from lean_interact import LeanREPLConfig, LeanServer
from decompose_hole_merge_pipeline import DecomposeHoleMergePipeline

@dataclass
class SorryInfo:
    """Information about a sorry in the code"""
    index: int  # ProofStep's sequential index
    line: int
    column: int
    macro_type: str  # 'hole_i', 'skip_hole', or 'raw'
    hole_id: Optional[str]  # e.g., 'hole_2'
    should_enumerate: bool
    context: str  # surrounding code context

@dataclass
class ProofStepSession:
    """Represents a ProofStep session state"""
    lean_code: str
    sorry_map: Dict[int, SorryInfo]  # index -> SorryInfo
    enumerable_indices: List[int]
    skip_indices: List[int]
    current_index: int = 0

class ProofStepIntegrator:
    """Main class for ProofStep integration"""
    
    def __init__(self, header_content: str):
        self.pipeline = DecomposeHoleMergePipeline()
        self.lean_server = None
        self.current_session: Optional[ProofStepSession] = None
        self.header_content = header_content
    
    def setup_lean_server(self):
        """Initialize Lean server with proper configuration"""
        if not self.lean_server:
            try:
                config = LeanREPLConfig()
                self.lean_server = LeanServer(config)
            except Exception as e:
                print(f"Warning: Could not initialize LeanServer: {e}")
                self.lean_server = None
    
    def parse_macro_structure(self, lean_code: str) -> Dict[str, Dict]:
        """
        Parse the macro structure to understand hole_i vs skip_hole mapping
        
        Args:
            lean_code: Lean code with macros
            
        Returns:
            Dict with macro definitions and usage information
        """
        # Find macro definitions
        macro_defs = {}
        # Pattern for tactic macros: macro "name" : tactic => `(tactic| content)
        tactic_pattern = r'macro\s+"([^"]+)"\s*:\s*tactic\s*=>\s*`\(tactic\|\s*([^)]+)\)'
        # Pattern for term macros: macro "name" : term => `(content)
        term_pattern = r'macro\s+"([^"]+)"\s*:\s*term\s*=>\s*`\(([^)]+)\)'
        
        # Find tactic macros
        for match in re.finditer(tactic_pattern, lean_code):
            macro_name = match.group(1)
            macro_content = match.group(2)
            macro_defs[macro_name] = {
                'type': 'tactic',
                'content': macro_content,
                'expands_to_sorry': 'sorry' in macro_content or 'admit' in macro_content
            }
        
        # Find term macros
        for match in re.finditer(term_pattern, lean_code):
            macro_name = match.group(1)
            macro_content = match.group(2)
            macro_defs[macro_name] = {
                'type': 'term',
                'content': macro_content,
                'expands_to_sorry': 'sorry' in macro_content or 'admit' in macro_content
            }
        
        # Find macro usages with precise positions
        macro_usages = []
        lines = lean_code.split('\n')
        
        for line_num, line in enumerate(lines, 1):
            for macro_name in macro_defs.keys():
                # Look for standalone macro usage (not in definition)
                if macro_name in line and 'macro' not in line:
                    # Find exact position using regex for word boundaries
                    pattern = r'\b' + re.escape(macro_name) + r'\b'
                    for match in re.finditer(pattern, line):
                        macro_usages.append({
                            'macro': macro_name,
                            'line': line_num,
                            'column': match.start(),
                            'position': sum(len(l) + 1 for l in lines[:line_num-1]) + match.start(),
                            'context': line.strip()
                        })
        
        # Sort usages by position to get correct order
        macro_usages.sort(key=lambda x: x['position'])
        
        return {
            'definitions': macro_defs,
            'usages': macro_usages
        }
    
    def create_sorry_map(self, lean_code: str) -> Dict[int, SorryInfo]:
        """
        Create a mapping from ProofStep indices to sorry information
        
        Args:
            lean_code: Lean code with macros
            
        Returns:
            Dict mapping ProofStep index to SorryInfo
        """
        macro_structure = self.parse_macro_structure(lean_code)
        sorry_map = {}
        index = 0
        
        # Process macro usages in order
        for usage in macro_structure['usages']:
            macro_name = usage['macro']
            macro_def = macro_structure['definitions'].get(macro_name, {})
            
            if macro_def.get('expands_to_sorry', False):
                # Determine macro type
                if macro_name.startswith('hole_'):
                    macro_type = 'hole_i'
                    should_enumerate = True
                    hole_id = macro_name
                elif 'skip' in macro_name.lower():
                    macro_type = 'skip_hole'
                    should_enumerate = False
                    hole_id = macro_name
                else:
                    macro_type = 'unknown'
                    should_enumerate = True
                    hole_id = None
                
                sorry_map[index] = SorryInfo(
                    index=index,
                    line=usage['line'],
                    column=usage['column'],
                    macro_type=macro_type,
                    hole_id=hole_id,
                    should_enumerate=should_enumerate,
                    context=usage['context']
                )
                
                index += 1
        
        # Also find raw sorry occurrences
        lines = lean_code.split('\n')
        for line_num, line in enumerate(lines, 1):
            # Skip macro definition lines
            if 'macro' in line and 'sorry' in line:
                continue
            
            # Find raw sorry occurrences
            for match in re.finditer(r'\bsorry\b', line):
                # Check if this sorry is not from a macro we already processed
                sorry_pos = sum(len(l) + 1 for l in lines[:line_num-1]) + match.start()
                
                # Check if this position is covered by any macro usage
                covered = False
                for usage in macro_structure['usages']:
                    if abs(sorry_pos - usage['position']) < 20:  # Within reasonable range
                        covered = True
                        break
                
                if not covered:
                    sorry_map[index] = SorryInfo(
                        index=index,
                        line=line_num,
                        column=match.start(),
                        macro_type='raw',
                        hole_id=None,
                        should_enumerate=True,
                        context=line.strip()
                    )
                    index += 1
        
        return sorry_map
    
    def initialize_session(self, header_content: str, lean_code: str) -> ProofStepSession:
        """
        Initialize a ProofStep session for the given Lean code
        
        Args:
            header_content: The header part of the file (e.g., imports)
            lean_code: Lean code with hole and skip macros
            
        Returns:
            ProofStepSession object
        """
        full_code = f"{header_content}\n\n{lean_code}"
        sorry_map = self.create_sorry_map(full_code)
        
        # We need to adjust the line numbers in sorry_map to be relative to lean_code,
        # but the parsing was done on full_code.
        # Let's find the line offset.
        header_lines = len(header_content.split('\n')) + 1 # +1 for the extra newline

        # Re-create the sorry_map with adjusted line numbers for local usage if needed,
        # but the primary creation is for position matching against the server.
        # For now, the sorry_map from full_code is what we need for matching.
        
        enumerable_indices = [idx for idx, info in sorry_map.items() if info.should_enumerate]
        skip_indices = [idx for idx, info in sorry_map.items() if not info.should_enumerate]
        
        session = ProofStepSession(
            lean_code=lean_code, # Store original lean_code without header
            sorry_map=sorry_map,
            enumerable_indices=enumerable_indices,
            skip_indices=skip_indices,
            current_index=0
        )
        
        self.current_session = session
        return session
    
    def get_next_enumerable_index(self) -> Optional[int]:
        """
        Get the next sorry index that should be enumerated
        
        Returns:
            Next enumerable index, or None if no more
        """
        if not self.current_session:
            return None
        
        while self.current_session.current_index < len(self.current_session.sorry_map):
            index = self.current_session.current_index
            if index in self.current_session.enumerable_indices:
                return index
            self.current_session.current_index += 1
        
        return None
    
    def advance_to_next_hole(self):
        """Advance to the next hole for enumeration"""
        if self.current_session:
            self.current_session.current_index += 1
    
    def test_tactic_on_current_hole(self, tactic: str) -> Dict:
        """
        Test a tactic on the current hole
        
        Args:
            tactic: Tactic to test
            
        Returns:
            Dict with test results
        """
        if not self.current_session:
            return {'success': False, 'error': 'No active session'}
        
        current_index = self.get_next_enumerable_index()
        if current_index is None:
            return {'success': False, 'error': 'No more holes to enumerate'}
        
        return self.test_tactic_on_hole(current_index, tactic)
    
    def test_tactic_on_hole(self, hole_index: int, tactic: str) -> Dict:
        """
        Test a specific tactic on a specific hole
        
        Args:
            hole_index: ProofStep index of the hole
            tactic: Tactic to test
            
        Returns:
            Dict with test results
        """
        if not self.current_session:
            return {'success': False, 'error': 'No active session'}
        
        if hole_index not in self.current_session.sorry_map:
            return {'success': False, 'error': f'Invalid hole index: {hole_index}'}
        
        sorry_info = self.current_session.sorry_map[hole_index]
        
        if not sorry_info.should_enumerate:
            return {'success': False, 'error': f'Hole {hole_index} should be skipped'}
        
        # Create modified code with the tactic
        modified_code = self._replace_hole_with_tactic(
            self.current_session.lean_code, 
            sorry_info, 
            tactic
        )
        
        # Test verification
        success = self._verify_code(modified_code)
        
        return {
            'success': success,
            'hole_index': hole_index,
            'hole_id': sorry_info.hole_id,
            'tactic': tactic,
            'modified_code': modified_code if success else None,
            'error': None if success else 'Verification failed'
        }
    
    def _replace_hole_with_tactic(self, lean_code: str, sorry_info: SorryInfo, tactic: str) -> str:
        """Replace a specific hole with a tactic"""
        if sorry_info.hole_id:
            # Replace macro definition
            macro_pattern = f'macro "{re.escape(sorry_info.hole_id)}" : tactic => `\\(tactic\\| ([^)]+)\\)'
            replacement = f'macro "{sorry_info.hole_id}" : tactic => `(tactic| {tactic})'
            return re.sub(macro_pattern, replacement, lean_code)
        else:
            # Replace raw sorry (more complex, need precise position)
            lines = lean_code.split('\n')
            line = lines[sorry_info.line - 1]
            
            # Find the sorry at the specific column
            before = line[:sorry_info.column]
            after = line[sorry_info.column + 5:]  # 5 = len('sorry')
            modified_line = before + tactic + after
            
            lines[sorry_info.line - 1] = modified_line
            return '\n'.join(lines)
    
    def _verify_code(self, lean_code: str) -> bool:
        """Verify Lean code with proper header"""
        try:
            return self.pipeline.verify_lean_code(self.header_content, lean_code)
        except Exception:
            return False
    
    def enumerate_tactics_for_session(self, tactics: List[str]) -> Dict:
        """
        Run complete tactic enumeration for the current session
        
        Args:
            tactics: List of tactics to try
            
        Returns:
            Dict with enumeration results
        """
        if not self.current_session:
            return {'error': 'No active session'}
        
        results = {
            'session_info': {
                'total_sorries': len(self.current_session.sorry_map),
                'enumerable_holes': len(self.current_session.enumerable_indices),
                'skip_holes': len(self.current_session.skip_indices)
            },
            'hole_results': {},
            'successful_tactics': {},
            'failed_attempts': 0,
            'successful_attempts': 0
        }
        
        # Reset session position
        self.current_session.current_index = 0
        
        # Enumerate all holes
        while True:
            hole_index = self.get_next_enumerable_index()
            if hole_index is None:
                break
            
            sorry_info = self.current_session.sorry_map[hole_index]
            hole_results = {
                'hole_info': sorry_info,
                'tactic_results': {},
                'successful_tactic': None
            }
            
            # Try each tactic on this hole
            for tactic in tactics:
                result = self.test_tactic_on_hole(hole_index, tactic)
                hole_results['tactic_results'][tactic] = result
                
                if result['success']:
                    hole_results['successful_tactic'] = tactic
                    results['successful_tactics'][hole_index] = tactic
                    results['successful_attempts'] += 1
                    break  # Stop at first successful tactic
                else:
                    results['failed_attempts'] += 1
            
            results['hole_results'][hole_index] = hole_results
            self.advance_to_next_hole()
        
        return results

def demo_proofstep_integration():
    """Demonstrate ProofStep integration with a demo problem"""
    print("🚀 ProofStep Integration Demo")
    print("=" * 50)
    
    # Get demo problem
    from unified_problem_manager import problem_manager
    problem = problem_manager.get_problem('demo', 'demo_complex_p1')
    
    if not problem:
        print("Demo problem not found")
        return
    
    # Generate clear version
    pipeline = DecomposeHoleMergePipeline()
    hole_content, hole_list = pipeline.generate_in_place_holes(problem)
    
    # Add macros
    hole_macros = []
    for hole_info in hole_list:
        hole_id = hole_info['hole_id']
        hole_macros.append(f'macro "{hole_id}" : tactic => `(tactic| sorry)')
    
    hole_macros.append('macro "skip_hole" : term => `(sorry)')
    
    # Generate clear version
    clear_content = pipeline.generate_clear_version(hole_content, hole_list)
    clear_with_macros = '\n'.join(hole_macros) + '\n\n' + clear_content
    
    print("Generated clear version with macros")
    
    # Get header content for the problem
    header_content = problem_manager.get_header_content(problem)
    
    # Initialize ProofStep integration
    integrator = ProofStepIntegrator(header_content)
    session = integrator.initialize_session(header_content, clear_with_macros)
    
    print(f"\n📊 Session Analysis:")
    print(f"Total sorries: {len(session.sorry_map)}")
    print(f"Enumerable holes: {len(session.enumerable_indices)}")
    print(f"Skip holes: {len(session.skip_indices)}")
    
    print(f"\n🔍 Sorry Map:")
    for idx, info in session.sorry_map.items():
        enum_status = "ENUM" if info.should_enumerate else "SKIP"
        print(f"  Index {idx}: {info.macro_type} ({info.hole_id}) -> {enum_status}")
    
    print(f"\n🎯 Enumerable indices: {session.enumerable_indices}")
    print(f"⏭️  Skip indices: {session.skip_indices}")
    
    # Test tactic enumeration
    print(f"\n🧪 Testing Tactic Enumeration:")
    test_tactics = ["norm_num", "linarith", "omega", "sorry"]
    
    results = integrator.enumerate_tactics_for_session(test_tactics)
    
    print(f"\n📈 Enumeration Results:")
    print(f"Successful attempts: {results['successful_attempts']}")
    print(f"Failed attempts: {results['failed_attempts']}")
    print(f"Success rate: {results['successful_attempts']/(results['successful_attempts'] + results['failed_attempts'])*100:.1f}%")
    
    if results['successful_tactics']:
        print(f"\n✅ Successful tactics:")
        for hole_idx, tactic in results['successful_tactics'].items():
            hole_id = session.sorry_map[hole_idx].hole_id
            print(f"  {hole_id} (index {hole_idx}): {tactic}")
    
    # Save results
    with open('/home/matheye/lean-pl-fix/proofstep_integration_demo.lean', 'w') as f:
        f.write(clear_with_macros)
    
    print(f"\n💾 Demo code saved to: proofstep_integration_demo.lean")
    
    return results

if __name__ == "__main__":
    demo_proofstep_integration()
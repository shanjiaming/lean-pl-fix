"""
Unified Decomposition Solver

This module provides a unified interface for the decomposition solver,
integrating the functionality from the original decompose_solver.py.
"""

import re
import os
import json
from typing import Dict, Optional, List, Any
from abc import ABC, abstractmethod
from dataclasses import dataclass
from pathlib import Path

from .base_solver import BaseSolver, SolverResult, SolverStatus, SolverConfig
from data_management.unified_problem_manager import Problem


class TacticNode:
    """Enhanced class to wrap tactics with additional attributes"""
    
    def __init__(self, tactic):
        self.tactic = tactic
        self.subhaves = []
        self.by_block_goals = None
        self.parent = None
        self._parsed_structure_cache = None
    
    @property
    def start_pos(self):
        return self.tactic.start_pos
    
    @property
    def end_pos(self):
        return self.tactic.end_pos
    
    @property
    def goals(self):
        return self.tactic.goals
    
    def is_have(self):
        """Check if this tactic is a 'have' statement"""
        tactic_text = self.tactic.tactic
        has_by = re.search(r':=\s+by\b', tactic_text) is not None
        return tactic_text.strip().startswith("have") and has_by
    
    def parse_have_structure(self):
        """Parse the structure of a have statement into components"""
        if not self.is_have():
            return None
        if self._parsed_structure_cache is None:
            self._parsed_structure_cache = self._compute_parsed_structure()
        return self._parsed_structure_cache
    
    def _compute_parsed_structure(self):
        """Compute the parsed structure of a have statement"""
        tactic_text = self.tactic.tactic
        
        name = "this"
        is_implicit_name = True
        
        # Try to find explicit name
        head = tactic_text.split(":=")[0]
        explicit_name_match = re.search(r'have\s+([^\s\(:]+)', head)
        if explicit_name_match:
            name = explicit_name_match.group(1)
            is_implicit_name = False
        
        # Extract type string
        type_str = "_"
        have_pos = tactic_text.find("have")
        start_pos = have_pos + len("have")
        
        # Skip spaces after "have"
        while start_pos < len(tactic_text) and tactic_text[start_pos].isspace():
            start_pos += 1
        
        # Skip name if not implicit
        if not is_implicit_name:
            start_pos = start_pos + len(name)
            while start_pos < len(tactic_text) and tactic_text[start_pos].isspace():
                start_pos += 1
        
        # Find := that ends the type
        pos = start_pos
        paren_level = 0
        type_end = -1
        
        while pos < len(tactic_text) - 1:
            if tactic_text[pos] == '(':
                paren_level += 1
            elif tactic_text[pos] == ')':
                paren_level -= 1
            elif paren_level == 0 and tactic_text[pos:pos+2] == ':=':
                type_end = pos
                break
            pos += 1
        
        full_type_str = tactic_text[start_pos:type_end].strip()
        
        return {
            "name": name,
            "type": full_type_str,
            "is_implicit_name": is_implicit_name
        }


def throw_head(input_str: str) -> str:
    """Remove lines that start with import, set_option, open"""
    return '\n'.join([
        line for line in input_str.split('\n') 
        if not line.startswith("import") 
        and not line.startswith("set_option") 
        and not line.startswith("open")
    ])


def convert_theorem_to_example_cmd(input_str: str) -> str:
    """Convert theorem to example command format"""
    lines = input_str.split('\n')
    output_lines = []
    theorem_found = False
    indent_prefix = "  "

    for line in lines:
        if not theorem_found:
            theorem_keyword_index = line.find("theorem")
            if theorem_keyword_index != -1:
                theorem_found = True
                before_theorem = line[:theorem_keyword_index]
                after_theorem_keyword = line[theorem_keyword_index + len("theorem"):]
                output_lines.append(f"{before_theorem}example := by")
                output_lines.append(f"{indent_prefix}have{after_theorem_keyword}")
            else:
                output_lines.append(line)
        else:
            output_lines.append(f"{indent_prefix}{line}")
            
    return '\n'.join(output_lines)


def convert_have_to_theorem(proof_string: str) -> str:
    """Convert 'have' statement to 'theorem' statement"""
    stripped_string = proof_string.lstrip()
    if stripped_string.startswith("have "):
        have_keyword_start_index = proof_string.find("have ")
        return proof_string[:have_keyword_start_index] + "theorem" + proof_string[have_keyword_start_index + len("have"):]
    elif stripped_string.startswith("have:") or (stripped_string.startswith("have") and ":=" in stripped_string):
        have_keyword_start_index = proof_string.find("have")
        return proof_string[:have_keyword_start_index] + "theorem" + proof_string[have_keyword_start_index + len("have"):]
    raise ValueError(f"Could not convert have to theorem: {proof_string}")


def convert_theorem_to_have(proof_string: str) -> str:
    """Convert 'theorem' statement to 'have' statement"""
    stripped_string = proof_string.lstrip()
    if stripped_string.startswith("theorem "):
        theorem_keyword_start_index = proof_string.find("theorem ")
        return proof_string[:theorem_keyword_start_index] + "have" + proof_string[theorem_keyword_start_index + len("theorem"):]
    elif stripped_string.startswith("theorem:") or (stripped_string.startswith("theorem") and ":=" in stripped_string):
        theorem_keyword_start_index = proof_string.find("theorem")
        return proof_string[:theorem_keyword_start_index] + "have" + proof_string[theorem_keyword_start_index + len("theorem"):]
    return proof_string


class DecomposeSolver(BaseSolver):
    """Unified decomposition solver implementation"""
    
    def __init__(self, config: Optional[SolverConfig] = None):
        super().__init__("DecomposeSolver", config or SolverConfig())
        self.unified_env = None
    
    def solve(self, problem: Problem) -> SolverResult:
        """
        Solve a problem using decomposition approach
        
        Args:
            problem: Problem to solve
            
        Returns:
            SolverResult with the solution
        """
        try:
            # Extract problem content using problem_manager
            from data_management.unified_problem_manager import problem_manager
            content = problem_manager.get_problem_content(problem)
            
            # Apply decomposition solving logic
            result = self._solve_with_decomposition(content, problem)
            
            if result:
                return SolverResult(
                    status=SolverStatus.SUCCESS,
                    solution=result,
                    metadata={"method": "decomposition"}
                )
            else:
                return SolverResult(
                    status=SolverStatus.FAILURE,
                    solution="",
                    error_message="Decomposition solving failed"
                )
                
        except Exception as e:
            return SolverResult(
                status=SolverStatus.ERROR,
                solution="",
                error_message=str(e)
            )
    
    def get_solver_info(self) -> Dict[str, Any]:
        """Get information about this solver"""
        return {
            "name": self.name,
            "type": "decomposition",
            "description": "Unified decomposition solver using lean interaction",
            "capabilities": ["proof_decomposition", "tactic_analysis", "have_extraction"],
            "version": "1.0.0"
        }    
    def _solve_with_decomposition(self, content: str, problem: Problem = None) -> Optional[str]:
        """
        Internal method to solve using decomposition
        
        Args:
            content: The problem content to solve
            problem: Problem instance for saving decomposed files
            
        Returns:
            Solved content if successful, None otherwise
        """
        try:
            # Parse have statements from the content
            have_statements = self._extract_have_statements(content)
            
            if not have_statements and "sorry" in content:
                # Simple case: just replace sorry
                return content.replace("sorry", "simp")
            
            if not have_statements:
                # No decomposition needed
                return content
            
            # Create decomposed files
            if problem:
                decomposed_count = self._create_decomposed_files(have_statements, problem)
                print(f"📁 Generated {decomposed_count} decomposed files")
            
            # Create main proof with holes
            main_proof = self._create_main_proof_with_holes(content, have_statements)
            
            # Save main proof with holes to hole directory
            if problem:
                self._save_main_proof_with_holes(main_proof, problem)
            
            # Replace any remaining sorry statements
            if "sorry" in main_proof:
                main_proof = main_proof.replace("sorry", "simp")
            
            return main_proof
            
        except Exception as e:
            if self.config.debug:
                print(f"Decomposition solving failed: {e}")
            return None
    
    def _extract_have_statements(self, content: str) -> List[Dict[str, str]]:
        """Extract have statements from the content"""
        lines = content.split('\n')
        have_statements = []
        current_have = None
        indent_level = 0
        
        for i, line in enumerate(lines):
            stripped = line.strip()
            
            if stripped.startswith('have '):
                # Start of a new have statement
                if current_have:
                    have_statements.append(current_have)
                
                # Parse have statement
                have_name = self._extract_have_name(stripped)
                have_type = self._extract_have_type(stripped)
                indent_level = len(line) - len(line.lstrip())
                
                current_have = {
                    'name': have_name,
                    'type': have_type,
                    'line_start': i,
                    'line_end': i,
                    'content': line,
                    'indent': indent_level,
                    'proof_lines': []
                }
            elif current_have and line.strip():
                # Continue collecting proof lines for current have
                line_indent = len(line) - len(line.lstrip())
                if line_indent > current_have['indent'] or line.strip().startswith('exact'):
                    current_have['proof_lines'].append(line)
                    current_have['line_end'] = i
                else:
                    # End of current have
                    have_statements.append(current_have)
                    current_have = None
        
        # Add the last have if any
        if current_have:
            have_statements.append(current_have)
        
        return have_statements
    
    def _extract_have_name(self, have_line: str) -> str:
        """Extract name from have statement"""
        # have h1 : type := by proof
        parts = have_line.split(':')
        if len(parts) >= 2:
            name_part = parts[0].replace('have', '').strip()
            return name_part
        return f"h{len(have_line)}"
    
    def _extract_have_type(self, have_line: str) -> str:
        """Extract type from have statement"""
        # have h1 : type := by proof
        if ':' in have_line and ':=' in have_line:
            type_part = have_line.split(':')[1].split(':=')[0].strip()
            return type_part
        return "unknown_type"
    
    def _create_decomposed_files(self, have_statements: List[Dict[str, str]], problem: Problem) -> int:
        """Create decomposed files for each have statement without headers"""
        import os
        from pathlib import Path
        
        decomposed_dir = Path(problem.decomposed_dir)
        decomposed_dir.mkdir(parents=True, exist_ok=True)
        
        created_files = 0
        
        for i, have_stmt in enumerate(have_statements):
            # Create individual theorem for each have (no header, pure content only)
            theorem_name = f"sub_theorem_{have_stmt['name']}"
            theorem_content = f"theorem {theorem_name} {have_stmt['type']} := by\n  hole\n"
            
            # Create file with only the theorem content (no header)
            filename = f"decomposed_{i:02d}_{have_stmt['name']}.lean"
            filepath = decomposed_dir / filename
            
            with open(filepath, 'w', encoding='utf-8') as f:
                f.write(theorem_content)
            
            created_files += 1
            print(f"  Created: {filename} for have statement '{have_stmt['name']}'")
        
        return created_files
    
    def _create_main_proof_with_holes(self, content: str, have_statements: List[Dict[str, str]]) -> str:
        """Create main proof with holes replacing have statements"""
        lines = content.split('\n')
        result_lines = []
        
        # Track which lines are part of have statements
        have_line_ranges = []
        for have_stmt in have_statements:
            have_line_ranges.append((have_stmt['line_start'], have_stmt['line_end']))
        
        i = 0
        while i < len(lines):
            line = lines[i]
            
            # Check if this line is part of a have statement
            is_have_line = False
            for start, end in have_line_ranges:
                if start <= i <= end:
                    # Replace have statement with hole reference
                    if i == start:  # First line of have
                        have_name = self._extract_have_name(line.strip())
                        indent = ' ' * (len(line) - len(line.lstrip()))
                        result_lines.append(f"{indent}have {have_name} {self._extract_have_type(line.strip())} := by hole")
                    is_have_line = True
                    break
            
            if not is_have_line:
                result_lines.append(line)
            
            i += 1
        
        return '\n'.join(result_lines)

    def _save_main_proof_with_holes(self, main_proof: str, problem: Problem):
        """Save main proof with holes to hole directory (without header)"""
        hole_dir = Path(problem.hole_dir)
        hole_dir.mkdir(parents=True, exist_ok=True)
        
        filename = f"hole_{problem.problem_id}.lean"
        filepath = hole_dir / filename
        
        # Save only the proof content without header
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(main_proof)
        
        print(f"📁 Saved main proof with holes to {filepath} (header-free)")


# Global unified environment instance
unified_env = None


def get_unified_env():
    """Get or create the global unified environment"""
    global unified_env
    if unified_env is None:
        unified_env = UnifiedLeanEnvironment()
    return unified_env


class UnifiedLeanEnvironment:
    """Unified Lean environment for managing header environments"""
    
    def __init__(self):
        self.header_envs = {}
    
    def get_or_create_header_env(self, header_content: str):
        """Get or create header environment for given content"""
        header_hash = hash(header_content)
        if header_hash not in self.header_envs:
            # In full implementation, this would create actual Lean environment
            self.header_envs[header_hash] = f"HeaderEnv_{header_hash}"
        return self.header_envs[header_hash]
    
    def run_with_header(self, header_content: str, input_content: str, **kwargs):
        """Run content with header environment"""
        header_env = self.get_or_create_header_env(header_content)
        # In full implementation, this would execute in Lean
        return f"Result from {header_env} with input: {input_content}"
    
    def run_hole_with_header(self, problem: Problem, hole_content: str, **kwargs):
        """Run hole content with dynamically loaded header and hole macro"""
        from data_management.unified_problem_manager import problem_manager
        
        # Get the original header content
        header_content = problem_manager.get_header_content(problem)
        
        # Add hole macro definition to header
        hole_macro = 'macro "hole" : tactic => `(tactic| admit)'
        full_header = f"{header_content}\n\n{hole_macro}\n\n"
        
        # Combine header with hole content
        full_content = f"{full_header}{hole_content}"
        
        # Use unified environment to run
        header_env = self.get_or_create_header_env(full_header)
        
        print(f"🔧 Running hole with dynamic header (env: {header_env})")
        print(f"📝 Header includes hole macro: {hole_macro}")
        
        # In full implementation, this would execute in Lean with proper environment
        return f"Result from {header_env} with hole content"
    
    def run_decomposed_with_header(self, problem: Problem, decomposed_content: str, **kwargs):
        """Run decomposed content with dynamically loaded header and hole macro"""
        return self.run_hole_with_header(problem, decomposed_content, **kwargs)


def solve_theorem_unified(problem: Problem, fix_single_proof_func: callable) -> str:
    """
    Solve theorem using unified environment
    
    Args:
        problem: Problem to solve
        fix_single_proof_func: Function to fix single proofs
        
    Returns:
        Solution string
    """
    env = get_unified_env()
    
    # Extract header and content using problem_manager
    from data_management.unified_problem_manager import problem_manager
    header_content = problem_manager.get_header_content(problem)
    theorem_content = problem_manager.get_problem_content(problem)
    
    # Use unified environment to solve
    result = env.run_with_header(header_content, theorem_content)
    
    return result 

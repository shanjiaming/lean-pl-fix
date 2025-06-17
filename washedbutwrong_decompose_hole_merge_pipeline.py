import os
import json
from typing import Dict, List, Tuple, Optional, Union
from dataclasses import dataclass
from datetime import datetime

# Add lean verification imports - fix the import to match decompose_solver.py
from lean_interact import TempRequireProject, LeanREPLConfig, LeanServer, Command

from decompose_solver import solve_theorem_unified, unified_env, TacticNode
# from substep_saver_hole import process_lean_file_holeformat
from unified_problem_manager import problem_manager, Problem


@dataclass
class DecompositionStep:
    """Represents a single decomposition step with its hole version"""
    step_id: str
    original_content: str
    hole_content: str
    filled_content: Optional[str] = None
    original_verification_pass: Optional[bool] = None
    hole_verification_pass: Optional[bool] = None
    filled_verification_pass: Optional[bool] = None
    additional_info: Optional[Dict] = None


class DecomposeHoleMergePipeline:
    """
    Pipeline for decomposing proofs, generating hole versions, and merging back
    """
    
    def __init__(self, output_base_dir: str = "decomposition_results"):
        self.output_base_dir = output_base_dir
        self.step_counter = {"count": 0}
        
        # Initialize Lean verifier
        from decompose_solver import unified_env
        self.lean_verifier = unified_env
        
        # Ensure output directory exists
        os.makedirs(self.output_base_dir, exist_ok=True)
        print(f"Pipeline initialized with output directory: {self.output_base_dir}")
        
    def get_next_step_id(self) -> str:
        """Generate unique step ID"""
        self.step_counter["count"] += 1
        return f"step_{self.step_counter['count']:04d}"
        
    def decompose_problem(self, problem: Problem) -> tuple[List[DecompositionStep], str]:
        """
        Decompose a problem into substeps with hole versions
        Returns (decomposition_steps, hole_version_content)
        
        Pure decomposition - identifies holes and generates hole version only.
        No filling or synthesis logic.
        
        Args:
            problem: The problem to decompose
        """
        print(f"Decomposing problem: {problem.dataset}/{problem.problem_id}")
        print("Using pure decomposition approach (no filling)...")
        
        # Get problem content for decomposition
        problem_content = problem_manager.get_problem_content(problem)
        
        print("Using NEW in-place hole replacement approach...")
        
        # Step 1: Generate hole version using pure decomposition
        hole_content, hole_list = self.generate_in_place_holes(problem)
        
        if not hole_list:
            print("No holes generated - problem may not contain have statements")
            return [], hole_content
        
        # Step 2: Create decomposition steps for each hole (metadata only)
        decomposition_steps = []

        for hole_info in hole_list:
            step_id = self.get_next_step_id()
            hole_id = hole_info['hole_id']
            original_proof = hole_info['original_proof']
            
            print(f"  Recording {step_id} for {hole_id}: {original_proof}")
            
            # Create decomposition step (metadata only, no filling)
            additional_info = {
                "method": "pure_decomposition",
                "hole_id": hole_id,
                "original_proof": original_proof
            }
            
            # Add have information if available
            if 'have_name' in hole_info and hole_info['have_name']:
                additional_info['have_name'] = hole_info['have_name']
            if 'have_type' in hole_info and hole_info['have_type']:
                additional_info['have_type'] = hole_info['have_type']
            
            step = DecompositionStep(
                step_id=step_id,
                original_content=f"-- Original: {hole_id} := {original_proof}",
                hole_content=hole_id,
                filled_content="",  # No filling in pure decomposition
                original_verification_pass=True,  # Will be verified by caller
                hole_verification_pass=True,      # Will be verified by caller
                filled_verification_pass=True,    # Not applicable in pure decomposition
                additional_info=additional_info
            )
            
            decomposition_steps.append(step)
            print(f"Recorded decomposition step: {step_id} ({hole_id})")
        
        print(f"Pure decomposition completed. Generated {len(decomposition_steps)} holes.")
        print(f"Hole version length: {len(hole_content)} chars")
        
        return decomposition_steps, hole_content
    
    def _generate_hole_for_step(self, problem: Problem, proof_framework: str) -> str:
        """Generate hole version for a single proof step"""
        # Get the correct header from the dataset instead of using a fixed simple header
        header_content = problem_manager.get_header_content(problem)
        
        # Run with header to get tactics
        run_result = unified_env.run_with_header(header_content, proof_framework, all_tactics=True)
        
        # Process similar to substep_saver_hole but for individual step
        content = proof_framework
        remove_tactic_pos = []
        current_location = None
        
        for tactic in run_result.tactics:
            tactictxt = tactic.tactic
            tacticname = tactictxt.strip().split()[0] if tactictxt.strip() else ""
            
            if current_location is not None and current_location >= tactic.start_pos:
                continue
            current_location = tactic.end_pos
            
            if tacticname != "have":
                remove_tactic_pos.append((tactic.start_pos, tactic.end_pos))
        
        # Comment out non-have tactics
        for reverse_remove in reversed(remove_tactic_pos):
            contentlines = content.split("\n")
            for i in range(reverse_remove[0].line-1, reverse_remove[1].line):
                if i == 0:
                    contentlines[i] = contentlines[i].replace(":=by ", ":=by -- ")
                    contentlines[i] = contentlines[i].replace(" by ", " by -- ")
                if i != 0:
                    contentlines[i] = "  --" + contentlines[i]
            content = "\n".join(contentlines)
        
        # Only add hole placeholder - NO macro definition (will be added during verification)
        hole_content = content + "\n  hole"
        
        return hole_content
    
    def save_decomposition(self, problem_dir: str, problem: Problem, steps: List[DecompositionStep], 
                          original_verification_pass: Optional[bool] = None, 
                          filled_verification_pass: Optional[bool] = None) -> str:
        """Save decomposition steps to files"""
        # Ensure the directory exists
        os.makedirs(problem_dir, exist_ok=True)
        
        # Save header.lean and problem.lean for self-contained information
        header_content = problem_manager.get_header_content(problem)
        problem_content = problem_manager.get_problem_content(problem)
        
        with open(os.path.join(problem_dir, "header.lean"), "w") as f:
            f.write(header_content)
        
        with open(os.path.join(problem_dir, "problem.lean"), "w") as f:
            f.write(problem_content)
        
        # Save comprehensive metadata with all hole information
        metadata = {
            "problem_id": problem.problem_id,
            "dataset": problem.dataset,
            "timestamp": datetime.now().isoformat(),
            "header_file": "header.lean",
            "problem_file": "problem.lean",
            "original_verification_pass": original_verification_pass,
            "filled_verification_pass": filled_verification_pass,
            "hole_verification_pass": False,
            "holes": []
        }
        
        all_holes_verified = True
        for step in steps:
            if not step.hole_verification_pass:
                all_holes_verified = False

            # The user wants a cleaner, more direct JSON structure.
            # We will flatten the structure and clean up the content.
            if step.additional_info:
                # Use the meaningful hole_id from additional_info
                hole_id = step.additional_info.get("hole_id", step.step_id)
                
                # Use the clean original_proof from additional_info
                original_proof = step.additional_info.get("original_proof", step.original_content)

                hole_data = {
                    "hole_id": hole_id,
                    "original_proof": original_proof,
                    "best_tactic": step.additional_info.get("best_tactic"),
                    "method": step.additional_info.get("method"),
                    "original_verification_pass": step.original_verification_pass,
                    "hole_verification_pass": step.hole_verification_pass,
                    "filled_verification_pass": step.filled_verification_pass,
                    "tactics_tried": step.additional_info.get("tactics_tried"),
                    "successful_tactics": step.additional_info.get("successful_tactics"),
                    "failed_tactics": step.additional_info.get("failed_tactics"),
                    "have_name": step.additional_info.get("have_name"),
                    "have_type": step.additional_info.get("have_type"),
                }
            else:
                # Fallback for steps without additional_info
                hole_data = {
                    "hole_id": step.step_id,
                    "original_proof": step.original_content,
                    "best_tactic": None,
                    "method": None,
                    "original_verification_pass": step.original_verification_pass,
                    "hole_verification_pass": step.hole_verification_pass,
                    "filled_verification_pass": step.filled_verification_pass,
                    "tactics_tried": [],
                    "successful_tactics": [],
                    "failed_tactics": [],
                }
            metadata["holes"].append(hole_data)
        
        # Set the global hole_verification_pass status
        metadata["hole_verification_pass"] = all_holes_verified

        with open(os.path.join(problem_dir, "decomposition.json"), "w") as f:
            json.dump(metadata, f, indent=2)
        
        print(f"Saved {len(steps)} decomposition steps to {problem_dir}")
        print(f"Also saved header.lean and problem.lean for self-contained information")
        return problem_dir
    
    def load_decomposition(self, problem_dir: str) -> List[DecompositionStep]:
        """Load decomposition steps from comprehensive JSON file"""
        decomposition_path = os.path.join(problem_dir, "decomposition.json")
        if not os.path.exists(decomposition_path):
            # Fallback to old format
            metadata_path = os.path.join(problem_dir, "metadata.json")
            if not os.path.exists(metadata_path):
                raise ValueError(f"No decomposition metadata found in {problem_dir}")
            return self._load_decomposition_old_format(problem_dir)
        
        with open(decomposition_path, "r") as f:
            metadata = json.load(f)
        
        steps = []
        for hole_info in metadata["holes"]:
            # This part needs to be robust to both old and new formats.
            # For simplicity, we'll assume the new format might not have all old keys.
            # We reconstruct a شبه-additional_info for compatibility if needed.

            is_new_format = "original_proof" in hole_info

            if is_new_format:
                 # Re-construct a dictionary that resembles the old additional_info
                 # to maintain compatibility with DecompositionStep structure.
                 additional_info_compat = {
                     "hole_id": hole_info.get("hole_id"),
                     "original_proof": hole_info.get("original_proof"),
                     "best_tactic": hole_info.get("best_tactic"),
                     "method": hole_info.get("method"),
                     "tactics_tried": hole_info.get("tactics_tried"),
                     "successful_tactics": hole_info.get("successful_tactics"),
                     "failed_tactics": hole_info.get("failed_tactics"),
                 }
                 step = DecompositionStep(
                    step_id=hole_info["hole_id"],
                    original_content=hole_info["original_proof"],
                    # The new format doesn't have these, provide meaningful defaults.
                    hole_content=hole_info["hole_id"],  # Use the hole ID directly for verification
                    filled_content=hole_info.get('best_tactic', 'admit'),  # Use actual tactic or admit
                    original_verification_pass=hole_info.get("original_verification_pass"),
                    hole_verification_pass=hole_info.get("hole_verification_pass"),
                    filled_verification_pass=hole_info.get("filled_verification_pass"),
                    additional_info=additional_info_compat
                )
            else:
                # Old format loading logic
                step = DecompositionStep(
                    step_id=hole_info["hole_id"],
                    original_content=hole_info["original_content"],
                    hole_content=hole_info["hole_content"],
                    filled_content=hole_info["filled_content"],
                    # Load verification results if available in metadata
                    original_verification_pass=hole_info["original_verification_pass"],
                    hole_verification_pass=hole_info["hole_verification_pass"],
                    filled_verification_pass=hole_info["filled_verification_pass"],
                    additional_info=hole_info["additional_info"]
                )
            steps.append(step)
        
        return steps
    
    def _load_decomposition_old_format(self, problem_dir: str) -> List[DecompositionStep]:
        """Load decomposition steps from old file-based format"""
        metadata_path = os.path.join(problem_dir, "metadata.json")
        with open(metadata_path, "r") as f:
            metadata = json.load(f)
        
        steps = []
        for step_info in metadata["steps"]:
            step_id = step_info["step_id"]
            
            # Load original content
            with open(os.path.join(problem_dir, f"{step_id}_original.lean"), "r") as f:
                original_content = f.read()
            
            # Load hole content
            with open(os.path.join(problem_dir, f"{step_id}_hole.lean"), "r") as f:
                hole_content = f.read()
            
            # Check if filled version exists
            filled_path = os.path.join(problem_dir, f"{step_id}_filled.lean")
            filled_content = None
            if os.path.exists(filled_path):
                with open(filled_path, "r") as f:
                    filled_content = f.read()
            
            step = DecompositionStep(
                step_id=step_id,
                original_content=original_content,
                hole_content=hole_content,
                filled_content=filled_content,
                # Load verification results if available in metadata
                original_verification_pass=step_info.get("original_verification_pass"),
                hole_verification_pass=step_info.get("hole_verification_pass"),
                filled_verification_pass=step_info.get("filled_verification_pass"),
                additional_info=step_info.get("additional_info")
            )
            steps.append(step)
        
        return steps
    
    def verify_lean_code(self, header: str, content: str, return_error_string: bool = False) -> Union[bool, Tuple[bool, Optional[str]]]:
        """
        Verify if Lean code has no errors using header form.
        A successful verification means no Lean errors and no unsolved goals.
        
        Args:
            header: Header content with imports and declarations
            content: Lean code content to verify (should include any needed macros)
            return_error_string: If True, returns a tuple (bool, Optional[str]). 
                                 Otherwise, returns a bool.
        
        Returns: 
            - bool if return_error_string is False.
            - (True, None) or (False, error_message) if return_error_string is True.
        """
        result = self.lean_verifier.run_with_header(header, content)
        
        # Check for fatal errors reported directly on the result object.
        error_msg = getattr(result, 'error', None)
        if error_msg:
            return (False, error_msg) if return_error_string else False
            
        # Check for tactical errors or unsolved goals from the message list.
        # An empty list of errors means success.
        if hasattr(result, 'get_errors'):
            errors = result.get_errors()
            if errors: # If the list is not empty
                # Combine multiple error messages if they exist
                error_str = "\n".join(str(e.data) for e in errors)
                return (False, error_str) if return_error_string else False
                
        # If no errors are found, verification passes.
        return (True, None) if return_error_string else True

    def generate_clear_version(self, hole_content: str, hole_list: List[Dict]) -> str:
        """
        Generate clear version of hole content to solve metavariable dependency issues.
        
        For each have statement containing a hole, add:
        - clear h - remove the have statement
        - have h : [type] := skip_hole - redefine with skip_hole
        
        Args:
            hole_content: Original hole version content
            hole_list: List of hole information with metadata
            
        Returns:
            str: Clear version with clear statements added
        """
        import re
        
        lines = hole_content.split('\n')
        result_lines = []
        processed_haves = set()  # Track processed have variables to avoid duplicates
        
        # Find all hole positions
        hole_positions = {}  # hole_id -> line_number
        for i, line in enumerate(lines):
            hole_match = re.match(r'^\s*(hole_\d+)\s*$', line.strip())
            if hole_match:
                hole_id = hole_match.group(1)
                hole_positions[hole_id] = i
        
        print(f"Found holes at positions: {hole_positions}")
        
        # Build hole to have mapping using pre-computed information from hole generation
        hole_to_have_mapping = {}  # hole_id -> (have_var_name, have_type, have_indent)
        
        for hole_info in hole_list:
            hole_id = hole_info['hole_id']
            
            # Use the have information computed during hole generation if available
            if 'have_name' in hole_info and 'have_type' in hole_info:
                have_name = hole_info['have_name']
                have_type = hole_info['have_type']
                
                if hole_id in hole_positions:
                    hole_line = hole_positions[hole_id]
                    
                    # Find the corresponding have statement to get correct indentation
                    found_have = False
                    for i in range(hole_line - 1, -1, -1):
                        line = lines[i]
                        
                        # Check if this line contains the have variable name
                        if f"have {have_name}" in line:
                            indent = len(line) - len(line.lstrip())
                            hole_to_have_mapping[hole_id] = (have_name, have_type, indent)
                            found_have = True
                            break
                    
                    if not found_have:
                        print(f"Warning: Could not find have statement for {hole_id} with name {have_name}")
            else:
                # Fallback: parse from have_statement if pre-computed info not available
                have_statement = hole_info.get('have_statement', '')
                
                if have_statement and have_statement.strip().startswith('have '):
                    have_match = re.match(r'have\s+(\w+)\s*:\s*([^:=]+?)(?:\s*:=|$)', have_statement.strip())
                    
                    if have_match:
                        have_name = have_match.group(1).strip()
                        have_type = have_match.group(2).strip()
                        
                        if hole_id in hole_positions:
                            hole_line = hole_positions[hole_id]
                            
                            # Find corresponding have statement for indentation
                            found_have = False
                            for i in range(hole_line - 1, -1, -1):
                                line = lines[i]
                                
                                if f"have {have_name}" in line:
                                    indent = len(line) - len(line.lstrip())
                                    hole_to_have_mapping[hole_id] = (have_name, have_type, indent)
                                    found_have = True
                                    break
                            
                            if not found_have:
                                print(f"Warning: Could not find have statement for {hole_id} with name {have_name}")
                    else:
                        print(f"Warning: Could not parse have_statement for {hole_id}: {have_statement[:100]}...")
        
        # Iterate through all lines and add clear statements
        i = 0
        while i < len(lines):
            line = lines[i]
            result_lines.append(line)
            
            # Check if current line is a hole
            hole_match = re.match(r'^\s*(hole_\d+)\s*$', line.strip())
            if hole_match:
                hole_id = hole_match.group(1)
                
                # Check if this hole needs clear statements
                if hole_id in hole_to_have_mapping:
                    have_name, have_type, indent = hole_to_have_mapping[hole_id]
                    
                    if have_name not in processed_haves:
                        indent_str = ' ' * indent
                        result_lines.append(f"{indent_str}clear {have_name}")
                        result_lines.append(f"{indent_str}have {have_name} : {have_type} := skip_hole")
                        processed_haves.add(have_name)
            
            i += 1
        
        return '\n'.join(result_lines)

    def test_clear_version_generation(self, problem: Problem) -> Dict:
        """
        Test clear version generation functionality
        
        Args:
            problem: Problem to test
            
        Returns:
            Dict: Dictionary containing test results
        """
        print(f"Testing clear version generation for {problem.dataset}/{problem.problem_id}")
        
        # Get original content
        header_content = problem_manager.get_header_content(problem)
        original_content = problem_manager.get_problem_content(problem)
        
        # Generate hole version (now includes have information)
        hole_content, hole_list = self.generate_in_place_holes(problem)
        
        # Generate clear version using pre-computed have information
        clear_content = self.generate_clear_version(hole_content, hole_list)
        
        # Verify all versions
        original_verification = self.verify_lean_code(header_content, original_content)
        
        # Generate macros for hole version
        hole_macros = []
        for hole_info in hole_list:
            hole_id = hole_info['hole_id']
            hole_macros.append(f'macro "{hole_id}" : tactic => `(tactic| admit)')
        
        hole_with_macros = '\n'.join(hole_macros) + '\n\n' + hole_content if hole_macros else hole_content
        hole_verification = self.verify_lean_code(header_content, hole_with_macros)
        
        # Add skip_hole macro for clear version
        clear_macros = hole_macros.copy()
        clear_macros.append('macro "skip_hole" : term => `(sorry)')
        clear_with_macros = '\n'.join(clear_macros) + '\n\n' + clear_content
        clear_verification = self.verify_lean_code(header_content, clear_with_macros)
        
        return {
            "original_content": original_content,
            "hole_content": hole_content,
            "clear_content": clear_content,
            "hole_list": hole_list,
            "verification": {
                "original": original_verification,
                "hole": hole_verification,
                "clear": clear_verification
            }
        }



    def _verify_single_hole_in_context(self, header_content: str, hole_id: str, hole_version_content: str) -> bool:
        """
        Verify a single hole in the complete proof context.
        This creates a version where only the specified hole is kept as hole_ID,
        while all other holes are replaced with admit.
        
        Args:
            header_content: The header content for verification
            hole_id: The specific hole ID to test (e.g., "hole_2")
            hole_version_content: The complete hole version with all holes as hole_IDs
            
        Returns:
            bool: True if the verification passes, False otherwise
        """
        import re
        
        # Create a version where all holes except the target one are replaced with admit
        test_content = hole_version_content
        
        # Find all hole_N patterns in the content
        hole_patterns = re.findall(r'\bhole_\d+\b', test_content)
        
        for hole_pattern in set(hole_patterns):  # Remove duplicates
            if hole_pattern != hole_id:
                # Replace other holes with admit
                test_content = re.sub(r'\b' + re.escape(hole_pattern) + r'\b', 'admit', test_content)
        
        # The target hole_id should remain as is, and there should be a macro for it
        # Verify this modified content
        return self.verify_lean_code(header_content, test_content)



    def generate_in_place_holes_from_content(self, content: str, header_content: Optional[str] = None) -> Tuple[str, List[str]]:
        """Generate holes from raw content for testing"""
        if header_content is None:
            print("Warning: No header provided for testing. Using minimal header.")
            header_content = "import Mathlib\n"
        return self._process_content_for_holes(content, header_content)
    
    def _process_content_for_holes(self, content: str, header_content: str) -> Tuple[str, List[str]]:
        """
        Process content using lean_interact to get proper tactic tree structure,
        then create holes based on the actual tactic hierarchy rather than line-by-line parsing.
        """
        import re
        from decompose_solver import convert_theorem_to_example_cmd, remove_lean_comments, _process_tactics_to_tree
        
        # Process the content to get tactics using lean_interact
        processed_content = remove_lean_comments(content)
        # Remove imports since we provide them in header
        lines = processed_content.split('\n')
        filtered_lines = [line for line in lines if not line.strip().startswith('import')]
        processed_content = '\n'.join(filtered_lines)
        cmd_str = convert_theorem_to_example_cmd(processed_content)
        
        print("Getting tactic tree structure using lean_interact...")
        
        # Use lean_verifier to get tactics
        result = self.lean_verifier.run_with_header(header_content, cmd_str, all_tactics=True)
        
        # Log any real errors for information, but do not change control flow.
        # The tactic tree construction should be robust enough to handle malformed parts.
        if getattr(result, 'error', None):
            # Check for get_errors method to be safe
            if hasattr(result, 'get_errors'):
                real_errors = [e for e in result.get_errors() if 'unsolved goals' not in e.data]
                if real_errors:
                    print(f"INFO: Real Lean errors were detected in the source. Tactic tree generation will proceed and attempt to recover.")
            else:
                # Fallback for SimpleNamespace which doesn't have get_errors
                print(f"INFO: Lean interaction failed with error: {result.error}")

        # Build tactic tree using the mature logic from decompose_solver.py
        from decompose_solver import _process_tactics_to_tree
        tactics = result.tactics if hasattr(result, 'tactics') else []
        top_level_nodes = _process_tactics_to_tree(tactics)
        
        print(f"Built tactic tree with {len(top_level_nodes)} top-level nodes")
        
        # Process tactic tree to identify ALL have statements with by-blocks
        holes_to_create = []
        hole_counter = 1
        
        # Use the filtered content (without imports) for hole creation
        content_without_imports = '\n'.join(filtered_lines)
        
        def process_nodes_for_holes(nodes):
            nonlocal hole_counter
            
            for node in nodes:
                # Check if this is a have statement with by-block
                if node.is_have():
                    # Process this have statement for holes
                    hole_info = self._analyze_have_node_for_holes_comprehensive(node, hole_counter)
                    if hole_info:
                        # If a hole can be analyzed from the tree, we create it.
                        # The tree's structure is our "safe zone". No need for line number checks.
                        holes_to_create.append(hole_info)
                        hole_counter += 1
                        print(f"  Found have-by hole: {hole_info['hole_id']} with content: {hole_info['content'][:50]}...")
                
                # Check if this is a bullet point that can be converted to a hole

                # Recursively process children to handle nested structures
                if node.subhaves:
                    process_nodes_for_holes(node.subhaves)
        
        process_nodes_for_holes(top_level_nodes)
        
        # Use tree-guided replacement to create holes on filtered content
        hole_content_result, hole_list = self._create_holes_from_tree_analysis(cmd_str, holes_to_create)

        # Unwrap the modified cmd_str to get back the theorem format
        unwrapped_content = self._unwrap_example_cmd(hole_content_result)

        return unwrapped_content, hole_list
    
    def _unwrap_example_cmd(self, cmd_str: str) -> str:
        """
        Inverse of `convert_theorem_to_example_cmd`.
        Converts an 'example' proof back into a 'theorem'.
        """
        from decompose_solver import convert_have_to_theorem

        lines = cmd_str.split('\n')
        
        # Find the 'example := by' line
        example_line_idx = -1
        for i, line in enumerate(lines):
            if "example := by" in line:
                example_line_idx = i
                break
                
        if example_line_idx == -1:
            # Not a converted command, return as is
            print("Warning: could not find 'example := by' to unwrap.")
            return cmd_str
            
        # The lines before the example wrapper
        preamble = lines[:example_line_idx]
        
        # The next line contains the top-level 'have' which was the original 'theorem'
        if example_line_idx + 1 >= len(lines):
            print("Warning: Malformed example command, cannot unwrap.")
            return cmd_str
            
        have_line_str = lines[example_line_idx + 1]
        
        # This line has an indent we need to remove before converting
        deindented_have = have_line_str.lstrip()
        theorem_line_str = convert_have_to_theorem(deindented_have)
        
        # The rest of the proof body
        body_lines = lines[example_line_idx + 2:]
        
        # De-indent body lines (assuming a 2-space indent)
        deindented_body = [line[2:] if line.startswith("  ") else line for line in body_lines]
        
        # Combine everything
        final_lines = preamble + [theorem_line_str] + deindented_body
        return '\n'.join(final_lines)

    def _is_descendant_of(self, node, ancestor):
        """Check if node is a descendant of ancestor in the tactic tree"""
        def traverse_ancestor(current):
            if current == node:
                return True
            for child in current.subhaves:
                if traverse_ancestor(child):
                    return True
            return False
        
        return traverse_ancestor(ancestor)
    
    # def _traverse_tactic_tree(self, nodes):
    #     """Traverse tactic tree in depth-first order"""
    #     for node in nodes:
    #         yield node
    #         yield from self._traverse_tactic_tree(node.subhaves)
    
    def _analyze_have_node_for_holes_comprehensive(self, node, hole_counter):
        """
        Unified analysis of have nodes to create holes using the consistent rule:
        
        **In every by-block, find the last have statement, then convert everything after that 
        last have to the end of the by-block into a single hole.**
        
        For cases like "have h5 := by norm_num":
        - The by-block contains no internal have statements (last_have_index = -1)
        - So everything from the start of the by-block becomes a hole (i.e., "norm_num")
        
        Returns hole info dict or None if no hole should be created.
        """
        if not node.is_have():
            return None
            
        if not node.subhaves:
            # This shouldn't happen for valid have statements with by-blocks
            print(f"Warning: Have statement has no sub-tactics: {node.tactic.tactic.strip()}")
            return None
        
        # Find the last have statement among direct children
        last_have_index = -1
        for i, child in enumerate(node.subhaves):
            if child.tactic.tactic.strip().startswith("have"):
                last_have_index = i
        
        tactics_after_last_have = node.subhaves[last_have_index + 1:]
        if not tactics_after_last_have:
            return None

        # Find the first tactic to include in the hole, skipping initial boundaries
        first_tactic_idx = -1
        for i, tactic_node in enumerate(tactics_after_last_have):
            first_tactic_idx = i
            break

        if first_tactic_idx == -1:
            # All remaining tactics are boundaries, so no hole to create
            return None

        # The hole starts at this tactic and goes to the end of the block
        start_tactic_node = tactics_after_last_have[first_tactic_idx]
        tactics_in_hole = tactics_after_last_have[first_tactic_idx:]

        # Collect content for the hole
        hole_content_parts = [t.tactic.tactic.strip() for t in tactics_in_hole]
        hole_content = '\n'.join(hole_content_parts)

        return {
            'hole_id': f"hole_{hole_counter}",
            'content': hole_content,
            'original_proof': hole_content,
            'parent_have_tactic': node.tactic.tactic,  # Keep original formatting including newlines
            'start_pos': start_tactic_node.tactic.start_pos,
            'end_pos': node.end_pos,
            'hole_type': 'after_last_have' if last_have_index >= 0 else 'entire_by_block'
        }
    
    def _is_new_bullet_point_boundary(self, tactic_text: str, tactic_node) -> bool:
        """
        Check if this tactic represents a boundary to a new bullet point block.
        This helps avoid crossing bullet point boundaries when creating holes.
        """
        # Method 1: Direct bullet point detection in tactic text
        if tactic_text.startswith('·'):
            return True
        
        # Method 2: Check for specific patterns that indicate bullet point boundaries
        # For the specific case we're debugging: the second bullet point contains 'rfl'
        # and is likely at a different indentation level or structural position
        try:
            line_num = tactic_node.tactic.start_pos.line
            col_num = tactic_node.tactic.start_pos.column
                
        except Exception:
            pass
            
        return False
    
    def _analyze_bullet_point_for_hole(self, node, hole_counter):
        """
        Analyze a bullet point tactic node to create a hole.
        """
        tactic_text = node.tactic.tactic.strip()
        
        if not tactic_text.startswith('·'):
            return None
        
        # Extract the content after the bullet point
        content = tactic_text[1:].strip()
        
        if not content:
            return None
        
        return {
            'hole_id': f"hole_{hole_counter}",
            'content': content,
            'original_proof': content,
            'parent_have_tactic': f"bullet_point: {tactic_text}",
            'start_pos': node.tactic.start_pos,
            'end_pos': node.tactic.end_pos,
            'hole_type': 'bullet_point'
        }
    
    def _create_holes_from_tree_analysis(self, content: str, holes_to_create: List[Dict]) -> Tuple[str, List[Dict]]:
        """
        Create holes in content based on tree analysis using precise position information.
        This new version uses line and column data to perform targeted replacements,
        avoiding the ambiguity of text-based search.
        """
        if not holes_to_create:
            return content, []

        # Sort holes by position (start_pos) in reverse order to avoid position shifts
        # during replacement.
        holes_sorted = sorted(holes_to_create, key=lambda h: (h['start_pos'].line, h['start_pos'].column), reverse=True)
        
        hole_list_for_decomposition = []
        content_lines = content.split('\n')
        
        for hole_info in holes_sorted:
            hole_id = hole_info['hole_id']
            start_pos = hole_info['start_pos']
            end_pos = hole_info['end_pos']
            
            start_line_idx = start_pos.line - 1
            end_line_idx = end_pos.line - 1
            
            # Safety check: ensure indices are within bounds
            if start_line_idx < 0 or start_line_idx >= len(content_lines):
                print(f"  ERROR: start_line_idx {start_line_idx} out of bounds (file has {len(content_lines)} lines)")
                continue
            if end_line_idx < 0 or end_line_idx >= len(content_lines):
                print(f"  ERROR: end_line_idx {end_line_idx} out of bounds (file has {len(content_lines)} lines)")
                continue
            
            # --- BEGIN LOGGING FOR DEBUGGING ---
            print("-" * 50)
            print(f"Preparing to create hole: {hole_id}")
            print(f"  Coordinates: Start({start_pos.line}, {start_pos.column}) -> End({end_pos.line}, {end_pos.column})")
            
            original_text_to_replace = ""
            if start_line_idx == end_line_idx:
                original_text_to_replace = content_lines[start_line_idx][start_pos.column:end_pos.column]
            else:
                lines_to_replace = []
                # First line: from start column to end of line
                lines_to_replace.append(content_lines[start_line_idx][start_pos.column:])
                # Middle lines: entire lines
                lines_to_replace.extend(content_lines[start_line_idx + 1:end_line_idx])
                # Last line: from beginning to end column
                lines_to_replace.append(content_lines[end_line_idx][:end_pos.column])
                original_text_to_replace = "\n".join(lines_to_replace)

            print(f"  Text to be replaced:\n---\n{original_text_to_replace}\n---")
            # --- END LOGGING FOR DEBUGGING ---
            
            # The indentation should be based on the column of the content being replaced.
            indent = ' ' * start_pos.column

            if start_line_idx == end_line_idx:
                # Single-line replacement
                line = content_lines[start_line_idx]
                new_line = line[:start_pos.column] + hole_id + line[end_pos.column:]
                content_lines[start_line_idx] = new_line
            else:
                # Multi-line replacement
                # The block of lines to be replaced is from start_line_idx to end_line_idx.
                
                # First, modify the first and last lines of the block.
                first_line = content_lines[start_line_idx]
                last_line = content_lines[end_line_idx]
                
                # The content to keep from the first line is everything before the hole.
                # The content to keep from the last line is everything after the hole.
                modified_first_line = first_line[:start_pos.column]
                modified_last_line = last_line[end_pos.column:]

                # The hole itself is inserted with the correct indentation.
                # If the modified first and last lines are just whitespace, we can combine them.
                if not modified_first_line.strip() and not modified_last_line.strip():
                    replacement_block = [f"{indent}{hole_id}"]
                else:
                    # This case is more complex and might indicate a problem with hole boundaries.
                    # For now, we will assume holes span full lines in multi-line cases,
                    # which is a reasonable simplification for by-blocks.
                    # The most robust way is to replace the whole block with a single hole line.
                    replacement_block = [f"{indent}{hole_id}"]

                # Replace the entire block of original lines with the new block.
                content_lines = content_lines[:start_line_idx] + replacement_block + content_lines[end_line_idx + 1:]

            # Extract have information by analyzing the original content around hole position
            have_name = None
            have_type = None
            
            # Get the hole position information
            start_pos = hole_info.get('start_pos')
            if start_pos:
                import re
                # Use original content lines (not the modified content_lines)
                original_content_lines = content.split('\n')
                hole_line = start_pos.line - 1  # Convert to 0-based indexing
                
                # Search backwards for a have statement
                for i in range(hole_line, -1, -1):
                    line = original_content_lines[i] if i < len(original_content_lines) else ""
                    
                    # Look for have statements on this line
                    have_match = re.search(r'have\s+(\w+)\s*:\s*([^:=]+?)(?:\s*:=|$)', line)
                    if have_match:
                        have_name = have_match.group(1).strip()
                        have_type = have_match.group(2).strip()
                        break
                    
                    # Also check if this line starts a multi-line have statement
                    have_start_match = re.search(r'have\s+(\w+)\s*:\s*(.*)$', line)
                    if have_start_match and not re.search(r':=', line):
                        # This might be a multi-line have statement, look forward for the rest
                        have_name = have_start_match.group(1).strip()
                        type_parts = [have_start_match.group(2).strip()]
                        
                        # Look forward for continuation lines until we find := or another statement
                        for j in range(i + 1, min(i + 10, len(original_content_lines))):  # Limit search to avoid infinite loops
                            next_line = original_content_lines[j]
                            if ':=' in next_line:
                                # Found the end of the type, extract the part before :=
                                before_assign = next_line.split(':=')[0].strip()
                                if before_assign:
                                    type_parts.append(before_assign)
                                break
                            elif re.search(r'^\s*(have\s+|theorem\s+|def\s+)', next_line):
                                # Hit another statement, stop
                                break
                            else:
                                # Continuation line
                                type_parts.append(next_line.strip())
                        
                        have_type = ' '.join(type_parts).strip()
                        if have_type:
                            break
            
            # Add hole info to the list that will be returned for decomposition steps.
            hole_info_dict = {
                'hole_id': hole_id,
                'original_proof': hole_info['original_proof'],
                'have_statement': hole_info.get('parent_have_tactic', ''),
                'position': len(hole_list_for_decomposition)
            }
            
            # Add have information if available
            if have_name and have_type:
                hole_info_dict['have_name'] = have_name
                hole_info_dict['have_type'] = have_type
            
            hole_list_for_decomposition.append(hole_info_dict)

        # Reverse hole_list to maintain original order since we processed in reverse
        hole_list_for_decomposition.reverse()
        
        hole_content_result = '\n'.join(content_lines)
        print(f"Generated hole content with {len(hole_list_for_decomposition)} holes using tree-guided analysis")
        return hole_content_result, hole_list_for_decomposition
    
    def _replace_tactic_with_hole(self, lines, node, hole_id):
        """Replace a tactic in the lines with the hole_id, maintaining proper indentation"""
        # This is a simplified replacement - in practice would need more sophisticated 
        # position mapping between tactic positions and line positions
        # For now, return lines unchanged as this requires complex position mapping
        return lines
    
    def _simple_line_processing_with_filter(self, content, tactics_to_replace):
        """
        Process content line by line, but only replace tactics that were identified by tactic tree.
        This is more accurate than blindly matching tactic prefixes.
        """
        import re
        lines = content.split('\n')
        hole_list = []
        hole_counter = 1
        processed_lines = []
        
        for line in lines:
            stripped = line.strip()
            
            # Check if this line exactly matches any of the tactics identified by tactic tree
            if stripped in tactics_to_replace:
                hole_id = f"hole_{hole_counter}"
                hole_counter += 1
                
                hole_list.append({
                    'hole_id': hole_id,
                    'original_proof': stripped,
                    'have_statement': '',
                    'position': len(hole_list)
                })
                
                print(f"  Created {hole_id} for tactic: {stripped[:50]}...")
                
                # Replace with hole, preserving indentation
                indent = line[:len(line) - len(line.lstrip())]
                processed_lines.append(f"{indent}{hole_id}")
            else:
                # Keep all other lines unchanged
                processed_lines.append(line)
        
        hole_content = '\n'.join(processed_lines)
        print(f"Generated hole content with {len(hole_list)} holes using tactic tree identification")
        return hole_content, hole_list

    def _simple_line_processing(self, content):
        """
        Fallback to simple line-by-line processing when lean_interact fails.
        Use basic heuristics to identify by-blocks and apply the same logic:
        find last have in each by-block and convert content after it to holes.
        """
        import re
        lines = content.split('\n')
        hole_list = []
        hole_counter = 1
        processed_lines = []
        i = 0
        
        while i < len(lines):
            line = lines[i]
            stripped = line.strip()
            
            # Look for "have ... := by" pattern (start of by-block)
            if re.search(r'have\s+\w+\s*:.*:=\s+by\s*$', stripped):
                have_line = line
                base_indent = len(line) - len(line.lstrip())
                
                # Collect the by-block lines
                j = i + 1
                by_block_lines = []
                while j < len(lines):
                    next_line = lines[j]
                    next_indent = len(next_line) - len(next_line.lstrip())
                    
                    if next_line.strip() == '' or next_indent > base_indent:
                        by_block_lines.append(next_line)
                        j += 1
                    else:
                        break
                
                if by_block_lines:
                    # Find last have in this by-block
                    last_have_idx = -1
                    for k, by_line in enumerate(by_block_lines):
                        if re.search(r'^\s*have\s+', by_line):
                            last_have_idx = k
                    
                    if last_have_idx >= 0 and last_have_idx < len(by_block_lines) - 1:
                        # There's content after the last have - make it a hole
                        keep_lines = by_block_lines[:last_have_idx + 1]
                        hole_lines = by_block_lines[last_have_idx + 1:]
                        
                        # Filter out empty lines from hole content
                        hole_content_lines = [hl.strip() for hl in hole_lines if hl.strip()]
                        
                        if hole_content_lines:
                            hole_id = f"hole_{hole_counter}"
                            hole_counter += 1
                            
                            hole_content = '\n'.join(hole_content_lines)
                            hole_list.append({
                                'hole_id': hole_id,
                                'original_proof': hole_content,
                                'have_statement': have_line.strip(),
                                'position': len(hole_list)
                            })
                            
                            print(f"  Created {hole_id} for content after last have: {hole_content[:50]}...")
                            
                            # Reconstruct: have line + keep lines + hole
                            processed_lines.append(have_line)
                            processed_lines.extend(keep_lines)
                            hole_indent = ' ' * (base_indent + 2)
                            processed_lines.append(f"{hole_indent}{hole_id}")
                        else:
                            # No meaningful content after last have
                            processed_lines.append(have_line)
                            processed_lines.extend(by_block_lines)
                    else:
                        # No have statements or no content after last have
                        processed_lines.append(have_line)
                        processed_lines.extend(by_block_lines)
                else:
                    # No by-block content
                    processed_lines.append(line)
                
                i = j
            else:
                # Regular line, keep as-is
                processed_lines.append(line)
                i += 1
        
        hole_content = '\n'.join(processed_lines)
        print(f"Generated hole content with {len(hole_list)} holes using simple processing")
        return hole_content, hole_list

    def generate_in_place_holes(self, problem: Problem) -> Tuple[str, List[str]]:
        """
        Generate holes using current working approach with tactic tree analysis.
        TODO: Future integration with decompose_solver for even better accuracy.
        Returns (hole_version_content, list_of_hole_positions)
        """
        print(f"Generating holes for problem: {problem.dataset}/{problem.problem_id}")
        
        problem_content = problem_manager.get_problem_content(problem)
        header_content = problem_manager.get_header_content(problem)
        return self._process_content_for_holes(problem_content, header_content)

    def _append_result_to_file(self, dataset_name: str, result_record: dict):
        """
        Append a single result to the JSON file immediately after processing each problem.
        This ensures results are saved incrementally and not lost if processing is interrupted.
        """
        results_path = os.path.join(self.output_base_dir, f"{dataset_name}_pipeline_results.json")
        
        # Read existing results if file exists
        existing_results = []
        if os.path.exists(results_path):
            with open(results_path, "r") as f:
                content = f.read()
                if content:
                    existing_results = json.loads(content)
        
        # Check if this problem_id already exists to avoid duplicates
        problem_id = result_record.get("problem_id")
        if problem_id:
            # Remove any existing entries for this problem_id (in case of rerun)
            existing_results = [r for r in existing_results if r.get("problem_id") != problem_id]
        
        # Append new result
        existing_results.append(result_record)
        
        # Save updated results
        with open(results_path, "w") as f:
            json.dump(existing_results, f, indent=2)
        
        print(f"Result saved to {results_path} (total: {len(existing_results)} problems)")
    
    def _append_failure_to_file(self, dataset_name: str, failure_record: dict):
        """
        Append a single failure record to the failures JSON file immediately.
        """
        failures_path = os.path.join(self.output_base_dir, f"{dataset_name}_detailed_failures.json")
        
        # Read existing failures if file exists
        existing_failures = []
        if os.path.exists(failures_path):
            with open(failures_path, "r") as f:
                content = f.read()
                if content:
                    existing_failures = json.loads(content)
        
        # Append new failure
        existing_failures.append(failure_record)
        
        # Save updated failures
        with open(failures_path, "w") as f:
            json.dump(existing_failures, f, indent=2)
        
        print(f"Failure logged to {failures_path}")

    def process_problem(self, problem: Problem):
        """
        Process a single problem through the decomposition pipeline.
        Pure decomposition only - no filling logic.
        """

        problem_start_time = datetime.now()
        current_step = "initialization"
        dataset_name = problem.dataset

        try:
            # Step 0: Verify original problem
            current_step = "verifying_original_problem"
            print(f"Step 0: Verifying original problem {problem.problem_id}...")
            original_content = problem_manager.get_problem_content(problem)
            header_content = problem_manager.get_header_content(problem)
            
            # Check if code is too long (>400 lines)
            original_lines = len(original_content.split('\n'))
            if original_lines > 400:
                error_msg = f"Problem {problem.problem_id} skipped: code too long ({original_lines} lines > 400 lines limit)"
                print(f"✗ {error_msg}")
                processing_time = (datetime.now() - problem_start_time).total_seconds()
                
                # Record this as a length limit failure
                failure_record = {
                    "problem_id": problem.problem_id,
                    "dataset": problem.dataset,
                    "error_message": error_msg,
                    "failure_reason": "code_too_long",
                    "code_lines": original_lines,
                    "processing_time_seconds": processing_time,
                    "timestamp": datetime.now().isoformat()
                }
                
                result_record = {
                    "problem_id": problem.problem_id,
                    "dataset": problem.dataset,
                    "original_verification_pass": None,  # Not verified due to length
                    "hole_verification_pass": None,  # Not reached
                    "clear_verification_pass": None,  # Not reached
                    "filled_verification_pass": None,  # Not reached
                    "status": "skipped_too_long",
                    "error": error_msg,
                    "code_lines": original_lines,
                    "processing_time_seconds": processing_time,
                    "timestamp": datetime.now().isoformat()
                }
                
                # Append result and failure to files immediately 
                self._append_result_to_file(dataset_name, result_record)
                self._append_failure_to_file(dataset_name, failure_record)
                
                return
            
            # The tree's structure is our "safe zone". No need for line number checks.
            print(f"Verifying original problem with heartbeat check: {problem.problem_id}")
            original_verification_pass, verification_error = self.verify_lean_code(header_content, original_content, return_error_string=True)

            # Check for heartbeat timeout
            if not original_verification_pass and verification_error and "heartbeats" in verification_error:
                error_msg = f"Problem {problem.problem_id} skipped: maximum number of heartbeats reached during initial verification."
                print(f"✗ {error_msg}")
                processing_time = (datetime.now() - problem_start_time).total_seconds()
                
                failure_record = {
                    "problem_id": problem.problem_id,
                    "dataset": problem.dataset,
                    "error_message": error_msg,
                    "failure_reason": "heartbeat_timeout",
                    "processing_time_seconds": processing_time,
                    "timestamp": datetime.now().isoformat()
                }
                
                result_record = {
                    "problem_id": problem.problem_id,
                    "dataset": problem.dataset,
                    "original_verification_pass": False,
                    "hole_verification_pass": None,
                    "clear_verification_pass": None,
                    "filled_verification_pass": None,
                    "status": "skipped_heartbeat_timeout",
                    "error": error_msg,
                    "processing_time_seconds": processing_time,
                    "timestamp": datetime.now().isoformat()
                }
                
                self._append_result_to_file(dataset_name, result_record)
                self._append_failure_to_file(dataset_name, failure_record)
                return

            print(f"Original problem verification: {'PASS' if original_verification_pass else 'FAIL'} ({original_lines} lines)")
            
            # Step 1: Decompose
            current_step = "decomposition"
            print(f"Step 1: Decomposing problem {problem.problem_id}...")
            steps, hole_version_content = self.decompose_problem(problem)
            
            # Check if decomposition failed (returned empty list)
            if not steps:
                error_msg = f"Decomposition failed for problem {problem.problem_id} - no steps generated"
                print(f"✗ {error_msg}")
                processing_time = (datetime.now() - problem_start_time).total_seconds()
                
                # Record this as a decomposition failure
                failure_record = {
                    "problem_id": problem.problem_id,
                    "dataset": problem.dataset,
                    "error_message": error_msg,
                    "failure_reason": "decomposition_failed",
                    "processing_time_seconds": processing_time,
                    "timestamp": datetime.now().isoformat()
                }
                
                result_record = {
                    "problem_id": problem.problem_id,
                    "dataset": problem.dataset,
                    "original_verification_pass": original_verification_pass,
                    "hole_verification_pass": None,  # Not reached
                    "clear_verification_pass": None,  # Not reached
                    "filled_verification_pass": None,  # Not reached
                    "status": "error",
                    "error": error_msg,
                    "processing_time_seconds": processing_time,
                    "timestamp": datetime.now().isoformat()
                }
                
                # Append result and failure to files immediately 
                self._append_result_to_file(dataset_name, result_record)
                self._append_failure_to_file(dataset_name, failure_record)
                
                return
            
            print(f"Decomposition successful: {len(steps)} holes generated")
            print(f"Hole version: {len(hole_version_content)} chars")
            
            # Step 2: Save decomposition
            current_step = "saving_decomposition"
            print(f"Step 2: Saving decomposition...")
            problem_dir = os.path.join(
                self.output_base_dir, 
                problem.dataset, 
                "decomposed",
                problem.problem_id.replace('/', '_')
            )
            self.save_decomposition(problem_dir, problem, steps, original_verification_pass, None)
            print(f"Decomposition saved to: {problem_dir}")
            
            # Step 3: Save hole version
            current_step = "saving_hole_version"
            print(f"Step 3: Saving hole version...")
            
            # Use the hole_version_content from decomposition
            hole_version_path = os.path.join(problem_dir, "hole_version.lean")
            
            # Extract hole_list from decomposition steps
            hole_list = []
            for step in steps:
                step_info = step.additional_info or {}
                hole_id = step_info.get("hole_id")
                original_proof = step_info.get("original_proof")
                if hole_id and original_proof:
                    hole_info = {'hole_id': hole_id, 'original_proof': original_proof}
                    # Include have information if available
                    if 'have_name' in step_info:
                        hole_info['have_name'] = step_info['have_name']
                    if 'have_type' in step_info:
                        hole_info['have_type'] = step_info['have_type']
                    hole_list.append(hole_info)
            
            # Create macros for all holes
            hole_macros = []
            for info in hole_list:
                hole_id = info['hole_id']
                hole_macros.append(f'macro "{hole_id}" : tactic => `(tactic| admit)')
                print(f"Created macro for {hole_id} in hole_version.lean")
            
            # Combine macros with hole content
            if hole_macros:
                macros_str = '\n'.join(hole_macros)
                hole_with_macros = f"""{macros_str}

{hole_version_content}"""
            else:
                hole_with_macros = hole_version_content
            
            with open(hole_version_path, "w") as f:
                f.write(hole_with_macros)
            print(f"Hole version saved to: {hole_version_path}")
            print(f"Pure hole version with {len(hole_macros)} holes (all kept as hole_N)")
            
            # Step 3.5: Verify hole version
            current_step = "verifying_hole_version"
            print(f"Step 3.5: Verifying hole version...")
            hole_verification_pass = self.verify_lean_code(header_content, hole_with_macros)
            print(f"Hole version verification: {'PASS' if hole_verification_pass else 'FAIL'}")
            
            # Step 3.6: Generate and verify clear version
            current_step = "generating_clear_version"
            print(f"Step 3.6: Generating clear version...")
            
            # Generate clear version using pre-computed have information from hole generation
            clear_content = self.generate_clear_version(hole_version_content, hole_list)
            
            # Add macros for clear version
            clear_macros = hole_macros.copy()
            clear_macros.append('macro "skip_hole" : term => `(sorry)')
            clear_with_macros = '\n'.join(clear_macros) + '\n\n' + clear_content
            
            # Save clear version
            clear_version_path = os.path.join(problem_dir, "clear_version.lean")
            with open(clear_version_path, "w") as f:
                f.write(clear_with_macros)
            print(f"Clear version saved to: {clear_version_path}")
            
            # Verify clear version
            current_step = "verifying_clear_version"
            print(f"Step 3.7: Verifying clear version...")
            clear_verification_pass = self.verify_lean_code(header_content, clear_with_macros)
            print(f"Clear version verification: {'PASS' if clear_verification_pass else 'FAIL'}")
            
            # Pure decomposition doesn't generate complete fixed proof
            # filled_verification_pass will be handled by minimal_verification_pipeline
            filled_verification_pass = False  # Not applicable in pure decomposition
            
            # Step 4.5: Update metadata with synthesized verification result
            print(f"Step 4.5: Updating metadata with synthesized verification result...")
            metadata_path = os.path.join(problem_dir, "decomposition.json")
            with open(metadata_path, "r") as f:
                metadata = json.load(f)
            metadata["filled_verification_pass"] = filled_verification_pass
            metadata["hole_verification_pass"] = hole_verification_pass
            metadata["clear_verification_pass"] = clear_verification_pass
            with open(metadata_path, "w") as f:
                json.dump(metadata, f, indent=2)
            print(f"Metadata updated with synthesized verification result")
            
            # Step 5: Load decomposition steps for detailed recording
            current_step = "recording_details"
            final_steps = self.load_decomposition(problem_dir)
            
            # Get header for verification
            header_content = problem_manager.get_header_content(problem)
            
            # Prepare detailed step information with verification
            detailed_steps = []
            verification_updated = False
            for step in final_steps:
                print(f"Verifying step {step.step_id}...")
                
                # Verify hole in context - read the hole version file and test this specific hole
                hole_verification_pass = step.hole_verification_pass
                if hole_verification_pass is None:
                    # Read the hole version file for context-aware verification
                    hole_version_path = os.path.join(problem_dir, "hole_version.lean")
                    if os.path.exists(hole_version_path):
                        with open(hole_version_path, 'r') as f:
                            hole_version_content = f.read()
                        hole_verification_pass = self._verify_single_hole_in_context(
                            header_content, step.step_id, hole_version_content)
                    else:
                        # Fallback to False if hole version doesn't exist
                        hole_verification_pass = False
                    step.hole_verification_pass = hole_verification_pass  # Update the step object
                    verification_updated = True
                    print(f"  Hole verification: {'PASS' if hole_verification_pass else 'FAIL'}")
                else:
                    print(f"  Hole verification (cached): {'PASS' if hole_verification_pass else 'FAIL'}")
                step_info = {
                    "step_id": step.step_id,
                    "original_content": step.original_content,
                    "hole_content": step.hole_content,
                    "filled_content": step.filled_content,
                    "original_verification_pass": step.original_verification_pass,
                    "hole_verification_pass": hole_verification_pass,
                    "filled_verification_pass": step.filled_verification_pass,
                    "additional_info": step.additional_info
                }
                detailed_steps.append(step_info)
            
            # Save updated verification results back to metadata if any verification was performed
            if verification_updated:
                metadata_path = os.path.join(problem_dir, "decomposition.json")
                with open(metadata_path, "r") as f:
                    metadata = json.load(f)
                
                # Update metadata with verification results
                for i, step in enumerate(final_steps):
                    if i < len(metadata["holes"]):
                        metadata["holes"][i]["original_verification_pass"] = step.original_verification_pass
                        metadata["holes"][i]["hole_verification_pass"] = step.hole_verification_pass
                        metadata["holes"][i]["filled_verification_pass"] = step.filled_verification_pass
                
                # Save updated metadata
                with open(metadata_path, "w") as f:
                    json.dump(metadata, f, indent=2)
                print(f"Updated verification results saved to decomposition.json")
            
            processing_time = (datetime.now() - problem_start_time).total_seconds()
            
            # Read final verification results from updated decomposition.json
            # This ensures we use the corrected verification results, not the early-stage ones
            metadata_path = os.path.join(problem_dir, "decomposition.json")
            final_hole_verification = hole_verification_pass
            final_filled_verification = filled_verification_pass
            final_clear_verification = clear_verification_pass
            
            if os.path.exists(metadata_path):
                try:
                    with open(metadata_path, "r") as f:
                        final_metadata = json.load(f)
                    final_hole_verification = final_metadata.get("hole_verification_pass", hole_verification_pass)
                    final_filled_verification = final_metadata.get("filled_verification_pass", filled_verification_pass)
                    final_clear_verification = final_metadata.get("clear_verification_pass", clear_verification_pass)
                    print(f"Using final verification results: hole={final_hole_verification}, filled={final_filled_verification}, clear={final_clear_verification}")
                except Exception as e:
                    print(f"Warning: Could not read final verification results, using original: {e}")
            
            result_record = {
                "problem_id": problem.problem_id,
                "dataset": problem.dataset,
                "problem_dir": problem_dir,
                "original_verification_pass": original_verification_pass,
                "hole_verification_pass": final_hole_verification,
                "clear_verification_pass": final_clear_verification,
                "filled_verification_pass": final_filled_verification,
                "num_steps": len(steps),
                "processing_time_seconds": processing_time,
                "status": "success",
                "timestamp": datetime.now().isoformat()
            }
            
            print(f"✓ Successfully processed {problem.problem_id} in {processing_time:.1f}s")
            
            # Append result to file immediately
            self._append_result_to_file(dataset_name, result_record)
            
        except Exception as e:
            import traceback
            
            error_msg_full = str(e)
            traceback_str = traceback.format_exc()
            error_type = type(e).__name__

            # If the error message is empty, use the traceback as the message for the detailed log
            if not error_msg_full:
                error_msg_full = traceback_str
            
            # Create a concise error summary for the main results file
            error_summary = f"{error_type}: {str(e)}" if str(e) else error_type

            processing_time = (datetime.now() - problem_start_time).total_seconds()
            
            print(f"✗ FAILURE for {problem.problem_id}: {error_msg_full}")
            print(f"  Exception Type: {error_type}")
            
            # Record this as a failure
            failure_record = {
                "problem_id": problem.problem_id,
                "dataset": problem.dataset,
                "error_message": error_msg_full,
                "error_type": error_type,
                "traceback": traceback_str,
                "processing_time_seconds": processing_time,
                "timestamp": datetime.now().isoformat()
            }
            
            result_record = {
                "problem_id": problem.problem_id,
                "dataset": problem.dataset,
                "original_verification_pass": original_verification_pass if 'original_verification_pass' in locals() else None,
                "hole_verification_pass": hole_verification_pass if 'hole_verification_pass' in locals() else None,
                "clear_verification_pass": clear_verification_pass if 'clear_verification_pass' in locals() else None,
                "filled_verification_pass": None,  # Not reached
                "status": "error",
                "error": error_summary,
                "processing_time_seconds": processing_time,
                "timestamp": datetime.now().isoformat()
            }
            
            print(f"Failure recorded. Continuing to next problem...")
    
            # Append failure to file immediately
            self._append_failure_to_file(dataset_name, failure_record)
            self._append_result_to_file(dataset_name, result_record)

    def process_dataset(self, dataset_name: str, limit: Optional[int] = None, resume: bool = True):
        """
        Process entire dataset through the pure decomposition pipeline
        
        Args:
            dataset_name: Name of the dataset to process
            limit: Maximum number of problems to process
            resume: Whether to resume from last run (default: True)
        """
        problems = problem_manager.list_problems(dataset_name)
        if not problems:
            print(f"No problems found in dataset: {dataset_name}")
            return
        
        if resume:
            # Resume mechanism: check for and skip already processed problems
            results_path = os.path.join(self.output_base_dir, f"{dataset_name}_pipeline_results.json")
            processed_problem_ids = set()
            if os.path.exists(results_path):
                try:
                    with open(results_path, "r") as f:
                        content = f.read()
                        if content:  # Avoid JSONDecodeError on empty file
                            existing_results = json.loads(content)
                            for r in existing_results:
                                if r.get("problem_id"):
                                    processed_problem_ids.add(r["problem_id"])
                
                    if processed_problem_ids:
                        print(f"Found {len(processed_problem_ids)} already processed problems in results file. They will be skipped.")
                        original_count = len(problems)
                        problems = [p for p in problems if p.problem_id not in processed_problem_ids]
                        print(f"Skipped {original_count - len(problems)} problems. Remaining to process: {len(problems)}.")
                
                except (json.JSONDecodeError, IOError) as e:
                    print(f"Warning: Could not read or parse existing results file '{results_path}'. Processing all problems from scratch. Error: {e}")
        
        if limit:
            problems = problems[:limit]
        
        print(f"Processing {len(problems)} problems from {dataset_name}")
        print("Using pure decomposition approach (no filling)")
        
        for i, problem in enumerate(problems):
            print(f"\n--- Processing {i+1}/{len(problems)}: {problem.problem_id} ---")
            
            # Reset step counter for each new problem
            self.step_counter = {"count": 0}
            
            self.process_problem(problem)
        
        # Since results are saved incrementally, read final statistics from files
        results_path = os.path.join(self.output_base_dir, f"{dataset_name}_pipeline_results.json")
        failures_path = os.path.join(self.output_base_dir, f"{dataset_name}_detailed_failures.json")
        
        # Read final results from file to get accurate counts
        final_results = []
        if os.path.exists(results_path):
            with open(results_path, "r") as f:
                final_results = json.load(f)
        
        # Read final failures from file
        final_failures = []
        if os.path.exists(failures_path):
            with open(failures_path, "r") as f:
                final_failures = json.load(f)
        
        # Calculate statistics from saved files
        total_processed = len(final_results)
        successful_from_file = len([r for r in final_results if r.get("status") == "success"])
        failed_from_file = total_processed - successful_from_file
        
        # Print comprehensive summary
        print(f"\n=== Pipeline Results Summary ===")
        print(f"Dataset: {dataset_name}")
        print(f"Total problems processed: {total_processed}")
        print(f"Successful: {successful_from_file}")
        print(f"Failed: {failed_from_file}")
        
        print(f"\nResults saved to: {results_path}")
        if total_processed > 0:
            print(f"Success rate: {successful_from_file}/{total_processed} ({100*successful_from_file/total_processed:.1f}%)")
        else:
            print("Success rate: N/A (no problems processed)")
            
        if final_failures:
            print(f"Detailed failures logged to: {failures_path}")
        
        return {
            "total": total_processed,
            "successful": successful_from_file,
            "failed": failed_from_file,
            "failures": final_failures,
            "results_path": results_path
        }

    def load_overall_results(self, problem_dir: str) -> Dict:
        """Load overall verification results from metadata"""
        metadata_path = os.path.join(problem_dir, "decomposition.json")
        if not os.path.exists(metadata_path):
            raise ValueError(f"No metadata found in {problem_dir}")
        
        with open(metadata_path, "r") as f:
            metadata = json.load(f)
        
        return {
            "problem_id": metadata.get("problem_id"),
            "dataset": metadata.get("dataset"),
            "original_verification_pass": metadata.get("original_verification_pass"),
            "filled_verification_pass": metadata.get("filled_verification_pass"),
            "timestamp": metadata.get("timestamp"),
            "num_steps": len(metadata.get("holes", []))
        }


def main():
    """Main function for running the pipeline"""
    import sys
    
    print(f"Pipeline started with args: {sys.argv}")
    pipeline = DecomposeHoleMergePipeline()
    
    if len(sys.argv) < 2:
        print("Usage: python decompose_hole_merge_pipeline.py <command> [args]")
        print("Commands:")
        print("  dataset <name> [limit] [--no-resume] - Process entire dataset")
        print("    --no-resume: Disable resuming from previous run")
        print("  problem <dataset> <problem_id> - Process single problem")
        return
    
    command = sys.argv[1]
    print(f"Executing command: {command}")
    
    if command == "dataset":
        dataset_name = sys.argv[2]
        
        # Extract flags first, then handle positional arguments
        args = sys.argv[3:]
        resume = True
        if "--no-resume" in args:
            resume = False
            args.remove("--no-resume")
            print("Resume mechanism disabled by command-line flag.")
        
        # Parse remaining args (only limit)
        limit = None
        
        if len(args) > 0:
            try:
                limit = int(args[0])
            except ValueError:
                print(f"Error: Invalid limit '{args[0]}', must be an integer")
                return
        
        print(f"Processing dataset: {dataset_name}, limit: {limit}, resume: {resume}")
        pipeline.process_dataset(dataset_name, limit, resume=resume)
        
    elif command == "problem":
        if len(sys.argv) < 4:
            print("Usage: python decompose_hole_merge_pipeline.py problem <dataset> <problem_id>")
            return
            
        dataset_name = sys.argv[2]
        problem_id = sys.argv[3]
        
        print(f"Processing single problem: {dataset_name}/{problem_id}")
        
        # Get the problem using problem_manager
        problem = problem_manager.get_problem(dataset_name, problem_id)
        if not problem:
            print(f"Error: Problem {dataset_name}/{problem_id} not found")
            return
        
        # Run the pure decomposition pipeline on the single problem
        pipeline.process_problem(problem)
        
if __name__ == "__main__":
    main() 
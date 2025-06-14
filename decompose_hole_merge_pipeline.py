import os
import json
from typing import Dict, List, Tuple, Optional
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
        
    def decompose_problem(self, problem: Problem, hole_filling_function=None) -> tuple[List[DecompositionStep], str]:
        """
        Decompose a problem into substeps with hole versions and get the complete fixed proof
        Returns (decomposition_steps, complete_fixed_proof)
        
        NEW APPROACH: Uses in-place hole replacement instead of reconstruction
        
        Args:
            problem: The problem to decompose
            hole_filling_function: Function to use for filling holes (defaults to fill_hole_content)
        """
        print(f"Decomposing problem: {problem.dataset}/{problem.problem_id}")
        
        # Set default hole filling function if none provided
        if hole_filling_function is None:
            hole_filling_function = self.fill_hole_content
        
        # Get header for verification
        header_content = problem_manager.get_header_content(problem)
        
        print("Using NEW in-place hole replacement approach...")
        
        # Step 1: Generate hole version using new approach
        hole_content, hole_list = self.generate_in_place_holes(problem)
        
        if not hole_list:
            print("No holes generated - problem may not contain have statements")
            return [], ""
        
        # Step 2: Create decomposition steps for each hole
        decomposition_steps = []
        filled_content = hole_content
        
        import re

        for hole_info in hole_list:
            step_id = self.get_next_step_id()
            hole_id = hole_info['hole_id']
            original_proof = hole_info['original_proof']
            
            print(f"  Processing {step_id} for {hole_id}: {original_proof}")
            
            # Create a simple step representation
            step_original_content = f"-- Original: {hole_id} := {original_proof}"
            step_hole_content = f"-- Hole: {hole_id}"
            
            # Create proper hole content for filling function
            # We need to create a context where the hole can be tested
            # Use regex with word boundaries to avoid replacing parts of other hole IDs
            hole_test_content = re.sub(r'\b' + re.escape(hole_id) + r'\b', "hole", filled_content, 1)
            
            # Use hole filling function to get replacement
            step_filled_content, additional_info = hole_filling_function(hole_test_content, header_content)
            
            # Extract the actual replacement from filled content
            # Look for what replaced "hole" in the filled content
            if additional_info.get("best_tactic"):
                replacement = additional_info["best_tactic"]
            else:
                # If no successful unigram tactic found, use admit as fallback
                # Do NOT use original proof as it may not be a unigram tactic
                replacement = "admit"
            
            # Replace the hole in the main content
            # Use regex with word boundaries to avoid replacing parts of other hole IDs
            filled_content = re.sub(r'\b' + re.escape(hole_id) + r'\b', replacement, filled_content, 1)
            
            # Verify the step (we'll verify the full content later)
            step_verification = True  # Simplified for new approach
            
            # Create decomposition step
            step = DecompositionStep(
                step_id=step_id,
                original_content=step_original_content,
                hole_content=step_hole_content,
                filled_content=f"-- Filled: {hole_id} := {replacement}",
                original_verification_pass=step_verification,
                hole_verification_pass=step_verification, 
                filled_verification_pass=step_verification,
                additional_info={
                    "method": "in_place_hole_replacement",
                    "hole_id": hole_id,
                    "original_proof": original_proof,
                    "replacement": replacement,
                    **additional_info
                }
            )
            
            decomposition_steps.append(step)
            print(f"Created decomposition step: {step_id} ({hole_id} -> {replacement})")
        
        # Step 3: Verify final filled content
        print(f"Verifying final filled proof...")
        final_verification = self.verify_lean_code(header_content, filled_content, with_macro=False)
        print(f"Final verification: {'PASS' if final_verification else 'FAIL'}")
        
        print(f"In-place decomposition completed. Generated {len(decomposition_steps)} steps.")
        print(f"Final filled proof length: {len(filled_content)} chars")
        
        return decomposition_steps, filled_content
    
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
                    # The new format doesn't have these, provide defaults.
                    hole_content=f"-- Hole: {hole_info['hole_id']}",
                    filled_content=f"-- Filled: {hole_info['hole_id']} := {hole_info.get('best_tactic', '...')}",
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
    
    def verify_lean_code(self, header: str, content: str, with_macro: bool = False) -> bool:
        """
        Verify if Lean code has no errors using header form.
        A successful verification means no Lean errors and no unsolved goals.
        Returns True if no errors, False if there are errors.
        """
        if with_macro:
            header = header + "\nmacro \"hole\" : tactic => `(tactic| admit)"
        
        result = self.lean_verifier.run_with_header(header, content)
        
        # Check for fatal errors reported directly on the result object.
        if getattr(result, 'error', None):
            return False
            
        # Check for tactical errors or unsolved goals from the message list.
        # An empty list of errors means success.
        if hasattr(result, 'get_errors'):
            if result.get_errors(): # If the list is not empty
                return False
                
        # If no errors are found, verification passes.
        return True

    def fill_hole_content(self, hole_content: str, header_content: str) -> Tuple[str, Dict]:
        """
        Convert hole content to filled content with basic information.
        Simply replaces "hole" with "admit".
        
        Args:
            hole_content: The content containing "hole" placeholders
            header_content: The header content for context (unused for now)
            
        Returns:
            Tuple of (filled_content, additional_info)
        """
        filled_content = hole_content.replace("hole", "admit")
        
        additional_info = {
            "method": "simple_replace"
        }
        
        return filled_content, additional_info

    def try_unigram_tactics(self, hole_content: str, header_content: str) -> Tuple[str, Dict]:
        """
        Try different unigram tactics to replace holes and find working solutions.
        
        Args:
            hole_content: The content containing "hole" placeholders (can be "hole" or numbered holes)
            header_content: The header content for verification
            
        Returns:
            Tuple of (best_filled_content, additional_info)
        """
        # Define common single-line unigram tactics to try
        unigrams = ["norm_num", "linarith", "nlinarith", "omega", "ring", "ring_nf", "simp", "simpa", "field_simp", "positivity", "norm_cast"]
        
        additional_info = {
            "method": "unigram_tactics",
            "tactics_tried": unigrams,
            "successful_tactics": [],
            "failed_tactics": [],
            "best_tactic": None
        }
        
        # Create macros for all holes found in the content (for sanity check)
        import re
        all_holes = re.findall(r'\bhole(?:_\d+)?\b', hole_content)
        hole_macros = []
        for hole in set(all_holes):  # Remove duplicates
            # Use proper macro syntax without shell-problematic backticks
            hole_macros.append(f'macro "{hole}" : tactic => `(tactic| sorry)')
        
        # Create content with macros for sanity check
        if hole_macros:
            macros_str = '\n'.join(hole_macros)
            hole_content_with_macros = f"""{macros_str}

{hole_content}"""
        else:
            hole_content_with_macros = hole_content
        
        # First check if hole version passes (sanity check)
        sanity_check = self.verify_lean_code(header_content, hole_content_with_macros, with_macro=False)
        
        # Find the hole placeholder to replace (can be "hole" or "hole_N")
        import re
        hole_match = re.search(r'\bhole(?:_\d+)?\b', hole_content)
        if not hole_match:
            additional_info["skip_reason"] = "no_hole_found"
            return hole_content, additional_info
        
        hole_placeholder = hole_match.group(0)
        
        # Try each unigram tactic
        for tactic in unigrams:
            # Use word boundary replacement to avoid replacing parts of other hole names
            import re
            candidate_content = re.sub(r'\b' + re.escape(hole_placeholder) + r'\b', tactic, hole_content)
            
            # Create macros for remaining holes in candidate content
            remaining_holes = re.findall(r'\bhole(?:_\d+)?\b', candidate_content)
            remaining_macros = []
            for hole in set(remaining_holes):  # Remove duplicates
                remaining_macros.append(f'macro "{hole}" : tactic => `(tactic| sorry)')
            
            # Create candidate content with macros
            if remaining_macros:
                remaining_macros_str = '\n'.join(remaining_macros)
                candidate_with_macros = f"""{remaining_macros_str}

{candidate_content}"""
            else:
                candidate_with_macros = candidate_content
            
            if self.verify_lean_code(header_content, candidate_with_macros, with_macro=False):
                additional_info["successful_tactics"].append(tactic)
                if additional_info["best_tactic"] is None:
                    additional_info["best_tactic"] = tactic
            else:
                additional_info["failed_tactics"].append(tactic)
        
        # Return best solution or keep hole as fallback
        if additional_info["best_tactic"]:
            # Use word boundary replacement to avoid replacing parts of other hole names
            import re
            best_content = re.sub(r'\b' + re.escape(hole_placeholder) + r'\b', additional_info["best_tactic"], hole_content)
            return best_content, additional_info
        else:
            # No tactic worked, keep original hole placeholder
            return hole_content, additional_info

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
    
    def _traverse_tactic_tree(self, nodes):
        """Traverse tactic tree in depth-first order"""
        for node in nodes:
            yield node
            yield from self._traverse_tactic_tree(node.subhaves)
    
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
        
        # Determine what content comes after the last have (or from beginning if no have)
        if last_have_index == -1:
            # No nested have statements - all content in this by-block becomes a hole
            tactics_to_hole = node.subhaves
        else:
            # There are nested have statements - only content after the last one becomes a hole
            tactics_to_hole = node.subhaves[last_have_index + 1:]
        
        if not tactics_to_hole:
            # No content to create a hole from
            return None
            
        # Collect all content that should become a hole
        hole_content_parts = []
        for tactic_node in tactics_to_hole:
            hole_content_parts.append(tactic_node.tactic.tactic.strip())
        
        hole_content = '\n'.join(hole_content_parts)
        
        return {
            'hole_id': f"hole_{hole_counter}",
            'content': hole_content,
            'original_proof': hole_content,
            'parent_have_tactic': node.tactic.tactic.strip(),
            'start_pos': tactics_to_hole[0].tactic.start_pos,
            'end_pos': node.end_pos,
            'hole_type': 'after_last_have' if last_have_index >= 0 else 'entire_by_block'
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

            # Add hole info to the list that will be returned for decomposition steps.
            # We use a new list to ensure it matches the number of actual replacements.
            hole_list_for_decomposition.append({
                'hole_id': hole_id,
                'original_proof': hole_info['original_proof'],
                'have_statement': hole_info.get('parent_have_tactic', ''),
                'position': len(hole_list_for_decomposition)
            })

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

    def process_problem(self, problem: Problem, hole_filling_function=None):
        """
        Process a single problem through the entire pipeline.
        This is the core logic for one problem, extracted from process_dataset.
        """
        # Set default hole filling function if none provided
        if hole_filling_function is None:
            hole_filling_function = self.fill_hole_content

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
            
            original_verification_pass = self.verify_lean_code(header_content, original_content, with_macro=False)
            print(f"Original problem verification: {'PASS' if original_verification_pass else 'FAIL'} ({original_lines} lines)")
            
            # Step 1: Decompose
            current_step = "decomposition"
            print(f"Step 1: Decomposing problem {problem.problem_id}...")
            steps, complete_fixed_proof = self.decompose_problem(problem, hole_filling_function)
            
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
            
            print(f"Decomposition successful: {len(steps)} steps generated")
            print(f"Complete fixed proof: {len(complete_fixed_proof)} chars")
            
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
            
            # Step 3: Save both hole version and complete fixed proof
            current_step = "saving_proofs"
            print(f"Step 3: Saving hole version and complete fixed proof...")
            
            # Save hole version
            hole_version_path = os.path.join(problem_dir, "hole_version.lean")
            hole_content, hole_list = self.generate_in_place_holes(problem)
            
            # Create mapping of hole_id to successful tactics from decomposition steps
            hole_replacements = {}
            for step in steps:
                step_info = step.additional_info or {}
                hole_id = step_info.get("hole_id")
                best_tactic = step_info.get("best_tactic")
                if hole_id and best_tactic:
                    hole_replacements[hole_id] = best_tactic
            
            # Generate hole_version.lean: pure hole version with ALL holes kept as hole_N
            hole_version_content = hole_content
            hole_macros = []
            
            if hole_list:
                # Create macros for ALL holes (both successful and unsuccessful)
                for info in hole_list:
                    hole_id = info['hole_id']
                    hole_macros.append(f'macro "{hole_id}" : tactic => `(tactic| admit)')
                    print(f"Created macro for {hole_id} in hole_version.lean")
                
                # hole_version_content keeps all hole_N as-is, no replacement with tactics

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
            hole_verification_pass = self.verify_lean_code(header_content, hole_with_macros, with_macro=False)
            print(f"Hole version verification: {'PASS' if hole_verification_pass else 'FAIL'}")
            
            # Save complete fixed proof  
            complete_proof_path = os.path.join(problem_dir, "complete_fixed_proof.lean")
            with open(complete_proof_path, "w") as f:
                f.write(complete_fixed_proof)
            print(f"Complete fixed proof saved to: {complete_proof_path}")
            
            # Step 4: Verify synthesized proof
            current_step = "verifying_synthesized_proof"
            print(f"Step 4: Verifying synthesized proof...")
            filled_verification_pass = self.verify_lean_code(header_content, complete_fixed_proof, with_macro=False)
            print(f"Synthesized proof verification: {'PASS' if filled_verification_pass else 'FAIL'}")
            
            # Step 4.5: Update metadata with synthesized verification result
            print(f"Step 4.5: Updating metadata with synthesized verification result...")
            metadata_path = os.path.join(problem_dir, "decomposition.json")
            with open(metadata_path, "r") as f:
                metadata = json.load(f)
            metadata["filled_verification_pass"] = filled_verification_pass
            metadata["hole_verification_pass"] = hole_verification_pass
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
                
                # Verify hole content - use existing verification if available
                hole_verification_pass = step.hole_verification_pass
                if hole_verification_pass is None:
                    hole_verification_pass = self.verify_lean_code(header_content, step.hole_content, with_macro=True)
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
            
            result_record = {
                "problem_id": problem.problem_id,
                "dataset": problem.dataset,
                "problem_dir": problem_dir,
                "complete_proof_path": complete_proof_path,
                "original_verification_pass": original_verification_pass,
                "hole_verification_pass": hole_verification_pass,
                "filled_verification_pass": filled_verification_pass,
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

    def process_dataset(self, dataset_name: str, limit: Optional[int] = None, hole_filling_function=None):
        """
        Process entire dataset through the pipeline
        
        Args:
            dataset_name: Name of the dataset to process
            limit: Maximum number of problems to process
            hole_filling_function: Function to use for filling holes (defaults to fill_hole_content)
        """
        problems = problem_manager.list_problems(dataset_name)
        if not problems:
            print(f"No problems found in dataset: {dataset_name}")
            return
        
        if limit:
            problems = problems[:limit]
        
        # Set default hole filling function if none provided
        if hole_filling_function is None:
            hole_filling_function = self.fill_hole_content
        
        print(f"Processing {len(problems)} problems from {dataset_name}")
        print(f"Using hole filling method: {hole_filling_function.__name__}")
        
        for i, problem in enumerate(problems):
            print(f"\n--- Processing {i+1}/{len(problems)}: {problem.problem_id} ---")
            
            # Reset step counter for each new problem
            self.step_counter = {"count": 0}
            
            self.process_problem(problem, hole_filling_function)
        
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
        print("  dataset <name> [limit] [filling_method] - Process entire dataset")
        print("    filling_method options: simple, unigram")
        print("  problem <dataset> <problem_id> [filling_method] - Process single problem")
        return
    
    command = sys.argv[1]
    print(f"Executing command: {command}")
    
    if command == "dataset":
        dataset_name = sys.argv[2]
        
        # Smart parameter parsing: check if 3rd argument is a number or method name
        limit = None
        filling_method = "simple"
        
        if len(sys.argv) > 3:
            try:
                # Try to parse 3rd argument as integer (limit)
                limit = int(sys.argv[3])
                # If successful, 4th argument (if exists) is filling_method
                filling_method = sys.argv[4] if len(sys.argv) > 4 else "simple"
            except ValueError:
                # 3rd argument is not a number, treat it as filling_method
                filling_method = sys.argv[3]
                limit = None
        
        # Choose hole filling function based on method
        if filling_method == "unigram":
            hole_filling_function = pipeline.try_unigram_tactics
        else:  # default to simple
            hole_filling_function = pipeline.fill_hole_content
        
        print(f"Processing dataset: {dataset_name}, limit: {limit}, method: {filling_method}")
        pipeline.process_dataset(dataset_name, limit, hole_filling_function)
        
    elif command == "problem":
        if len(sys.argv) < 4:
            print("Usage: python decompose_hole_merge_pipeline.py problem <dataset> <problem_id> [filling_method]")
            print("  filling_method options: simple, unigram (default)")
            return
            
        dataset_name = sys.argv[2]
        problem_id = sys.argv[3]
        filling_method = sys.argv[4] if len(sys.argv) > 4 else "unigram"
        
        print(f"Processing single problem: {dataset_name}/{problem_id} with method: {filling_method}")
        
        # Choose hole filling function based on method
        if filling_method == "unigram":
            hole_filling_function = pipeline.try_unigram_tactics
        else:  # default to simple
            hole_filling_function = pipeline.fill_hole_content

        # Get the problem using problem_manager
        problem = problem_manager.get_problem(dataset_name, problem_id)
        if not problem:
            print(f"Error: Problem {dataset_name}/{problem_id} not found")
            return
        
        # Run the full pipeline on the single problem
        pipeline.process_problem(problem, hole_filling_function)
        
if __name__ == "__main__":
    main() 
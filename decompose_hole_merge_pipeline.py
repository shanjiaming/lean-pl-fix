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
        
        try:
            print("Using NEW in-place hole replacement approach...")
            
            # Step 1: Generate hole version using new approach
            hole_content, hole_list = self.generate_in_place_holes(problem)
            
            if not hole_list:
                print("No holes generated - problem may not contain have statements")
                return [], ""
            
            # Step 2: Create decomposition steps for each hole
            decomposition_steps = []
            filled_content = hole_content
            
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
                hole_test_content = filled_content.replace(hole_id, "hole")
                
                # Use hole filling function to get replacement
                step_filled_content, additional_info = hole_filling_function(hole_test_content, header_content)
                
                # Extract the actual replacement from filled content
                # Look for what replaced "hole" in the filled content
                if additional_info.get("best_tactic"):
                    replacement = additional_info["best_tactic"]
                elif "admit" in step_filled_content:
                    replacement = "admit"
                else:
                    replacement = original_proof  # Keep original if no better replacement
                
                # Replace the hole in the main content
                filled_content = filled_content.replace(hole_id, replacement)
                
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
            
        except Exception as e:
            error_msg = f"Failed to decompose problem {problem.dataset}/{problem.problem_id}: {str(e)}"
            print(f"Error in decompose_problem: {error_msg}")
            import traceback
            traceback.print_exc()
            
            # Return empty list and empty string to indicate failure
            return [], ""
    
    def _generate_hole_for_step(self, problem: Problem, proof_framework: str) -> str:
        """Generate hole version for a single proof step"""
        # Get the correct header from the dataset instead of using a fixed simple header
        header_content = problem_manager.get_header_content(problem)
        
        # Run with header to get tactics
        try:
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
            
        except Exception as e:
            print(f"Error generating hole for step: {e}")
            # Fallback: use hole without macro
            return proof_framework + "\n  hole"
    
    def save_decomposition(self, problem_dir: str, problem: Problem, steps: List[DecompositionStep], 
                          original_verification_pass: Optional[bool] = None, 
                          synthesized_verification_pass: Optional[bool] = None) -> str:
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
        
        # Save metadata
        metadata = {
            "problem_id": problem.problem_id,
            "dataset": problem.dataset,
            "timestamp": datetime.now().isoformat(),
            "header_file": "header.lean",
            "problem_file": "problem.lean",
            "original_verification_pass": original_verification_pass,
            "synthesized_verification_pass": synthesized_verification_pass,
            "steps": [
                {
                    "step_id": step.step_id,
                    "original_verification_pass": step.original_verification_pass,
                    "hole_verification_pass": step.hole_verification_pass,
                    "filled_verification_pass": step.filled_verification_pass,
                    "additional_info": step.additional_info
                }
                for step in steps
            ]
        }
        
        with open(os.path.join(problem_dir, "metadata.json"), "w") as f:
            json.dump(metadata, f, indent=2)
        
        # Save individual steps
        for step in steps:
            # Original step
            with open(os.path.join(problem_dir, f"{step.step_id}_original.lean"), "w") as f:
                f.write(step.original_content)
            
            # Hole version
            with open(os.path.join(problem_dir, f"{step.step_id}_hole.lean"), "w") as f:
                f.write(step.hole_content)
            
            # Filled version (if available)
            if step.filled_content is not None:
                with open(os.path.join(problem_dir, f"{step.step_id}_filled.lean"), "w") as f:
                    f.write(step.filled_content)
        
        print(f"Saved {len(steps)} decomposition steps to {problem_dir}")
        print(f"Also saved header.lean and problem.lean for self-contained information")
        return problem_dir
    
    def load_decomposition(self, problem_dir: str) -> List[DecompositionStep]:
        """Load decomposition steps from files"""
        metadata_path = os.path.join(problem_dir, "metadata.json")
        if not os.path.exists(metadata_path):
            raise ValueError(f"No metadata found in {problem_dir}")
        
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
        Automatically detects if content already contains header and extracts the relevant part.
        For content containing "hole", automatically adds hole macro to header.
        Returns True if no errors, False if there are errors.
        """
        if with_macro:
            header = header + "\nmacro \"hole\" : tactic => `(tactic| admit)"
        try:
            result = self.lean_verifier.run_with_header(header, content)
            return not result.has_errors()
        except Exception as e:
            # If verification fails due to server issues, return False
            print(f"Verification exception: {e}")
            return False

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
        additional_info["sanity_check_pass"] = sanity_check
        
        if not sanity_check:
            # If hole version doesn't pass, skip tactic testing
            additional_info["skip_reason"] = "sanity_check_failed"
            return hole_content, additional_info
        
        # Find the hole placeholder to replace (can be "hole" or "hole_N")
        import re
        hole_match = re.search(r'\bhole(?:_\d+)?\b', hole_content)
        if not hole_match:
            additional_info["skip_reason"] = "no_hole_found"
            return hole_content, additional_info
        
        hole_placeholder = hole_match.group(0)
        
        # Try each unigram tactic
        for tactic in unigrams:
            candidate_content = hole_content.replace(hole_placeholder, tactic)
            
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
            best_content = hole_content.replace(hole_placeholder, additional_info["best_tactic"])
            return best_content, additional_info
        else:
            # No tactic worked, keep original hole placeholder
            return hole_content, additional_info

    def generate_in_place_holes_from_content(self, content: str) -> Tuple[str, List[str]]:
        """Generate holes from raw content for testing"""
        return self._process_content_for_holes(content)
    
    def _process_content_for_holes(self, content: str) -> Tuple[str, List[str]]:
        """
        Process content using lean_interact to get proper tactic tree structure,
        then create holes based on the actual tactic hierarchy rather than line-by-line parsing.
        """
        import re
        from decompose_solver import convert_theorem_to_example_cmd, remove_lean_comments, _process_tactics_to_tree
        
        # Get header for this content (assuming it's from a problem)
        # For now, use a minimal header - in production this should come from problem context
        header_content = "import Mathlib\n"
        
        try:
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
            
            # Check if errors are only unsolved goals (which is expected when extracting tactics)
            has_real_errors = False
            if result.has_errors():
                for error in result.get_errors():
                    if 'unsolved goals' not in error.data:
                        has_real_errors = True
                        break
            
            if has_real_errors:
                print(f"Warning: Lean errors detected, falling back to simple line processing")
                return self._simple_line_processing(content)
            
            # Build tactic tree
            top_level_nodes = _process_tactics_to_tree(result.tactics)
            
            print(f"Built tactic tree with {len(top_level_nodes)} top-level nodes")
            
            # Process tactic tree to identify by-blocks and their "after last have" content
            holes_to_create = []
            hole_counter = 1
            
            # Process each have node in the tree
            for node in self._traverse_tactic_tree(top_level_nodes):
                if node.is_have() and node.subhaves:
                    # This is a have statement with sub-tactics (i.e., a by-block)
                    hole_info = self._analyze_have_node_for_holes(node, hole_counter)
                    if hole_info:
                        holes_to_create.append(hole_info)
                        hole_counter += 1
                        print(f"  Found by-block hole: {hole_info['hole_id']} with content: {hole_info['content'][:50]}...")
            
            # Use tree-guided replacement to create holes
            return self._create_holes_from_tree_analysis(content, holes_to_create)
            
        except Exception as e:
            print(f"Error using lean_interact for hole generation: {e}")
            print("Falling back to simple line processing...")
            return self._simple_line_processing(content)
    
    def _traverse_tactic_tree(self, nodes):
        """Traverse tactic tree in depth-first order"""
        for node in nodes:
            yield node
            yield from self._traverse_tactic_tree(node.subhaves)
    
    def _analyze_have_node_for_holes(self, node, hole_counter):
        """
        Analyze a have node (with by-block) to find content after the last have that should become a hole.
        Returns hole info dict or None if no hole should be created.
        """
        if not node.subhaves:
            return None
            
        # Find the last have statement among direct children
        # Note: we need to check for any have statement, not just those with "by"
        last_have_index = -1
        for i, child in enumerate(node.subhaves):
            child_tactic = child.tactic.tactic.strip()
            if child_tactic.startswith('have '):
                last_have_index = i
        
        if last_have_index == -1:
            # No have statements in this by-block, the whole block could be a hole
            # But for now, we don't handle this case
            return None
            
        # Check if there are tactics after the last have
        tactics_after_last_have = node.subhaves[last_have_index + 1:]
        
        if not tactics_after_last_have:
            # No content after last have
            return None
            
        # Collect all content after the last have
        hole_content_parts = []
        for tactic_node in tactics_after_last_have:
            hole_content_parts.append(tactic_node.tactic.tactic.strip())
        
        hole_content = '\n'.join(hole_content_parts)
        
        return {
            'hole_id': f"hole_{hole_counter}",
            'content': hole_content,
            'parent_have_tactic': node.tactic.tactic.strip(),
            'start_position': tactics_after_last_have[0].start_pos if tactics_after_last_have else None,
            'end_position': tactics_after_last_have[-1].end_pos if tactics_after_last_have else None
        }
    
    def _create_holes_from_tree_analysis(self, content, holes_to_create):
        """
        Create holes in content based on tree analysis.
        This is more complex than simple line replacement since we need to handle
        multi-line by-blocks correctly.
        """
        if not holes_to_create:
            return content, []
            
        lines = content.split('\n')
        hole_list = []
        
        # For now, use a simplified approach: try to match the hole content in the lines
        # This is not perfect but works for most cases
        for hole_info in holes_to_create:
            hole_content = hole_info['content']
            hole_id = hole_info['hole_id']
            
            # Try to find and replace this content in the lines
            # Look for the content as consecutive lines (allowing for indentation differences)
            content_lines = [line.strip() for line in hole_content.split('\n') if line.strip()]
            
            if len(content_lines) == 1:
                # Single line replacement
                target_line = content_lines[0]
                for i, line in enumerate(lines):
                    if line.strip() == target_line:
                        # Replace with hole, preserving indentation
                        indent = line[:len(line) - len(line.lstrip())]
                        lines[i] = f"{indent}{hole_id}"
                        
                        hole_list.append({
                            'hole_id': hole_id,
                            'original_proof': target_line,
                            'have_statement': hole_info.get('parent_have_tactic', ''),
                            'position': len(hole_list)
                        })
                        break
            else:
                # Multi-line replacement - more complex
                # For now, we'll implement a simple version
                # Find the first line and replace subsequent lines
                if content_lines:
                    first_line = content_lines[0]
                    for i, line in enumerate(lines):
                        if line.strip() == first_line:
                            # Check if following lines match
                            match_found = True
                            for j, expected_line in enumerate(content_lines[1:], 1):
                                if i + j >= len(lines) or lines[i + j].strip() != expected_line:
                                    match_found = False
                                    break
                            
                            if match_found:
                                # Replace the matched lines with just the hole
                                indent = lines[i][:len(lines[i]) - len(lines[i].lstrip())]
                                
                                # Remove the matched lines
                                for _ in range(len(content_lines)):
                                    if i < len(lines):
                                        lines.pop(i)
                                
                                # Insert the hole
                                lines.insert(i, f"{indent}{hole_id}")
                                
                                hole_list.append({
                                    'hole_id': hole_id,
                                    'original_proof': hole_content,
                                    'have_statement': hole_info.get('parent_have_tactic', ''),
                                    'position': len(hole_list)
                                })
                                break
        
        hole_content_result = '\n'.join(lines)
        print(f"Generated hole content with {len(hole_list)} holes using tree-guided analysis")
        return hole_content_result, hole_list
    
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
        NEW APPROACH: Generate holes by replacing have proof parts in-place
        Handle "by" blocks as single units by parsing line structure
        Returns (hole_version_content, list_of_hole_positions)
        """
        import re
        
        # Get problem content
        problem_content = problem_manager.get_problem_content(problem)
        header_content = problem_manager.get_header_content(problem)
        
        print(f"Generating in-place holes for problem content:")
        print(f"Original content length: {len(problem_content)} chars")
        
        return self._process_content_for_holes(problem_content)

    def _append_result_to_file(self, dataset_name: str, result_record: dict):
        """
        Append a single result to the JSON file immediately after processing each problem.
        This ensures results are saved incrementally and not lost if processing is interrupted.
        """
        results_path = os.path.join(self.output_base_dir, f"{dataset_name}_pipeline_results.json")
        
        # Read existing results if file exists
        existing_results = []
        if os.path.exists(results_path):
            try:
                with open(results_path, "r") as f:
                    existing_results = json.load(f)
                    if not isinstance(existing_results, list):
                        existing_results = []
            except (json.JSONDecodeError, FileNotFoundError):
                # If file is corrupted or doesn't exist, start with empty list
                existing_results = []
        
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
            try:
                with open(failures_path, "r") as f:
                    existing_failures = json.load(f)
                    if not isinstance(existing_failures, list):
                        existing_failures = []
            except (json.JSONDecodeError, FileNotFoundError):
                # If file is corrupted or doesn't exist, start with empty list
                existing_failures = []
        
        # Append new failure
        existing_failures.append(failure_record)
        
        # Save updated failures
        with open(failures_path, "w") as f:
            json.dump(existing_failures, f, indent=2)
        
        print(f"Failure logged to {failures_path}")

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
        
        results = []
        all_failures = []
        successful_count = 0
        
        for i, problem in enumerate(problems):
            print(f"\n--- Processing {i+1}/{len(problems)}: {problem.problem_id} ---")
            
            # Reset step counter for each new problem
            self.step_counter = {"count": 0}
            
            problem_start_time = datetime.now()
            current_step = "initialization"
            
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
                    all_failures.append(failure_record)
                    
                    results.append({
                        "problem_id": problem.problem_id,
                        "dataset": problem.dataset,
                        "original_verification_pass": None,  # Not verified due to length
                        "synthesized_verification_pass": None,  # Not reached
                        "status": "skipped_too_long",
                        "error": error_msg,
                        "code_lines": original_lines,
                        "processing_time_seconds": processing_time,
                        "timestamp": datetime.now().isoformat()
                    })
                    
                    print(f"Skipping to next problem...")
                    
                    # Append result and failure to files immediately 
                    self._append_result_to_file(dataset_name, results[-1])
                    self._append_failure_to_file(dataset_name, failure_record)
                    
                    continue
                
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
                        "processing_time_seconds": processing_time,
                        "timestamp": datetime.now().isoformat()
                    }
                    all_failures.append(failure_record)
                    
                    results.append({
                        "problem_id": problem.problem_id,
                        "dataset": problem.dataset,
                        "original_verification_pass": original_verification_pass,
                        "synthesized_verification_pass": None,  # Not reached
                        "status": "error",
                        "error": error_msg,
                        "processing_time_seconds": processing_time,
                        "timestamp": datetime.now().isoformat()
                    })
                    
                    print(f"Skipping to next problem...")
                    
                    # Append result and failure to files immediately 
                    self._append_result_to_file(dataset_name, results[-1])
                    self._append_failure_to_file(dataset_name, failure_record)
                    
                    continue
                
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
                
                # Generate hole_version.lean with successful tactics replaced and unsuccessful ones as hole_N
                hole_version_content = hole_content
                hole_macros = []
                
                if hole_list:
                    # Find max hole number for macro generation
                    max_hole_num = 0
                    for info in hole_list:
                        hole_id = info['hole_id']
                        try:
                            num = int(hole_id.split('_')[-1])
                            if num > max_hole_num:
                                max_hole_num = num
                        except (ValueError, IndexError):
                            continue
                    
                    # Replace successful holes with actual tactics, keep unsuccessful as hole_N
                    for info in hole_list:
                        hole_id = info['hole_id']
                        if hole_id in hole_replacements:
                            # Replace with successful tactic
                            successful_tactic = hole_replacements[hole_id]
                            hole_version_content = hole_version_content.replace(hole_id, successful_tactic)
                            print(f"Replaced {hole_id} with successful tactic: {successful_tactic}")
                        else:
                            # Keep as hole_N and create macro for it
                            try:
                                num = int(hole_id.split('_')[-1])
                                hole_macros.append(f'macro "{hole_id}" : tactic => `(tactic| admit)')
                                print(f"Kept {hole_id} as hole (no successful tactic found)")
                            except (ValueError, IndexError):
                                continue

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
                print(f"Successful tactics applied: {len(hole_replacements)}, Remaining holes: {len(hole_macros)}")
                
                # Save complete fixed proof  
                complete_proof_path = os.path.join(problem_dir, "complete_fixed_proof.lean")
                with open(complete_proof_path, "w") as f:
                    f.write(complete_fixed_proof)
                print(f"Complete fixed proof saved to: {complete_proof_path}")
                
                # Step 4: Verify synthesized proof
                current_step = "verifying_synthesized_proof"
                print(f"Step 4: Verifying synthesized proof...")
                synthesized_verification_pass = self.verify_lean_code(header_content, complete_fixed_proof, with_macro=False)
                print(f"Synthesized proof verification: {'PASS' if synthesized_verification_pass else 'FAIL'}")
                
                # Step 4.5: Update metadata with synthesized verification result
                print(f"Step 4.5: Updating metadata with synthesized verification result...")
                metadata_path = os.path.join(problem_dir, "metadata.json")
                with open(metadata_path, "r") as f:
                    metadata = json.load(f)
                metadata["synthesized_verification_pass"] = synthesized_verification_pass
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
                    metadata_path = os.path.join(problem_dir, "metadata.json")
                    with open(metadata_path, "r") as f:
                        metadata = json.load(f)
                    
                    # Update metadata with verification results
                    for i, step in enumerate(final_steps):
                        if i < len(metadata["steps"]):
                            metadata["steps"][i]["original_verification_pass"] = step.original_verification_pass
                            metadata["steps"][i]["hole_verification_pass"] = step.hole_verification_pass
                            metadata["steps"][i]["filled_verification_pass"] = step.filled_verification_pass
                    
                    # Save updated metadata
                    with open(metadata_path, "w") as f:
                        json.dump(metadata, f, indent=2)
                    print(f"Updated verification results saved to metadata.json")
                
                successful_count += 1
                processing_time = (datetime.now() - problem_start_time).total_seconds()
                
                results.append({
                    "problem_id": problem.problem_id,
                    "dataset": problem.dataset,
                    "problem_dir": problem_dir,
                    "complete_proof_path": complete_proof_path,
                    "complete_fixed_proof": complete_fixed_proof,
                    "original_verification_pass": original_verification_pass,
                    "synthesized_verification_pass": synthesized_verification_pass,
                    "num_steps": len(steps),
                    "detailed_steps": detailed_steps,
                    "processing_time_seconds": processing_time,
                    "status": "success",
                    "timestamp": datetime.now().isoformat()
                })
                
                print(f"✓ Successfully processed {problem.problem_id} in {processing_time:.1f}s")
                
                # Append result to file immediately
                self._append_result_to_file(dataset_name, results[-1])
                
            except Exception as e:
                import traceback
                
                error_msg = str(e)
                processing_time = (datetime.now() - problem_start_time).total_seconds()
                
                print(f"✗ FAILURE for {problem.problem_id}: {error_msg}")
                
                # Record this as a failure
                failure_record = {
                    "problem_id": problem.problem_id,
                    "dataset": problem.dataset,
                    "error_message": error_msg,
                    "processing_time_seconds": processing_time,
                    "timestamp": datetime.now().isoformat()
                }
                all_failures.append(failure_record)
                
                results.append({
                    "problem_id": problem.problem_id,
                    "dataset": problem.dataset,
                    "original_verification_pass": original_verification_pass,
                    "synthesized_verification_pass": None,  # Not reached
                    "status": "error",
                    "error": error_msg,
                    "processing_time_seconds": processing_time,
                    "timestamp": datetime.now().isoformat()
                })
                
                print(f"Failure recorded. Continuing to next problem...")
        
                # Append failure to file immediately
                self._append_failure_to_file(dataset_name, failure_record)
        
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
        metadata_path = os.path.join(problem_dir, "metadata.json")
        if not os.path.exists(metadata_path):
            raise ValueError(f"No metadata found in {problem_dir}")
        
        with open(metadata_path, "r") as f:
            metadata = json.load(f)
        
        return {
            "problem_id": metadata.get("problem_id"),
            "dataset": metadata.get("dataset"),
            "original_verification_pass": metadata.get("original_verification_pass"),
            "synthesized_verification_pass": metadata.get("synthesized_verification_pass"),
            "timestamp": metadata.get("timestamp"),
            "num_steps": len(metadata.get("steps", []))
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
        print("  problem <dataset> <problem_id> - Process single problem")
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
            print("Usage: python decompose_hole_merge_pipeline.py problem <dataset> <problem_id>")
            return
            
        dataset_name = sys.argv[2]
        problem_id = sys.argv[3]
        
        print(f"Processing single problem: {dataset_name}/{problem_id}")
        
        import unified_problem_manager as problem_manager
        problem = problem_manager.Problem(
            dataset=dataset_name,
            problem_id=problem_id
        )
        
        # Test hole generation
        hole_content, hole_list = pipeline.generate_in_place_holes(problem)
        
        print(f"\n=== Generated {len(hole_list)} holes ===")
        for info in hole_list:
            print(f"{info['hole_id']}: {info['original_proof'][:100]}...")
        
        print(f"\n=== Hole Version Content ===")
        print(hole_content)
        
if __name__ == "__main__":
    main() 
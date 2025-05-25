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
        Raises an exception if decomposition fails completely
        
        Args:
            problem: The problem to decompose
            hole_filling_function: Function to use for filling holes (defaults to fill_hole_content)
        """
        print(f"Decomposing problem: {problem.dataset}/{problem.problem_id}")
        
        # Set default hole filling function if none provided
        if hole_filling_function is None:
            hole_filling_function = self.fill_hole_content
        
        decomposition_steps = []
        
        # Get header for verification
        header_content = problem_manager.get_header_content(problem)
        
        def step_decomposer(proof_framework: str) -> str:
            """Custom fix_single_proof function that creates decomposition steps"""
            step_id = self.get_next_step_id()
            print(f"  Processing step {step_id}...")
            print(f"  Proof framework length: {len(proof_framework)} chars")
            
            # Generate hole version for this step
            try:
                hole_content = self._generate_hole_for_step(problem, proof_framework)
            except Exception as e:
                print(f"  Error generating hole: {e}")
                hole_content = proof_framework + "\n  -- TODO: Complete this step\n  hole"
            
            # Perform verification for hole content
            print(f"  Verifying hole content for step {step_id}...")
            hole_verification_pass = self.verify_lean_code(header_content, hole_content, with_macro=True)
            print(f"    Hole verification: {'PASS' if hole_verification_pass else 'FAIL'}")
            
            # Use the provided hole filling function
            filled_content, additional_info = hole_filling_function(hole_content, header_content)
            print(f"    Using filling method: {additional_info.get('method', 'unknown')}")
            
            # Verify filled content
            print(f"  Verifying filled content for step {step_id}...")
            filled_verification_pass = self.verify_lean_code(header_content, filled_content, with_macro=False)
            print(f"    Filled verification: {'PASS' if filled_verification_pass else 'FAIL'}")
            
            # Create decomposition step with verification results and additional info
            step = DecompositionStep(
                step_id=step_id,
                original_content=proof_framework,
                hole_content=hole_content,
                filled_content=filled_content,
                hole_verification_pass=hole_verification_pass,
                filled_verification_pass=filled_verification_pass,
                additional_info=additional_info
            )
            
            decomposition_steps.append(step)
            print(f"Created decomposition step: {step_id}")
            
            return filled_content
        
        try:
            print("Starting solve_theorem_unified...")
            # Use solve_theorem_unified to decompose the problem and get the complete fixed proof
            complete_fixed_proof = solve_theorem_unified(problem, step_decomposer)
            print(f"solve_theorem_unified completed. Generated {len(decomposition_steps)} steps.")
            print(f"Complete fixed proof length: {len(complete_fixed_proof)} chars")
            
            return decomposition_steps, complete_fixed_proof
            
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
    
    def save_decomposition(self, problem_dir: str, problem: Problem, steps: List[DecompositionStep]) -> str:
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
            "steps": [
                {
                    "step_id": step.step_id,
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
            hole_content: The content containing "hole" placeholders
            header_content: The header content for verification
            
        Returns:
            Tuple of (best_filled_content, additional_info)
        """
        # Define common unigram tactics to try
        unigrams = ["norm_num", "linarith", "nlinarith", "omega", "ring", "ring_nf", "simp", "simpa", "field_simp"]
        
        additional_info = {
            "method": "unigram_tactics",
            "tactics_tried": unigrams,
            "successful_tactics": [],
            "failed_tactics": [],
            "best_tactic": None
        }
        
        # First check if hole version passes (sanity check)
        sanity_check = self.verify_lean_code(header_content, hole_content, with_macro=True)
        additional_info["sanity_check_pass"] = sanity_check
        
        if not sanity_check:
            # If hole version doesn't pass, skip tactic testing
            additional_info["skip_reason"] = "sanity_check_failed"
            fallback_content = hole_content.replace("hole", "admit")
            return fallback_content, additional_info
        
        # Try each unigram tactic
        for tactic in unigrams:
            candidate_content = hole_content.replace("hole", tactic)
            if self.verify_lean_code(header_content, candidate_content, with_macro=False):
                additional_info["successful_tactics"].append(tactic)
                if additional_info["best_tactic"] is None:
                    additional_info["best_tactic"] = tactic
            else:
                additional_info["failed_tactics"].append(tactic)
        
        # Return best solution or fallback to admit
        if additional_info["best_tactic"]:
            best_content = hole_content.replace("hole", additional_info["best_tactic"])
            return best_content, additional_info
        else:
            # No tactic worked, use hole as fallback. Won't pass verification without macro.
            return hole_content, additional_info

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
            
            problem_start_time = datetime.now()
            current_step = "initialization"
            
            try:
                # Step 0: Verify original problem
                current_step = "verifying_original_problem"
                print(f"Step 0: Verifying original problem {problem.problem_id}...")
                original_content = problem_manager.get_problem_content(problem)
                header_content = problem_manager.get_header_content(problem)
                original_verification_pass = self.verify_lean_code(header_content, original_content, with_macro=False)
                print(f"Original problem verification: {'PASS' if original_verification_pass else 'FAIL'}")
                
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
                self.save_decomposition(problem_dir, problem, steps)
                print(f"Decomposition saved to: {problem_dir}")
                
                # Step 3: Save the complete fixed proof directly
                current_step = "saving_complete_proof"
                print(f"Step 3: Saving complete fixed proof...")
                complete_proof_path = os.path.join(problem_dir, "complete_fixed_proof.lean")
                with open(complete_proof_path, "w") as f:
                    f.write(complete_fixed_proof)
                print(f"Complete fixed proof saved to: {complete_proof_path}")
                
                # Step 4: Verify synthesized proof
                current_step = "verifying_synthesized_proof"
                print(f"Step 4: Verifying synthesized proof...")
                synthesized_verification_pass = self.verify_lean_code(header_content, complete_fixed_proof, with_macro=False)
                print(f"Synthesized proof verification: {'PASS' if synthesized_verification_pass else 'FAIL'}")
                
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
        limit = int(sys.argv[3]) if len(sys.argv) > 3 else None
        filling_method = sys.argv[4] if len(sys.argv) > 4 else "simple"
        
        # Choose hole filling function based on method
        if filling_method == "unigram":
            hole_filling_function = pipeline.try_unigram_tactics
        else:  # default to simple
            hole_filling_function = pipeline.fill_hole_content
        
        print(f"Processing dataset: {dataset_name}, limit: {limit}, method: {filling_method}")
        pipeline.process_dataset(dataset_name, limit, hole_filling_function)
        
if __name__ == "__main__":
    main() 
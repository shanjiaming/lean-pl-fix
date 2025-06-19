#!/usr/bin/env python3
"""
Minimal Verification Pipeline
Leverages existing decomposition results and satisfies strict constraint: 
maximum 3 full proof verifications per problem
All tactic testing done via ProofStep proof state manipulation
"""

from typing import Dict, List, Tuple, Optional, Set
from dataclasses import dataclass
from datetime import datetime
import json
import os

from ngram_pickle_pipeline import CleanNgramPipeline
from proofstep_lean_integration import MinimalLeanProofStepIntegrator
from proofstep_integration import ProofStepIntegrator
from unified_problem_manager import problem_manager, Problem

@dataclass
class MinimalVerificationResult:
    """Result of processing with minimal verification constraint"""
    problem_id: str
    dataset: str
    verification_count: int
    max_verifications: int
    original_verification_pass: bool
    hole_verification_pass: bool
    filled_verification_pass: bool
    successful_tactics: Dict[int, str]
    tactic_mapping: Dict[str, str]
    complete_solve_success: bool
    original_tactics_test: Dict[str, Dict] # hole_id -> {'success': bool, 'error_message': str}
    proof_state_tests: int
    processing_time_seconds: float
    constraint_satisfied: bool
    tactic_attempts: Optional[Dict] = None

class MinimalVerificationPipeline:
    """
    Pipeline that processes problems with strict verification constraints
    Maximum 3 full proof verifications per problem:
    1. Original problem verification
    2. Hole version verification  
    3. Final synthesized proof verification
    
    All tactic testing done via proof state manipulation (no full verification)
    Leverages existing decomposition results from DecomposeHoleMergePipeline
    """
    
    def __init__(self, decomposition_base_dir: str = "decomposition_results"):
        self.decomposition_base_dir = decomposition_base_dir
    
    def _load_existing_results(self, dataset_name: str) -> Set[str]:
        """
        Load processed problem IDs from summary JSON
        
        Args:
            dataset_name: Name of the dataset
            
        Returns:
            Set of processed problem IDs
        """
        summary_file = os.path.join(self.decomposition_base_dir, f"{dataset_name}_minimal_verification_summary.json")
        
        if not os.path.exists(summary_file):
            print(f"📂 Summary file not found, starting from scratch: {summary_file}")
            return set()
        
        try:
            with open(summary_file, 'r') as f:
                summary_data = json.load(f)
            
            processed_problems = set()
            if 'results' in summary_data:
                for result in summary_data['results']:
                    problem_id = result.get('problem_id')
                    if problem_id:
                        processed_problems.add(problem_id)
            
            print(f"📂 Loaded {len(processed_problems)} processed problems from summary")
            return processed_problems
            
        except (json.JSONDecodeError, KeyError) as e:
            print(f"⚠️ Summary file format error, starting from scratch: {e}")
            return set()
    
    def _save_incremental_result(self, dataset_name: str, new_result: MinimalVerificationResult, all_results: List[MinimalVerificationResult]):
        """
        Incrementally add new problem result to summary JSON
        
        Args:
            dataset_name: Name of the dataset
            new_result: Newly completed result
            all_results: List of all results in current session
        """
        try:
            # Regenerate complete summary data
            self._save_dataset_summary(dataset_name, all_results)
            print(f"💾 Incremental save successful: {new_result.problem_id}")
        except Exception as e:
            print(f"❌ Incremental save failed: {e}")
        
    def process_problem_with_constraint(self, problem: Problem) -> MinimalVerificationResult:
        """
        Process a single problem with strict verification constraint using existing decomposition results
        
        Args:
            problem: Problem to process
            
        Returns:
            MinimalVerificationResult with constraint satisfaction info
        """
        start_time = datetime.now()
        integrator = MinimalLeanProofStepIntegrator()
        
        try:
            print(f"\n🎯 Processing {problem.dataset}/{problem.problem_id} with minimal verification")
            
            # Check if decomposition results exist
            decomp_dir = os.path.join(self.decomposition_base_dir, problem.dataset, "decomposed", problem.problem_id)
            decomp_json_path = os.path.join(decomp_dir, "decomposition.json")
            
            if not os.path.exists(decomp_json_path):
                raise FileNotFoundError(f"Decomposition results not found: {decomp_json_path}\n"
                                      f"Please run the original decomposition pipeline first:\n"
                                      f"python decompose_hole_merge_pipeline.py problem {problem.dataset} {problem.problem_id}")
            
            # Load existing decomposition metadata
            print("📋 Loading existing decomposition results...")
            with open(decomp_json_path, 'r') as f:
                decomp_data = json.load(f)
            
            # Extract original tactics from decomposition data
            original_tactics = {}
            if 'holes' in decomp_data:
                for hole_data in decomp_data['holes']:
                    hole_id = hole_data.get('hole_id')
                    original_proof = hole_data.get('original_proof')
                    if hole_id and original_proof:
                        original_tactics[hole_id] = original_proof
                print(f"📋 Loaded original tactics for {len(original_tactics)} holes")
            
            # Load existing files
            header_path = os.path.join(decomp_dir, "header.lean")
            hole_version_path = os.path.join(decomp_dir, "hole_version.lean")
            
            with open(header_path, 'r') as f:
                header_content = f.read()
                
            with open(hole_version_path, 'r') as f:
                hole_version_content = f.read()
            
            # Use existing verification results where available (saves verifications!)
            original_verification_pass = decomp_data.get('original_verification_pass', None)
            hole_verification_pass = decomp_data.get('hole_verification_pass', None)
            
            print(f"📊 Existing verification results:")
            print(f"  Original: {'PASS' if original_verification_pass else 'FAIL'}")
            print(f"  Hole: {'PASS' if hole_verification_pass else 'FAIL'}")
            
            # Only perform verification if previous results indicate problems
            # verification_needed = not (original_verification_pass and hole_verification_pass)
            verification_needed = False
            
            if verification_needed:
                print("⚠️  Previous verification failures detected, re-verifying...")
                # VERIFICATION 1: Only verify if needed
                if not original_verification_pass:
                    print("🔍 Verification 1: Original problem")
                    original_content = problem_manager.get_problem_content(problem)
                    original_verification_pass = integrator.verify_proof_with_limit(
                        header_content, original_content, "original problem"
                    )
                    print(f"  Result: {'PASS' if original_verification_pass else 'FAIL'}")
                
                # VERIFICATION 2: Only verify if needed
                if not hole_verification_pass:
                    print("🔍 Verification 2: Hole version")
                    hole_verification_pass = integrator.verify_proof_with_limit(
                        header_content, hole_version_content, "hole version"
                    )
                    print(f"  Result: {'PASS' if hole_verification_pass else 'FAIL'}")
            else:
                print("Skipping re-verification")
            
            # ProofStep enumeration phase (NO full verifications)
            print("🧪 ProofStep enumeration phase (proof state testing only)...")
            
            # Identify enumerable vs skip indices using the hole version content
            session_analyzer = ProofStepIntegrator(header_content)
            session = session_analyzer.initialize_session(header_content, hole_version_content)
            enumerable_indices = session.enumerable_indices
            
            print(f"  🔍 Found {len(session.sorry_map)} sorry mappings")
            for idx, sorry_info in session.sorry_map.items():
                print(f"    {idx}: {sorry_info.macro_type} ({sorry_info.hole_id}) -> {'ENUM' if sorry_info.should_enumerate else 'SKIP'}")
            
            print(f"  📊 {len(enumerable_indices)} enumerable holes, {len(session.skip_indices)} skip holes")
            
            # Test original tactics first
            original_tactics_test_results = integrator.test_original_tactics_on_proof_states(
                header_content, hole_version_content, original_tactics, enumerable_indices, session.sorry_map
            )
            
            # Run CleanNgramPipeline for tactic enumeration
            print("🔍 Starting n-gram search with CleanNgramPipeline...")
            ngram_pipeline = CleanNgramPipeline(
                max_depth=2,  # N-gram depth, 2 for 2-gram
                stop_on_first_success=True
            )

            proofstep_results = ngram_pipeline.process_problem(
                header_content=header_content,
                clear_version=hole_version_content,
                enumerable_indices=enumerable_indices,
                sorry_map=session.sorry_map,
                problem_id=problem.problem_id  # For checkpointing
            )
            
            successful_tactics = proofstep_results['successful_tactics']
            # In n-gram, 'tactic_attempts' is now 'ngram_attempts'
            tactic_attempts = proofstep_results.get('ngram_attempts', {})
            proof_state_tests = sum(len(attempts.get('node_attempts', [])) for attempts in tactic_attempts.values())
            
            # Create synthesized version by directly replacing hole uses with tactics
            print("📝 Creating synthesized version by directly replacing holes with tactics...")
            synthesized_content = hole_version_content
            
            import re
            
            # Identify all enumerable holes from the session
            all_enumerable_holes = {
                info.hole_id 
                for info in session.sorry_map.values() 
                if info.should_enumerate and info.hole_id
            }
            
            # Replace successful holes with tactics
            for hole_id, tactic in successful_tactics.items():
                print(f"  ✅ {hole_id} -> {tactic}")
                # Remove macro definition for this hole
                macro_pattern = f'macro "{hole_id}" : tactic => `\\(tactic\\| [^)]+\\)'
                synthesized_content = re.sub(macro_pattern, '', synthesized_content, count=1)
                
                # Replace hole usage with direct tactic
                hole_pattern = f'(\\s+){re.escape(hole_id)}\\b(\\s*)'
                replacement = f'\\g<1>{tactic}\\g<2>'
                synthesized_content = re.sub(hole_pattern, replacement, synthesized_content, count=1)
            
            # For holes without successful tactics, replace with admit
            unsolved_holes = all_enumerable_holes - set(successful_tactics.keys())
            for hole_id in unsolved_holes:
                print(f"  🔄 {hole_id} -> admit (fallback)")
                # Remove macro definition for this hole
                macro_pattern = f'macro "{hole_id}" : tactic => `\\(tactic\\| [^)]+\\)'
                synthesized_content = re.sub(macro_pattern, '', synthesized_content, count=1)
                
                # Replace hole usage with admit
                hole_pattern = f'(\\s+){re.escape(hole_id)}\\b(\\s*)'
                replacement = f'\\g<1>admit\\g<2>'
                synthesized_content = re.sub(hole_pattern, replacement, synthesized_content, count=1)

            # Clean up extra empty lines from removed macros
            synthesized_content = re.sub(r'\n\s*\n\s*\n', '\n\n', synthesized_content)
            synthesized_content = synthesized_content.strip() + '\n'
            
            # Create complete tactic mapping for all holes
            tactic_mapping = {}
            # Add successful tactics
            for hole_id, tactic in successful_tactics.items():
                tactic_mapping[hole_id] = tactic
            # Add fallback tactics for unsolved holes
            for hole_id in unsolved_holes:
                tactic_mapping[hole_id] = "admit"
            
            tactics_replaced = len(successful_tactics)
            print(f"  📊 Replaced {tactics_replaced}/{len(all_enumerable_holes)} hole usages with tactics/admit")
            print(f"  🗂️  Complete tactic mapping: {len(tactic_mapping)} holes mapped")
            
            # Calculate complete solve success
            no_admits_used = all(tactic != "admit" for tactic in tactic_mapping.values())
            print(f"  🎯 No admits used: {no_admits_used}")
            
            # Save synthesized version to decomposed directory
            synthesized_path = os.path.join(decomp_dir, "synthesized_proof.lean")
            with open(synthesized_path, 'w') as f:
                f.write(synthesized_content)
            print(f"  💾 Synthesized proof saved to: {synthesized_path}")
            
            # VERIFICATION 3: Final synthesized proof (if we have any tactic replacements)
            filled_verification_pass = False
            if tactics_replaced > 0:
                print("🔍 Verification 3: Final synthesized proof")
                filled_verification_pass = integrator.verify_proof_with_limit(
                    header_content, synthesized_content, "final synthesized proof", reset_lean_server=True
                )
                print(f"  Result: {'PASS' if filled_verification_pass else 'FAIL'}")
            else:
                print("⏭️  No tactics replaced, skipping synthesized proof verification")
            
            # Calculate complete solve success: verification passes AND no admits used
            complete_solve_success = filled_verification_pass and no_admits_used
            print(f"  ✨ Complete solve success: {complete_solve_success}")
            
            # Check constraint satisfaction
            constraint_satisfied = integrator.verification_count <= integrator.max_verifications
            
            processing_time = (datetime.now() - start_time).total_seconds()
            
            result = MinimalVerificationResult(
                problem_id=problem.problem_id,
                dataset=problem.dataset,
                verification_count=integrator.verification_count,
                max_verifications=integrator.max_verifications,
                original_verification_pass=original_verification_pass,
                hole_verification_pass=hole_verification_pass,
                filled_verification_pass=filled_verification_pass,
                successful_tactics=successful_tactics,
                tactic_mapping=tactic_mapping,
                complete_solve_success=complete_solve_success,
                original_tactics_test=original_tactics_test_results,
                proof_state_tests=proof_state_tests,
                processing_time_seconds=processing_time,
                constraint_satisfied=constraint_satisfied,
                tactic_attempts=tactic_attempts
            )
            
            # Save minimal verification result to decomposed directory
            minimal_result_path = os.path.join(decomp_dir, "minimal_verification.json")
            minimal_result_data = {
                "problem_id": result.problem_id,
                "dataset": result.dataset,
                "verification_count": result.verification_count,
                "max_verifications": result.max_verifications,
                "original_verification_pass": result.original_verification_pass,
                "hole_verification_pass": result.hole_verification_pass,
                "filled_verification_pass": result.filled_verification_pass,
                "synthesized_verification_pass": result.filled_verification_pass,  # alias for clarity
                "complete_solve_success": result.complete_solve_success,
                "original_tactics_test": result.original_tactics_test,
                "successful_tactics": {str(k): v for k, v in result.successful_tactics.items()},
                "tactic_mapping": result.tactic_mapping,
                "proof_state_tests": result.proof_state_tests,
                "tactic_attempts": result.tactic_attempts,
                "processing_time_seconds": result.processing_time_seconds,
                "constraint_satisfied": result.constraint_satisfied,
                "tactics_replaced": tactics_replaced,
                "timestamp": datetime.now().isoformat()
            }
            
            with open(minimal_result_path, 'w') as f:
                json.dump(minimal_result_data, f, indent=2)
            print(f"  💾 Minimal verification result saved to: {minimal_result_path}")
            
            print(f"📊 Results:")
            print(f"  Verifications: {integrator.verification_count}/{integrator.max_verifications}")
            print(f"  Proof state tests: {proof_state_tests}")
            print(f"  Successful tactics: {len(successful_tactics)}")
            print(f"  Tactics replaced: {tactics_replaced}")
            print(f"  Constraint satisfied: {'✅' if constraint_satisfied else '❌'}")
            print(f"  Processing time: {processing_time:.1f}s")
            
            return result
            
        finally:
            integrator.shutdown_lean_server()
    
    def process_dataset_with_constraint(self, dataset_name: str, limit: Optional[int] = None, enable_resume: bool = True, force_reprocess: List[str] = None) -> List[MinimalVerificationResult]:
        """
        Process entire dataset with minimal verification constraint
        
        Args:
            dataset_name: Name of dataset to process
            limit: Maximum number of problems to process
            enable_resume: Whether to enable checkpoint resume
            force_reprocess: List of problem IDs to force reprocess
            
        Returns:
            List of MinimalVerificationResult objects
        """
        problems = problem_manager.list_problems(dataset_name)
        if not problems:
            print(f"No problems found in dataset: {dataset_name}")
            return []
        
        # Checkpoint resume logic
        processed_problems = set()
        existing_results = []
        
        if enable_resume:
            processed_problems = self._load_existing_results(dataset_name)
            # Load existing results for incremental updates
            summary_file = os.path.join(self.decomposition_base_dir, f"{dataset_name}_minimal_verification_summary.json")
            if os.path.exists(summary_file):
                try:
                    with open(summary_file, 'r') as f:
                        summary_data = json.load(f)
                    if 'results' in summary_data:
                        # Rebuild existing result objects
                        for result_data in summary_data['results']:
                            result = MinimalVerificationResult(
                                problem_id=result_data.get('problem_id', ''),
                                dataset=result_data.get('dataset', dataset_name),
                                verification_count=result_data.get('verification_count', 0),
                                max_verifications=result_data.get('max_verifications', 3),
                                original_verification_pass=result_data.get('original_verification_pass', False),
                                hole_verification_pass=result_data.get('hole_verification_pass', False),
                                filled_verification_pass=result_data.get('filled_verification_pass', False),
                                successful_tactics=result_data.get('successful_tactics', {}),
                                tactic_mapping=result_data.get('tactic_mapping', {}),
                                complete_solve_success=result_data.get('complete_solve_success', False),
                                original_tactics_test=result_data.get('original_tactics_test', {}),
                                proof_state_tests=result_data.get('proof_state_tests', 0),
                                processing_time_seconds=result_data.get('processing_time_seconds', 0.0),
                                constraint_satisfied=result_data.get('constraint_satisfied', False),
                                tactic_attempts=result_data.get('tactic_attempts', {})
                            )
                            existing_results.append(result)
                except Exception as e:
                    print(f"⚠️ Failed to load existing results: {e}")
                    existing_results = []
        
        # Filter problems to process
        if force_reprocess:
            force_reprocess_set = set(force_reprocess)
            # Remove problems that need forced reprocessing
            processed_problems = processed_problems - force_reprocess_set
            # Remove problems from existing results that need forced reprocessing
            existing_results = [r for r in existing_results if r.problem_id not in force_reprocess_set]
            print(f"🔄 Force reprocessing {len(force_reprocess_set)} problems")
        
        # Filter out problems that need processing
        problems_to_process = [p for p in problems if p.problem_id not in processed_problems]
        
        if limit:
            problems_to_process = problems_to_process[:limit]
        
        print(f"🚀 Dataset {dataset_name}: Total {len(problems)}, Processed {len(processed_problems)}, To process {len(problems_to_process)}")
        if enable_resume and len(processed_problems) > 0:
            print(f"📋 Checkpoint resume enabled, skipping {len(processed_problems)} processed problems")
        print("=" * 80)
        
        # Merge existing results and new results
        results = existing_results.copy()
        constraint_violations = len([r for r in existing_results if not r.constraint_satisfied])
        
        for i, problem in enumerate(problems_to_process):
            print(f"\n--- Processing {i+1}/{len(problems_to_process)}: {problem.problem_id} ---")
            
            try:
                result = self.process_problem_with_constraint(problem)
                results.append(result)
                
                # Incremental save of result
                self._save_incremental_result(dataset_name, result, results)
                
                if not result.constraint_satisfied:
                    constraint_violations += 1
                    print(f"⚠️  CONSTRAINT VIOLATION: {result.verification_count}/{result.max_verifications} verifications")
                
            except Exception as e:
                print(f"❌ Error processing {problem.problem_id}: {e}")
                # Create error result
                error_result = MinimalVerificationResult(
                    problem_id=problem.problem_id,
                    dataset=dataset_name,
                    verification_count=999,  # Indicate error
                    max_verifications=3,
                    original_verification_pass=False,
                    hole_verification_pass=False,
                    filled_verification_pass=False,
                    successful_tactics={},
                    tactic_mapping={},
                    complete_solve_success=False,
                    original_tactics_test={},
                    proof_state_tests=0,
                    processing_time_seconds=0.0,
                    constraint_satisfied=False,
                    tactic_attempts={}
                )
                results.append(error_result)
                constraint_violations += 1
                
                # Incremental save of error result
                self._save_incremental_result(dataset_name, error_result, results)
        
        # Final save of summary results (ensure all data is saved)
        if len(problems_to_process) > 0:
            print(f"💾 Final save of dataset summary...")
            self._save_dataset_summary(dataset_name, results)
        else:
            print(f"📋 No new problems processed, skipping final save")
        
        # Print summary
        print(f"\n{'='*80}")
        print(f"🎉 MINIMAL VERIFICATION PIPELINE SUMMARY")
        print(f"Dataset: {dataset_name}")
        print(f"Problems processed: {len(results)}")
        print(f"Constraint violations: {constraint_violations}")
        print(f"Constraint satisfaction rate: {(len(results)-constraint_violations)/len(results)*100:.1f}%")
        
        successful_problems = [r for r in results if r.filled_verification_pass]
        complete_solve_success_problems = [r for r in results if r.complete_solve_success]
        print(f"Successfully filled proofs: {len(successful_problems)}")
        print(f"Complete solve success (no admits): {len(complete_solve_success_problems)}")
        print(f"Complete solve success rate: {len(complete_solve_success_problems)/len(results)*100:.1f}%")
        
        # Add original tactics statistics
        total_original_tests = sum(len(r.original_tactics_test) for r in results if r.original_tactics_test)
        successful_original_tests = sum(
            sum(1 for test_result in r.original_tactics_test.values() if test_result.get('success', False))
            for r in results if r.original_tactics_test
        )
        if total_original_tests > 0:
            print(f"Original tactics tested: {total_original_tests}")
            print(f"Original tactics successful: {successful_original_tests}")
            print(f"Original tactics success rate: {successful_original_tests/total_original_tests*100:.1f}%")
        
        total_proof_state_tests = sum(r.proof_state_tests for r in results)
        total_verifications = sum(r.verification_count for r in results if r.verification_count < 999)
        print(f"Total proof state tests: {total_proof_state_tests}")
        print(f"Total full verifications: {total_verifications}")
        print(f"Verification efficiency: {total_proof_state_tests/(total_verifications or 1):.1f} proof state tests per full verification")
        
        return results
    
    def _save_dataset_summary(self, dataset_name: str, results: List[MinimalVerificationResult]):
        """Save dataset-level summary results to decomposition_results directory"""
        output_file = os.path.join(self.decomposition_base_dir, f"{dataset_name}_minimal_verification_summary.json")
        
        results_data = []
        for result in results:
            results_data.append({
                "problem_id": result.problem_id,
                "dataset": result.dataset,
                "verification_count": result.verification_count,
                "max_verifications": result.max_verifications,
                "original_verification_pass": result.original_verification_pass,
                "hole_verification_pass": result.hole_verification_pass,
                "filled_verification_pass": result.filled_verification_pass,
                "complete_solve_success": result.complete_solve_success,
                "original_tactics_test": result.original_tactics_test,
                "successful_tactics": {str(k): v for k, v in result.successful_tactics.items()},
                "tactic_mapping": result.tactic_mapping,
                "proof_state_tests": result.proof_state_tests,
                "tactic_attempts": result.tactic_attempts,
                "processing_time_seconds": result.processing_time_seconds,
                "constraint_satisfied": result.constraint_satisfied,
                "timestamp": datetime.now().isoformat()
            })
        
        # Calculate original tactics statistics
        total_original_tests = 0
        successful_original_tests = 0
        for result in results:
            if result.original_tactics_test:
                for hole_id, test_result in result.original_tactics_test.items():
                    total_original_tests += 1
                    if test_result.get('success', False):
                        successful_original_tests += 1
        
        original_tactics_success_rate = (successful_original_tests / total_original_tests * 100) if total_original_tests > 0 else 0
        
        # Add summary statistics
        summary_data = {
            "dataset": dataset_name,
            "total_problems": len(results),
            "constraint_violations": len([r for r in results if not r.constraint_satisfied]),
            "constraint_satisfaction_rate": len([r for r in results if r.constraint_satisfied]) / len(results) * 100,
            "successful_problems": len([r for r in results if r.filled_verification_pass]),
            "complete_solve_success_problems": len([r for r in results if r.complete_solve_success]),
            "complete_solve_success_rate": len([r for r in results if r.complete_solve_success]) / len(results) * 100,
            "total_original_tactics_tests": total_original_tests,
            "successful_original_tactics_tests": successful_original_tests,
            "original_tactics_success_rate": original_tactics_success_rate,
            "total_proof_state_tests": sum(r.proof_state_tests for r in results),
            "total_verifications": sum(r.verification_count for r in results if r.verification_count < 999),
            "average_processing_time": sum(r.processing_time_seconds for r in results) / len(results),
            "timestamp": datetime.now().isoformat(),
            "results": results_data
        }
        
        with open(output_file, 'w') as f:
            json.dump(summary_data, f, indent=2)
        
        print(f"💾 Dataset summary saved to: {output_file}")

def main():
    """Main function for minimal verification pipeline"""
    import sys
    import argparse
    
    parser = argparse.ArgumentParser(
        description="Minimal Verification Pipeline with checkpoint resume support",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  python minimal_verification_pipeline.py dataset demo 3
  python minimal_verification_pipeline.py dataset minif2f 10 --no-resume
  python minimal_verification_pipeline.py dataset demo --force-reprocess demo_complex_p1,demo_complex_p2
  python minimal_verification_pipeline.py problem demo demo_complex_p2
"""
    )
    
    subparsers = parser.add_subparsers(dest='mode', help='Processing mode')
    
    # Dataset mode
    dataset_parser = subparsers.add_parser('dataset', help='Process entire dataset')
    dataset_parser.add_argument('dataset_name', help='Name of dataset to process')
    dataset_parser.add_argument('limit', nargs='?', type=int, help='Maximum number of problems to process')
    dataset_parser.add_argument('--no-resume', action='store_true', help='Disable checkpoint resume (process all problems from scratch)')
    dataset_parser.add_argument('--force-reprocess', help='Comma-separated list of problem IDs to force reprocess')
    
    # Problem mode
    problem_parser = subparsers.add_parser('problem', help='Process single problem')
    problem_parser.add_argument('dataset_name', help='Dataset name')
    problem_parser.add_argument('problem_id', help='Problem ID to process')
    
    args = parser.parse_args()
    
    if not args.mode:
        parser.print_help()
        return

    pipeline = MinimalVerificationPipeline()

    if args.mode == "dataset":
        enable_resume = not args.no_resume
        force_reprocess = args.force_reprocess.split(',') if args.force_reprocess else None
        
        results = pipeline.process_dataset_with_constraint(
            args.dataset_name, 
            args.limit, 
            enable_resume=enable_resume,
            force_reprocess=force_reprocess
        )
        
        # Check if all constraints were satisfied
        violations = [r for r in results if not r.constraint_satisfied]
        if not violations:
            print("\n🎉 ALL CONSTRAINTS SATISFIED!")
            print("✅ Maximum 3 verifications per problem maintained")
            print("✅ All tactic testing done via proof state manipulation")
        else:
            print(f"\n⚠️  {len(violations)} constraint violations detected")

    elif args.mode == "problem":
        problem = problem_manager.get_problem(args.dataset_name, args.problem_id)
        if not problem:
            print(f"Error: Problem '{args.problem_id}' not found in dataset '{args.dataset_name}'.")
            return
        
        try:
            print(f"🚀 Processing single problem: {args.dataset_name}/{args.problem_id}")
            result = pipeline.process_problem_with_constraint(problem)
            
            if result.constraint_satisfied:
                print("\n🎉 CONSTRAINT SATISFIED!")
            else:
                print(f"\n⚠️  CONSTRAINT VIOLATION: {result.verification_count}/{result.max_verifications} verifications")

        except Exception as e:
            import traceback
            print(f"❌ Error processing {problem.problem_id}: {e}")
            traceback.print_exc()

if __name__ == "__main__":
    main()
#!/usr/bin/env python3
"""
Minimal Verification Pipeline
Leverages existing decomposition results and satisfies strict constraint: 
maximum 3 full proof verifications per problem
All tactic testing done via ProofStep proof state manipulation
"""

from typing import Dict, List, Tuple, Optional
from dataclasses import dataclass
from datetime import datetime
import json
import os

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
    clear_verification_pass: bool
    filled_verification_pass: bool
    successful_tactics: Dict[int, str]
    proof_state_tests: int
    processing_time_seconds: float
    constraint_satisfied: bool
    tactic_attempts: Optional[Dict] = None

class MinimalVerificationPipeline:
    """
    Pipeline that processes problems with strict verification constraints
    Maximum 3 full proof verifications per problem:
    1. Original problem verification
    2. Hole/clear version verification  
    3. Final filled proof verification
    
    All tactic testing done via proof state manipulation (no full verification)
    Leverages existing decomposition results from DecomposeHoleMergePipeline
    """
    
    def __init__(self, decomposition_base_dir: str = "decomposition_results"):
        self.decomposition_base_dir = decomposition_base_dir
        
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
            
            # Load existing files
            header_path = os.path.join(decomp_dir, "header.lean")
            clear_version_path = os.path.join(decomp_dir, "clear_version.lean")
            hole_version_path = os.path.join(decomp_dir, "hole_version.lean")
            
            with open(header_path, 'r') as f:
                header_content = f.read()
            
            with open(clear_version_path, 'r') as f:
                clear_with_macros = f.read()
                
            with open(hole_version_path, 'r') as f:
                hole_version_content = f.read()
            
            # Use existing verification results where available (saves verifications!)
            original_verification_pass = decomp_data.get('original_verification_pass', True)
            hole_verification_pass = decomp_data.get('hole_verification_pass', True)
            clear_verification_pass = decomp_data.get('clear_verification_pass', True)
            
            print(f"📊 Existing verification results:")
            print(f"  Original: {'PASS' if original_verification_pass else 'FAIL'}")
            print(f"  Hole: {'PASS' if hole_verification_pass else 'FAIL'}")
            print(f"  Clear: {'PASS' if clear_verification_pass else 'FAIL'}")
            
            # Only perform verification if previous results indicate problems
            verification_needed = not (original_verification_pass and hole_verification_pass and clear_verification_pass)
            
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
                if not (hole_verification_pass and clear_verification_pass):
                    print("🔍 Verification 2: Hole/clear version")
                    hole_verification_pass = integrator.verify_proof_with_limit(
                        header_content, clear_with_macros, "hole/clear version"
                    )
                    clear_verification_pass = hole_verification_pass
                    print(f"  Result: {'PASS' if hole_verification_pass else 'FAIL'}")
            else:
                print("✅ All existing verifications passed, skipping re-verification")
            
            # ProofStep enumeration phase (NO full verifications)
            print("🧪 ProofStep enumeration phase (proof state testing only)...")
            
            # Identify enumerable vs skip indices using the clear version content
            session_analyzer = ProofStepIntegrator(header_content)
            session = session_analyzer.initialize_session(header_content, clear_with_macros)
            enumerable_indices = session.enumerable_indices
            
            print(f"  🔍 Found {len(session.sorry_map)} sorry mappings")
            for idx, sorry_info in session.sorry_map.items():
                print(f"    {idx}: {sorry_info.macro_type} ({sorry_info.hole_id}) -> {'ENUM' if sorry_info.should_enumerate else 'SKIP'}")
            
            print(f"  📊 {len(enumerable_indices)} enumerable holes, {len(session.skip_indices)} skip holes")
            
            # Run ProofStep enumeration with proof states
            unigrams = ["norm_num", "linarith", "nlinarith", "omega", "ring", "ring_nf", "simp", "simpa", "field_simp", "positivity", "norm_cast"]
            
            # Use the clear version content with clear statements for ProofStep
            proofstep_results = integrator.enumerate_tactics_with_proof_states(
                header_content, clear_with_macros, unigrams, enumerable_indices, session.sorry_map
            )
            
            successful_tactics = proofstep_results['successful_tactics']
            tactic_attempts = proofstep_results['tactic_attempts']
            proof_state_tests = sum(len(attempts) for attempts in tactic_attempts.values())
            
            # Create synthesized version by directly replacing hole uses with tactics
            print("📝 Creating synthesized version by directly replacing holes with tactics...")
            synthesized_content = hole_version_content
            tactics_replaced = 0
            
            # First, remove all hole macro definitions since we'll replace them directly
            import re
            
            # Remove macro definitions for holes that we'll replace
            for sorry_idx, tactic in successful_tactics.items():
                sorry_info = session.sorry_map.get(sorry_idx)
                if sorry_info and sorry_info.hole_id:
                    # Remove the macro definition line
                    macro_pattern = f'macro "{sorry_info.hole_id}" : tactic => `\\(tactic\\| [^)]+\\)'
                    synthesized_content = re.sub(macro_pattern, '', synthesized_content)
            
            # Now replace direct uses of hole_X with the actual tactics
            for sorry_idx, tactic in successful_tactics.items():
                sorry_info = session.sorry_map.get(sorry_idx)
                if sorry_info and sorry_info.hole_id:
                    hole_id = sorry_info.hole_id
                    
                    # Replace hole usage with direct tactic
                    # Look for patterns like "    hole_2" (with proper indentation)
                    hole_pattern = f'(\\s+){hole_id}(\\s*)'
                    replacement = f'\\g<1>{tactic}\\g<2>'
                    
                    old_content = synthesized_content
                    synthesized_content = re.sub(hole_pattern, replacement, synthesized_content)
                    
                    if synthesized_content != old_content:
                        tactics_replaced += 1
                        print(f"  ✅ {hole_id} -> {tactic}")
                    else:
                        print(f"  ⚠️  Could not find usage of {hole_id} in proof body")
            
            # For holes without successful tactics, replace with admit
            # Remove ALL hole macro definitions and replace usages with admit
            all_holes_in_session = set()
            for sorry_info in session.sorry_map.values():
                if sorry_info.hole_id and sorry_info.should_enumerate:
                    all_holes_in_session.add(sorry_info.hole_id)
            
            # Remove macro definitions for holes that don't have successful tactics
            for hole_id in all_holes_in_session:
                if hole_id not in [session.sorry_map[idx].hole_id for idx in successful_tactics.keys() if session.sorry_map.get(idx)]:
                    # Remove macro definition for this hole
                    macro_pattern = f'macro "{hole_id}" : tactic => `\\(tactic\\| [^)]+\\)'
                    synthesized_content = re.sub(macro_pattern, '', synthesized_content)
                    
                    # Replace hole usage with admit
                    hole_pattern = f'(\\s+){hole_id}(\\s*)'
                    replacement = f'\\g<1>admit\\g<2>'
                    
                    old_content = synthesized_content
                    synthesized_content = re.sub(hole_pattern, replacement, synthesized_content)
                    
                    if synthesized_content != old_content:
                        tactics_replaced += 1
                        print(f"  🔄 {hole_id} -> admit (fallback)")
            
            # Clean up extra empty lines from removed macros
            synthesized_content = re.sub(r'\n\s*\n\s*\n', '\n\n', synthesized_content)
            synthesized_content = synthesized_content.strip() + '\n'
            
            print(f"  📊 Replaced {tactics_replaced}/{len(all_holes_in_session)} hole usages with tactics/admit")
            
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
                    header_content, synthesized_content, "final synthesized proof"
                )
                print(f"  Result: {'PASS' if filled_verification_pass else 'FAIL'}")
            else:
                print("⏭️  No tactics replaced, skipping synthesized proof verification")
            
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
                clear_verification_pass=clear_verification_pass,
                filled_verification_pass=filled_verification_pass,
                successful_tactics=successful_tactics,
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
                "clear_verification_pass": result.clear_verification_pass,
                "filled_verification_pass": result.filled_verification_pass,
                "synthesized_verification_pass": result.filled_verification_pass,  # alias for clarity
                "successful_tactics": {str(k): v for k, v in result.successful_tactics.items()},
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
    
    def process_dataset_with_constraint(self, dataset_name: str, limit: Optional[int] = None) -> List[MinimalVerificationResult]:
        """
        Process entire dataset with minimal verification constraint
        
        Args:
            dataset_name: Name of dataset to process
            limit: Maximum number of problems to process
            
        Returns:
            List of MinimalVerificationResult objects
        """
        problems = problem_manager.list_problems(dataset_name)
        if not problems:
            print(f"No problems found in dataset: {dataset_name}")
            return []
        
        if limit:
            problems = problems[:limit]
        
        print(f"🚀 Processing {len(problems)} problems from {dataset_name} with minimal verification constraint")
        print("=" * 80)
        
        results = []
        constraint_violations = 0
        
        for i, problem in enumerate(problems):
            print(f"\n--- Processing {i+1}/{len(problems)}: {problem.problem_id} ---")
            
            try:
                result = self.process_problem_with_constraint(problem)
                results.append(result)
                
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
                    clear_verification_pass=False,
                    filled_verification_pass=False,
                    successful_tactics={},
                    proof_state_tests=0,
                    processing_time_seconds=0.0,
                    constraint_satisfied=False,
                    tactic_attempts={}
                )
                results.append(error_result)
                constraint_violations += 1
        
        # Save summary results (dataset level)
        self._save_dataset_summary(dataset_name, results)
        
        # Print summary
        print(f"\n{'='*80}")
        print(f"🎉 MINIMAL VERIFICATION PIPELINE SUMMARY")
        print(f"Dataset: {dataset_name}")
        print(f"Problems processed: {len(results)}")
        print(f"Constraint violations: {constraint_violations}")
        print(f"Constraint satisfaction rate: {(len(results)-constraint_violations)/len(results)*100:.1f}%")
        
        successful_problems = [r for r in results if r.filled_verification_pass]
        print(f"Successfully filled proofs: {len(successful_problems)}")
        
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
                "clear_verification_pass": result.clear_verification_pass,
                "filled_verification_pass": result.filled_verification_pass,
                "successful_tactics": {str(k): v for k, v in result.successful_tactics.items()},
                "proof_state_tests": result.proof_state_tests,
                "tactic_attempts": result.tactic_attempts,
                "processing_time_seconds": result.processing_time_seconds,
                "constraint_satisfied": result.constraint_satisfied,
                "timestamp": datetime.now().isoformat()
            })
        
        # Add summary statistics
        summary_data = {
            "dataset": dataset_name,
            "total_problems": len(results),
            "constraint_violations": len([r for r in results if not r.constraint_satisfied]),
            "constraint_satisfaction_rate": len([r for r in results if r.constraint_satisfied]) / len(results) * 100,
            "successful_problems": len([r for r in results if r.filled_verification_pass]),
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
    
    if len(sys.argv) < 2:
        print("Usage: python minimal_verification_pipeline.py <dataset> [limit]")
        print("Example: python minimal_verification_pipeline.py demo 3")
        return
    
    dataset_name = sys.argv[1]
    limit = int(sys.argv[2]) if len(sys.argv) > 2 else None
    
    pipeline = MinimalVerificationPipeline()
    results = pipeline.process_dataset_with_constraint(dataset_name, limit)
    
    # Check if all constraints were satisfied
    violations = [r for r in results if not r.constraint_satisfied]
    if not violations:
        print("\n🎉 ALL CONSTRAINTS SATISFIED!")
        print("✅ Maximum 3 verifications per problem maintained")
        print("✅ All tactic testing done via proof state manipulation")
    else:
        print(f"\n⚠️  {len(violations)} constraint violations detected")

if __name__ == "__main__":
    main()
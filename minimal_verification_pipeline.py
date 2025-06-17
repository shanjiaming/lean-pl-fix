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
    
    def __init__(self, output_base_dir: str = "minimal_verification_results", 
                 decomposition_base_dir: str = "decomposition_results"):
        self.output_base_dir = output_base_dir
        self.decomposition_base_dir = decomposition_base_dir
        os.makedirs(self.output_base_dir, exist_ok=True)
        
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
            
            with open(header_path, 'r') as f:
                header_content = f.read()
            
            with open(clear_version_path, 'r') as f:
                clear_with_macros = f.read()
            
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
            session_analyzer = ProofStepIntegrator()
            session = session_analyzer.initialize_session(clear_with_macros)
            enumerable_indices = session.enumerable_indices
            
            print(f"  🔍 Found {len(session.sorry_map)} sorry mappings")
            for idx, sorry_info in session.sorry_map.items():
                print(f"    {idx}: {sorry_info.macro_type} ({sorry_info.hole_id}) -> {'ENUM' if sorry_info.should_enumerate else 'SKIP'}")
            
            print(f"  📊 {len(enumerable_indices)} enumerable holes, {len(session.skip_indices)} skip holes")
            
            # Run ProofStep enumeration with proof states
            unigrams = ["norm_num", "linarith", "nlinarith", "omega", "ring", "ring_nf", "simp", "simpa", "field_simp", "positivity", "norm_cast"]
            
            # Use the clear version file directly for ProofStep (need absolute path)
            absolute_clear_path = os.path.abspath(clear_version_path)
            proofstep_results = integrator.enumerate_tactics_with_proof_states_file(
                absolute_clear_path, unigrams, enumerable_indices
            )
            
            successful_tactics = proofstep_results['successful_tactics']
            proof_state_tests = proofstep_results['proof_state_tests']
            
            # Create filled version based on successful tactics
            print("📝 Creating filled version from successful tactics...")
            filled_content = clear_with_macros
            
            for sorry_idx, tactic in successful_tactics.items():
                # Find corresponding hole_id from session mapping
                sorry_info = session.sorry_map.get(sorry_idx)
                if sorry_info and sorry_info.hole_id:
                    # Replace macro definition with successful tactic
                    old_macro = f'macro "{sorry_info.hole_id}" : tactic => `(tactic| admit)'
                    new_macro = f'macro "{sorry_info.hole_id}" : tactic => `(tactic| {tactic})'
                    filled_content = filled_content.replace(old_macro, new_macro)
                    print(f"  ✅ {sorry_info.hole_id} -> {tactic}")
            
            # VERIFICATION 3: Final filled proof (only if we have successful tactics)
            filled_verification_pass = False
            if successful_tactics:
                print("🔍 Verification 3: Final filled proof")
                filled_verification_pass = integrator.verify_proof_with_limit(
                    header_content, filled_content, "final filled proof"
                )
                print(f"  Result: {'PASS' if filled_verification_pass else 'FAIL'}")
            else:
                print("⏭️  No successful tactics found, skipping filled proof verification")
            
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
                constraint_satisfied=constraint_satisfied
            )
            
            print(f"📊 Results:")
            print(f"  Verifications: {integrator.verification_count}/{integrator.max_verifications}")
            print(f"  Proof state tests: {proof_state_tests}")
            print(f"  Successful tactics: {len(successful_tactics)}")
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
            print(f"\\n--- Processing {i+1}/{len(problems)}: {problem.problem_id} ---")
            
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
                    constraint_satisfied=False
                )
                results.append(error_result)
                constraint_violations += 1
        
        # Save results
        self._save_results(dataset_name, results)
        
        # Print summary
        print(f"\\n{'='*80}")
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
    
    def _save_results(self, dataset_name: str, results: List[MinimalVerificationResult]):
        """Save results to JSON file"""
        output_file = os.path.join(self.output_base_dir, f"{dataset_name}_minimal_verification_results.json")
        
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
                "processing_time_seconds": result.processing_time_seconds,
                "constraint_satisfied": result.constraint_satisfied,
                "timestamp": datetime.now().isoformat()
            })
        
        with open(output_file, 'w') as f:
            json.dump(results_data, f, indent=2)
        
        print(f"💾 Results saved to: {output_file}")

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
        print("\\n🎉 ALL CONSTRAINTS SATISFIED!")
        print("✅ Maximum 3 verifications per problem maintained")
        print("✅ All tactic testing done via proof state manipulation")
    else:
        print(f"\\n⚠️  {len(violations)} constraint violations detected")

if __name__ == "__main__":
    main()
#!/usr/bin/env python3
"""
Minimal Verification Pipeline
Satisfies strict constraint: maximum 3 full proof verifications per problem
All tactic testing done via ProofStep proof state manipulation
"""

from typing import Dict, List, Tuple, Optional
from dataclasses import dataclass
from datetime import datetime
import json
import os

from decompose_hole_merge_pipeline import DecomposeHoleMergePipeline
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
    """
    
    def __init__(self, output_base_dir: str = "minimal_verification_results"):
        self.output_base_dir = output_base_dir
        self.decompose_pipeline = DecomposeHoleMergePipeline()
        os.makedirs(self.output_base_dir, exist_ok=True)
        
    def process_problem_with_constraint(self, problem: Problem) -> MinimalVerificationResult:
        """
        Process a single problem with strict verification constraint
        
        Args:
            problem: Problem to process
            
        Returns:
            MinimalVerificationResult with constraint satisfaction info
        """
        start_time = datetime.now()
        integrator = MinimalLeanProofStepIntegrator()
        
        try:
            print(f"\n🎯 Processing {problem.dataset}/{problem.problem_id} with minimal verification")
            
            # Get problem content
            header_content = problem_manager.get_header_content(problem)
            original_content = problem_manager.get_problem_content(problem)
            
            # VERIFICATION 1: Original problem
            print("🔍 Verification 1/3: Original problem")
            original_verification_pass = integrator.verify_proof_with_limit(
                header_content, original_content, "original problem"
            )
            print(f"  Result: {'PASS' if original_verification_pass else 'FAIL'}")
            
            # Use existing clear version file if available
            clear_version_path = f"/home/matheye/lean-pl-fix/decomposition_results/{problem.dataset}/decomposed/{problem.problem_id}/clear_version.lean"
            
            if os.path.exists(clear_version_path):
                print("📋 Using existing clear version file...")
                with open(clear_version_path, 'r') as f:
                    clear_with_macros = f.read()
            else:
                print("📋 Generating new hole and clear versions...")
                hole_content, hole_list = self.decompose_pipeline.generate_in_place_holes(problem)
                clear_content = self.decompose_pipeline.generate_clear_version(hole_content, hole_list)
                
                # Create macros for clear version
                hole_macros = []
                for hole_info in hole_list:
                    hole_id = hole_info['hole_id']
                    hole_macros.append(f'macro "{hole_id}" : tactic => `(tactic| sorry)')
                hole_macros.append('macro "skip_hole" : term => `(sorry)')
                
                clear_with_macros = '\n'.join(hole_macros) + '\n\n' + clear_content
            
            # VERIFICATION 2: Clear version (hole verification)
            print("🔍 Verification 2/3: Hole/clear version")
            hole_verification_pass = integrator.verify_proof_with_limit(
                header_content, clear_with_macros, "hole/clear version"
            )
            clear_verification_pass = hole_verification_pass  # Same verification
            print(f"  Result: {'PASS' if hole_verification_pass else 'FAIL'}")
            
            # ProofStep enumeration phase (NO full verifications)
            print("🧪 ProofStep enumeration phase (proof state testing only)...")
            
            # Identify enumerable vs skip indices using the clear version content
            session_analyzer = ProofStepIntegrator()
            session = session_analyzer.initialize_session(clear_with_macros)
            enumerable_indices = session.enumerable_indices
            
            print(f"  🔍 Debugging: Found {len(session.sorry_map)} sorry mappings")
            for idx, sorry_info in session.sorry_map.items():
                print(f"    {idx}: {sorry_info.macro_type} ({sorry_info.hole_id}) -> {'ENUM' if sorry_info.should_enumerate else 'SKIP'}")
            
            print(f"  📊 {len(enumerable_indices)} enumerable holes, {len(session.skip_indices)} skip holes")
            
            # Run ProofStep enumeration with proof states
            unigrams = ["norm_num", "linarith", "nlinarith", "omega", "ring", "ring_nf", "simp", "simpa", "field_simp", "positivity", "norm_cast"]
            
            # Use the clear version file directly for ProofStep (avoid file creation issues)
            proofstep_results = integrator.enumerate_tactics_with_proof_states_file(
                clear_version_path, unigrams, enumerable_indices
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
                    old_macro = f'macro "{sorry_info.hole_id}" : tactic => `(tactic| sorry)'
                    new_macro = f'macro "{sorry_info.hole_id}" : tactic => `(tactic| {tactic})'
                    filled_content = filled_content.replace(old_macro, new_macro)
                    print(f"  ✅ {sorry_info.hole_id} -> {tactic}")
            
            # VERIFICATION 3: Final filled proof
            print("🔍 Verification 3/3: Final filled proof")
            filled_verification_pass = integrator.verify_proof_with_limit(
                header_content, filled_content, "final filled proof"
            )
            print(f"  Result: {'PASS' if filled_verification_pass else 'FAIL'}")
            
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
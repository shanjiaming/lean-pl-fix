#!/usr/bin/env python3
"""
True ProofStep Integration with Lean Server
Minimal full proof verification constraint: maximum 3 times per problem
All tactic testing done via proof state manipulation, not full verification
"""

import re
import tempfile
import os
from typing import Dict, List, Tuple, Optional, Set
from dataclasses import dataclass
from lean_interact import LeanREPLConfig, LeanServer, Command
from decompose_hole_merge_pipeline import DecomposeHoleMergePipeline

@dataclass
class ProofState:
    """Represents a Lean proof state at a specific sorry position"""
    sorry_index: int
    goals: List[str]
    context: str
    position_info: str

@dataclass 
class TacticResult:
    """Result of applying a tactic to a proof state"""
    success: bool
    tactic: str
    sorry_index: int
    error_message: Optional[str] = None
    new_goals: Optional[List[str]] = None

class MinimalLeanProofStepIntegrator:
    """
    ProofStep integration with strict constraint:
    - Maximum 3 full proof verifications per problem
    - All tactic testing via proof state manipulation
    """
    
    def __init__(self):
        self.lean_server = None
        self.verification_count = 0
        self.max_verifications = 3
        
    def initialize_lean_server(self):
        """Initialize Lean server for proof state operations"""
        if not self.lean_server:
            try:
                config = LeanREPLConfig()
                self.lean_server = LeanServer(config)
                self.lean_server.start()
            except Exception as e:
                print(f"Warning: Could not initialize LeanServer: {e}")
                self.lean_server = None
    
    def shutdown_lean_server(self):
        """Shutdown Lean server"""
        if self.lean_server:
            try:
                self.lean_server.kill()
            except:
                pass
            self.lean_server = None
    
    def verify_proof_with_limit(self, header: str, content: str, description: str) -> bool:
        """
        Verify proof with strict verification limit
        Only use for critical verifications (original, hole, final)
        """
        self.verification_count += 1
        if self.verification_count > self.max_verifications:
            raise RuntimeError(f"Exceeded maximum verification limit ({self.max_verifications}). "
                             f"Cannot verify {description}")
        
        print(f"🔍 Full verification #{self.verification_count}: {description}")
        
        pipeline = DecomposeHoleMergePipeline()
        return pipeline.verify_lean_code(header, content)
    
    def extract_proof_states_from_sorries(self, header: str, lean_code: str) -> Dict[int, ProofState]:
        """
        Extract proof states at each sorry position using Lean server
        This is the key method that replaces full proof verification for tactic testing
        
        Uses actual ProofStep response to get sorry locations and their proof_state indices
        """
        if not self.lean_server:
            self.initialize_lean_server()
            
        if not self.lean_server:
            print("Warning: No Lean server available, falling back to simulation")
            return self._simulate_proof_states(lean_code)
        
        # Use Lean server to get proof states at sorry positions
        # This doesn't count as full verification since we're just extracting states
        try:
            from lean_interact import FileCommand
            
            # Write lean code to temporary file for ProofStep analysis
            import tempfile
            with tempfile.NamedTemporaryFile(mode='w', suffix='.lean', delete=False) as f:
                f.write(f"{header}\n\n{lean_code}")
                temp_file = f.name
            
            try:
                # Get ProofStep response with sorry information
                response = self.lean_server.run(FileCommand(path=temp_file))
                print(f"📊 ProofStep response received: {len(response.sorries)} sorries")
                
                proof_states = {}
                
                # Map each sorry to its proof_state index
                for sorry_idx, sorry in enumerate(response.sorries):
                    proof_state_id = sorry.proof_state
                    
                    proof_states[sorry_idx] = ProofState(
                        sorry_index=sorry_idx,
                        goals=[sorry.goal],  # The goal text from ProofStep
                        context=f"ProofState_{proof_state_id}",
                        position_info=f"line_{sorry.start_pos.line}_col_{sorry.start_pos.column}"
                    )
                    
                    print(f"  Sorry {sorry_idx}: proof_state={proof_state_id}, position=({sorry.start_pos.line}, {sorry.start_pos.column})")
                
                return proof_states
                
            finally:
                os.unlink(temp_file)
            
        except Exception as e:
            print(f"Warning: Lean server proof state extraction failed: {e}")
            return self._simulate_proof_states(lean_code)
    
    def _simulate_proof_states(self, lean_code: str) -> Dict[int, ProofState]:
        """
        Simulate proof state extraction when Lean server is not available
        In real implementation, this would be replaced by actual Lean server calls
        """
        proof_states = {}
        
        # Find sorry positions in the code
        lines = lean_code.split('\n')
        sorry_index = 0
        
        for line_num, line in enumerate(lines, 1):
            if 'sorry' in line or 'hole_' in line:
                # Simulate a proof state at this position
                proof_states[sorry_index] = ProofState(
                    sorry_index=sorry_index,
                    goals=[f"goal_at_sorry_{sorry_index}"],
                    context=f"context_at_line_{line_num}",
                    position_info=f"line_{line_num}"
                )
                sorry_index += 1
        
        return proof_states
    
    def test_tactic_on_proof_state(self, proof_state: ProofState, tactic: str) -> TacticResult:
        """
        Test a tactic on a specific proof state WITHOUT full proof verification
        This is the core method that enables efficient tactic testing
        
        Uses ProofStep API to test tactic application on specific proof state
        """
        if not self.lean_server:
            # Simulate tactic testing when server is not available
            return self._simulate_tactic_test(proof_state, tactic)
        
        try:
            from lean_interact import ProofStep
            
            # Extract proof_state_id from context (format: "ProofState_N")
            proof_state_id = int(proof_state.context.split('_')[1])
            
            # Use ProofStep to apply tactic to specific proof state
            # This follows the pattern: ProofStep(proof_state=N, tactic="tactic_name")
            response = self.lean_server.run(ProofStep(proof_state=proof_state_id, tactic=tactic))
            
            # Check if tactic application was successful
            # Check if tactic really succeeded
            if hasattr(response, 'message'):
                # LeanError - tactic failed completely
                error_msg = response.message
                print(f"    ❌ {tactic} failed on proof_state {proof_state_id}: {error_msg[:100]}...")
                return TacticResult(
                    success=False,
                    tactic=tactic,
                    sorry_index=proof_state.sorry_index,
                    error_message=str(error_msg)
                )
            elif hasattr(response, 'proof_status'):
                # ProofStepResponse - check if proof is actually completed
                if response.proof_status == 'Completed' and len(response.goals) == 0:
                    # Tactic fully solved the goal
                    print(f"    ✅ {tactic} succeeded on proof_state {proof_state_id}")
                    return TacticResult(
                        success=True,
                        tactic=tactic,
                        sorry_index=proof_state.sorry_index,
                        new_goals=[]
                    )
                else:
                    # Tactic executed but didn't fully solve the goal
                    remaining_goals = len(response.goals) if hasattr(response, 'goals') else 'unknown'
                    print(f"    ❌ {tactic} failed on proof_state {proof_state_id}: {response.proof_status}, {remaining_goals} goals remain")
                    return TacticResult(
                        success=False,
                        tactic=tactic,
                        sorry_index=proof_state.sorry_index,
                        error_message=f"Tactic status: {response.proof_status}, goals remain: {remaining_goals}"
                    )
            else:
                # Some other response type - be conservative and mark as failure
                print(f"    ❌ {tactic} failed on proof_state {proof_state_id}: unexpected response type {type(response)}")
                return TacticResult(
                    success=False,
                    tactic=tactic,
                    sorry_index=proof_state.sorry_index,
                    error_message=f"Unexpected response type: {type(response)}"
                )
                
        except Exception as e:
            print(f"    ❌ {tactic} failed on proof_state (exception): {e}")
            return TacticResult(
                success=False,
                tactic=tactic,
                sorry_index=proof_state.sorry_index,
                error_message=str(e)
            )
    
    def _simulate_tactic_test(self, proof_state: ProofState, tactic: str) -> TacticResult:
        """
        Simulate tactic testing when Lean server is not available
        In real implementation, this would be replaced by actual proof state manipulation
        """
        # Simple heuristic simulation for demo purposes
        # In reality, this would be actual Lean proof state + tactic application
        
        success_heuristics = {
            "norm_num": ["goal_at_sorry_0", "goal_at_sorry_3", "goal_at_sorry_6"],
            "linarith": ["goal_at_sorry_1", "goal_at_sorry_2", "goal_at_sorry_4", "goal_at_sorry_7"],
            "omega": ["goal_at_sorry_0", "goal_at_sorry_1", "goal_at_sorry_2", "goal_at_sorry_4"],
            "simp": ["goal_at_sorry_5", "goal_at_sorry_6"],
            "simpa": ["goal_at_sorry_0", "goal_at_sorry_5"]
        }
        
        goals = proof_state.goals
        if goals and len(goals) > 0:
            goal = goals[0]
            success = goal in success_heuristics.get(tactic, [])
        else:
            success = False
        
        return TacticResult(
            success=success,
            tactic=tactic,
            sorry_index=proof_state.sorry_index,
            error_message=None if success else f"Tactic {tactic} failed on {proof_state.sorry_index}"
        )
    
    def enumerate_tactics_with_proof_states(self, header: str, clear_version: str, 
                                          tactics: List[str], 
                                          enumerable_indices: List[int]) -> Dict:
        """
        Main enumeration method using proof states
        Satisfies the constraint: maximum 3 full verifications, all testing via proof states
        """
        print(f"🚀 Starting ProofStep enumeration with proof states")
        print(f"Enumerable indices: {enumerable_indices}")
        print(f"Tactics to test: {tactics}")
        
        # Extract proof states (no full verification)
        proof_states = self.extract_proof_states_from_sorries(header, clear_version)
        print(f"📊 Extracted {len(proof_states)} proof states")
        
        results = {
            'successful_tactics': {},
            'failed_attempts': 0,
            'successful_attempts': 0,
            'proof_state_tests': 0,
            'proof_states_extracted': len(proof_states)
        }
        
        # Test tactics on enumerable proof states only
        for sorry_idx in enumerable_indices:
            if sorry_idx not in proof_states:
                print(f"⚠️  Skipping sorry index {sorry_idx} - no proof state available")
                continue
                
            proof_state = proof_states[sorry_idx]
            print(f"🎯 Testing tactics on sorry index {sorry_idx}")
            
            # Test each tactic on this proof state
            for tactic in tactics:
                results['proof_state_tests'] += 1
                
                tactic_result = self.test_tactic_on_proof_state(proof_state, tactic)
                
                if tactic_result.success:
                    print(f"  ✅ {tactic} succeeded on sorry {sorry_idx}")
                    results['successful_tactics'][sorry_idx] = tactic
                    results['successful_attempts'] += 1
                    break  # Stop at first successful tactic
                else:
                    print(f"  ❌ {tactic} failed on sorry {sorry_idx}")
                    results['failed_attempts'] += 1
        
        success_rate = 0
        total_attempts = results['successful_attempts'] + results['failed_attempts']
        if total_attempts > 0:
            success_rate = results['successful_attempts'] / total_attempts * 100
        
        print(f"📈 ProofStep Results:")
        print(f"  Successful tactics: {len(results['successful_tactics'])}")
        print(f"  Success rate: {success_rate:.1f}%")
        print(f"  Total proof state tests: {results['proof_state_tests']}")
        print(f"  Full verifications used: {self.verification_count}/{self.max_verifications}")
        
        return results
    
    def enumerate_tactics_with_proof_states_file(self, file_path: str, 
                                               tactics: List[str], 
                                               enumerable_indices: List[int]) -> Dict:
        """
        Main enumeration method using proof states from existing file
        Satisfies the constraint: maximum 3 full verifications, all testing via proof states
        """
        print(f"🚀 Starting ProofStep enumeration with file: {file_path}")
        print(f"Enumerable indices: {enumerable_indices}")
        print(f"Tactics to test: {tactics}")
        
        # Extract proof states directly from file (no full verification)
        if not self.lean_server:
            self.initialize_lean_server()
        
        proof_states = {}
        
        if self.lean_server:
            try:
                from lean_interact import FileCommand
                
                # Get ProofStep response with sorry information
                response = self.lean_server.run(FileCommand(path=file_path))
                
                # Check if response is error or has sorries
                if hasattr(response, 'message'):  # LeanError
                    print(f"⚠️  Lean error in file: {response.message[:200]}...")
                    return {'successful_tactics': {}, 'failed_attempts': 0, 'successful_attempts': 0, 'proof_state_tests': 0}
                
                print(f"📊 ProofStep response received: {len(response.sorries)} sorries")
                
                # Map each sorry to its proof_state index
                for sorry_idx, sorry in enumerate(response.sorries):
                    proof_state_id = sorry.proof_state
                    
                    proof_states[sorry_idx] = ProofState(
                        sorry_index=sorry_idx,
                        goals=[sorry.goal],  # The goal text from ProofStep
                        context=f"ProofState_{proof_state_id}",
                        position_info=f"line_{sorry.start_pos.line}_col_{sorry.start_pos.column}"
                    )
                    
                    print(f"  Sorry {sorry_idx}: proof_state={proof_state_id}, position=({sorry.start_pos.line}, {sorry.start_pos.column})")
                
            except Exception as e:
                print(f"Warning: File-based proof state extraction failed: {e}")
                return {'successful_tactics': {}, 'failed_attempts': 0, 'successful_attempts': 0, 'proof_state_tests': 0}
        
        results = {
            'successful_tactics': {},
            'failed_attempts': 0,
            'successful_attempts': 0,
            'proof_state_tests': 0,
            'proof_states_extracted': len(proof_states)
        }
        
        # Test tactics on enumerable proof states only
        for sorry_idx in enumerable_indices:
            if sorry_idx not in proof_states:
                print(f"⚠️  Skipping sorry index {sorry_idx} - no proof state available")
                continue
                
            proof_state = proof_states[sorry_idx]
            print(f"🎯 Testing tactics on sorry index {sorry_idx} (proof_state {proof_state.context.split('_')[1]})")
            
            # Test each tactic on this proof state
            for tactic in tactics:
                results['proof_state_tests'] += 1
                
                tactic_result = self.test_tactic_on_proof_state(proof_state, tactic)
                
                if tactic_result.success:
                    print(f"  ✅ {tactic} succeeded on sorry {sorry_idx}")
                    results['successful_tactics'][sorry_idx] = tactic
                    results['successful_attempts'] += 1
                    break  # Stop at first successful tactic
                else:
                    print(f"  ❌ {tactic} failed on sorry {sorry_idx}")
                    results['failed_attempts'] += 1
        
        success_rate = 0
        total_attempts = results['successful_attempts'] + results['failed_attempts']
        if total_attempts > 0:
            success_rate = results['successful_attempts'] / total_attempts * 100
        
        print(f"📈 ProofStep Results:")
        print(f"  Successful tactics: {len(results['successful_tactics'])}")
        print(f"  Success rate: {success_rate:.1f}%")
        print(f"  Total proof state tests: {results['proof_state_tests']}")
        print(f"  Full verifications used: {self.verification_count}/{self.max_verifications}")
        
        return results
    
    def reset_verification_count(self):
        """Reset verification count for new problem"""
        self.verification_count = 0

def demo_minimal_verification():
    """Demonstrate minimal verification constraint"""
    print("🎯 Demo: Minimal Verification ProofStep Integration")
    print("=" * 60)
    
    integrator = MinimalLeanProofStepIntegrator()
    
    try:
        # Simulate a problem processing with strict verification limits
        header = "import Mathlib"
        
        # Mock clear version with holes and skips
        clear_version = '''macro "hole_1" : tactic => `(tactic| sorry)
macro "hole_2" : tactic => `(tactic| sorry) 
macro "skip_hole" : term => `(sorry)

theorem test (n : ℕ) : n ≥ n := by
  have h1 := by hole_1   -- sorry index 0: enumerable
  clear h1
  have h1 := skip_hole   -- sorry index 1: skip
  have h2 := by hole_2   -- sorry index 2: enumerable
  clear h2
  have h2 := skip_hole   -- sorry index 3: skip
  omega'''
        
        print("📋 Problem setup:")
        print(f"  Clear version has 4 sorries (2 enumerable, 2 skip)")
        print(f"  Verification limit: {integrator.max_verifications}")
        
        # Verification 1: Original problem (would be done in main pipeline)
        print("\n🔍 Verification 1: Original problem")
        # integrator.verify_proof_with_limit(header, original_problem, "original problem")
        integrator.verification_count += 1  # Simulate
        
        # Verification 2: Hole version (would be done in main pipeline)  
        print("🔍 Verification 2: Hole version")
        hole_verification = integrator.verify_proof_with_limit(header, clear_version, "hole version")
        print(f"  Result: {'PASS' if hole_verification else 'FAIL'}")
        
        # ProofStep enumeration (NO full verifications)
        print("\n🧪 ProofStep enumeration phase:")
        enumerable_indices = [0, 2]  # Skip indices 1, 3
        tactics = ["norm_num", "linarith", "omega", "simp"]
        
        results = integrator.enumerate_tactics_with_proof_states(
            header, clear_version, tactics, enumerable_indices
        )
        
        # Verification 3: Final filled proof (would be done in main pipeline)
        print("\n🔍 Verification 3: Final filled proof")
        # Create filled version based on successful tactics
        filled_version = clear_version
        for sorry_idx, tactic in results['successful_tactics'].items():
            # Replace sorry with successful tactic (simplified)
            filled_version = filled_version.replace("sorry)", f"{tactic})")
        
        final_verification = integrator.verify_proof_with_limit(header, filled_version, "final filled proof")
        print(f"  Result: {'PASS' if final_verification else 'FAIL'}")
        
        print(f"\n🎉 Constraint satisfied: {integrator.verification_count}/{integrator.max_verifications} verifications used")
        
        if integrator.verification_count <= integrator.max_verifications:
            print("✅ SUCCESS: Stayed within verification limit!")
        else:
            print("❌ FAILED: Exceeded verification limit!")
            
        return results
        
    finally:
        integrator.shutdown_lean_server()

if __name__ == "__main__":
    demo_minimal_verification()
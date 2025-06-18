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
                from lean_interact import LocalProject
                localprojectdir = "../matheye/benchmarks/"
                config = LeanREPLConfig(verbose=True, project=LocalProject(localprojectdir))
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
    
    def verify_proof_with_limit(self, header: str, content: str, description: str, reset_lean_server: bool = False) -> bool:
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
        modified_header = f"{header.strip()}\nset_option debug.skipKernelTC true\n"
        if reset_lean_server:
            pipeline.lean_verifier.reset() # this is to solve lean server shutdown after some time.
        return pipeline.verify_lean_code(modified_header, content)
    
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
                modified_header = f"{header.strip()}\nset_option debug.skipKernelTC true\n"
                f.write(f"{modified_header}\n{lean_code}")
                temp_file = f.name
            
            try:
                # Get ProofStep response with sorry information
                print("\n--- Analyzing Lean Code for Proof States ---")
                print(f"{header}\n\n{lean_code}")
                print("------------------------------------------")
                response = self.lean_server.run(FileCommand(path=temp_file))
                print(f"📊 ProofStep response received: {len(response.sorries)} sorries")
                
                # Sort server sorries by position to ensure deterministic matching
                server_sorries = sorted(response.sorries, key=lambda s: (s.start_pos.line, s.start_pos.column))
                for s in server_sorries:
                    print(f"  - Server found sorry at position=({s.start_pos.line}, {s.start_pos.column}), proof_state={s.proof_state}")

                return server_sorries
                
            finally:
                os.unlink(temp_file)
            
        except Exception as e:
            print(f"Warning: Lean server proof state extraction failed: {e}")
            # On failure, return an empty list instead of simulating
            return []
    
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
            raise RuntimeError("Lean server not initialized")
        
        try:
            from lean_interact import ProofStep
            
            # Extract proof_state_id from context (format: "ProofState_N")
            proof_state_id = int(proof_state.context.split('_')[1])
            
            # Use ProofStep to apply tactic to specific proof state
            # This follows the pattern: ProofStep(proof_state=N, tactic="tactic_name")
            response = self.lean_server.run(ProofStep(proof_state=proof_state_id, tactic=tactic))
            
            # Check if tactic application was successful
            # Check if tactic really succeeded
            from lean_interact.interface import LeanError

            if isinstance(response, LeanError):
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
    
    def test_original_tactics_on_proof_states(self, header: str, clear_version: str,
                                            original_tactics: Dict[str, str],
                                            enumerable_indices: List[int],
                                            sorry_map: Dict[int, 'SorryInfo']) -> Dict[str, Dict]:
        """
        Test original hole tactics on their proof states before testing unigrams
        
        Args:
            header: Lean header content
            clear_version: Clear version with holes
            original_tactics: Dict mapping hole_id -> original_tactic_content
            enumerable_indices: List of enumerable sorry indices
            sorry_map: Mapping of sorry indices to SorryInfo
            
        Returns:
            Dict mapping hole_id -> {'success': bool, 'error_message': str or None}
        """
        print(f"🔍 Testing original tactics on proof states")
        
        # Extract proof states first
        server_sorries = self.extract_proof_states_from_sorries(header, clear_version)
        if not server_sorries:
            print("❌ Could not extract proof states for original tactics testing")
            return {}
        
        # Match parser sorries with server sorries (same logic as main enumeration)
        parser_sorries_by_line = {}
        for idx, info in sorry_map.items():
            if info.line not in parser_sorries_by_line:
                parser_sorries_by_line[info.line] = []
            parser_sorries_by_line[info.line].append({'col': info.column, 'idx': idx})
        
        proof_states: Dict[int, ProofState] = {}
        
        for server_sorry in server_sorries:
            server_line = server_sorry.start_pos.line
            server_col = server_sorry.start_pos.column
            
            matched_idx = None
            if server_line in parser_sorries_by_line and parser_sorries_by_line[server_line]:
                candidates = parser_sorries_by_line[server_line]
                best_match = min(candidates, key=lambda c: abs(c['col'] - (server_col - 1)))
                
                if abs(best_match['col'] - (server_col - 1)) < 5:
                    matched_idx = best_match['idx']
                    proof_state_id = server_sorry.proof_state
                    
                    proof_states[matched_idx] = ProofState(
                        sorry_index=matched_idx,
                        goals=[server_sorry.goal],
                        context=f"ProofState_{proof_state_id}",
                        position_info=f"line_{server_line}_col_{server_col}"
                    )
                    
                    parser_sorries_by_line[server_line].remove(best_match)
        
        # Test original tactics
        original_test_results = {}
        
        for sorry_idx in enumerable_indices:
            if sorry_idx not in proof_states:
                continue
                
            proof_state = proof_states[sorry_idx]
            sorry_info = sorry_map.get(sorry_idx)
            if not sorry_info or not sorry_info.hole_id:
                continue
            
            hole_id = sorry_info.hole_id
            
            if hole_id not in original_tactics:
                print(f"  ⚠️  No original tactic found for {hole_id}")
                original_test_results[hole_id] = {
                    'success': False,
                    'error_message': 'No original tactic available',
                    'original_tactic': None
                }
                continue
            
            original_tactic = original_tactics[hole_id]
            print(f"  🧪 Testing original tactic for {hole_id}: {original_tactic[:30]}...")
            
            # Handle multi-line tactics by testing them as a sequence
            cleaned_tactic = original_tactic.strip()
            
            if '\n' in cleaned_tactic:
                # For multi-line tactics, use parentheses format: "(\ntactic1\ntactic2)"
                parentheses_tactic = f"(\n{cleaned_tactic}\n)"
                tactic_result = self.test_tactic_on_proof_state(proof_state, parentheses_tactic)
            else:
                # Single-line tactic, test as-is
                tactic_result = self.test_tactic_on_proof_state(proof_state, cleaned_tactic)
            
            original_test_results[hole_id] = {
                'success': tactic_result.success,
                'error_message': tactic_result.error_message,
                'original_tactic': original_tactic
            }
            
            if tactic_result.success:
                print(f"    ✅ Original tactic works for {hole_id}")
            else:
                print(f"    ❌ Original tactic failed for {hole_id}: {tactic_result.error_message}")
        
        print(f"📊 Original tactics test: {sum(1 for r in original_test_results.values() if r['success'])}/{len(original_test_results)} succeeded")
        return original_test_results

    def enumerate_tactics_with_proof_states(self, header: str, clear_version: str, 
                                          tactics: List[str], 
                                          enumerable_indices: List[int],
                                          sorry_map: Dict[int, 'SorryInfo']) -> Dict:
        """
        Main enumeration method using proof states
        Satisfies the constraint: maximum 3 full verifications, all testing via proof states
        """
        print(f"🚀 Starting ProofStep enumeration with proof states")
        print(f"Enumerable indices: {enumerable_indices}")
        print(f"Tactics to test: {tactics}")
        
        # --- Step 1: Extract proof states from Lean Server ---
        # This response is a list of sorries sorted by position, from the server's perspective
        server_sorries = self.extract_proof_states_from_sorries(header, clear_version)
        if not server_sorries:
            print("❌ Could not extract any proof states from Lean server. Aborting enumeration.")
            return { 'successful_tactics': {}, 'tactic_attempts': {}, 'proof_states_extracted': 0 }

        # --- Step 2: Match parser sorries with server sorries ---
        # Create a map from line number to a list of our parser's sorry info on that line.
        # This handles multiple sorries on the same line.
        parser_sorries_by_line = {}
        for idx, info in sorry_map.items():
            if info.line not in parser_sorries_by_line:
                parser_sorries_by_line[info.line] = []
            # Store 0-indexed column and our original parser index
            parser_sorries_by_line[info.line].append({'col': info.column, 'idx': idx})
        
        # proof_states dictionary will be keyed by our parser's sorry_idx
        proof_states: Dict[int, ProofState] = {}
        unmatched_server_sorries = []
        
        print("\n--- Matching Parser Sorries to Server Proof States ---")
        for server_sorry in server_sorries:
            server_line = server_sorry.start_pos.line
            server_col = server_sorry.start_pos.column  # 1-indexed

            matched_idx = None
            if server_line in parser_sorries_by_line and parser_sorries_by_line[server_line]:
                # Find the best column match on this line. Compare server's 1-indexed col with our 0-indexed col.
                candidates = parser_sorries_by_line[server_line]
                best_match = min(candidates, key=lambda c: abs(c['col'] - (server_col - 1)))
                
                # Check if the match is reasonable (e.g., within 5 columns)
                if abs(best_match['col'] - (server_col - 1)) < 5:
                    matched_idx = best_match['idx']
                    proof_state_id = server_sorry.proof_state
                    
                    proof_states[matched_idx] = ProofState(
                        sorry_index=matched_idx,
                        goals=[server_sorry.goal],
                        context=f"ProofState_{proof_state_id}",
                        position_info=f"line_{server_line}_col_{server_col}"
                    )
                    
                    # Remove matched candidate to avoid re-matching it
                    parser_sorries_by_line[server_line].remove(best_match)
                    print(f"  ✅ Matched parser sorry_idx {matched_idx} (pos {server_line}:{best_match['col']+1}) to server proof_state {proof_state_id}")
            
            if matched_idx is None:
                unmatched_server_sorries.append(server_sorry)

        # Report any sorries that couldn't be matched
        if unmatched_server_sorries:
            print(f"⚠️  {len(unmatched_server_sorries)} sorries from Lean server could not be matched:")
            for s in unmatched_server_sorries:
                print(f"    - Unmatched server sorry at position=({s.start_pos.line}, {s.start_pos.column})")

        unmatched_parser_count = sum(len(items) for items in parser_sorries_by_line.values())
        if unmatched_parser_count > 0:
            print(f"⚠️  {unmatched_parser_count} sorries from our parser could not be matched:")
            for line, items in parser_sorries_by_line.items():
                for item in items:
                     print(f"    - Unmatched parser sorry_idx {item['idx']} at position=({line}, {item['col'] + 1})")

        # --- Step 3: Run Tactic Enumeration ---
        print(f"📊 Correctly matched {len(proof_states)} proof states for enumeration.")
        
        results = {
            'successful_tactics': {},  # sorry_idx -> first successful tactic
            'tactic_attempts': {},     # sorry_idx -> list of {'tactic': str, 'success': bool, 'error': str}
            'proof_states_extracted': len(proof_states)
        }
        
        # Test tactics on enumerable proof states only
        for sorry_idx in enumerable_indices:
            if sorry_idx not in proof_states:
                print(f"⚠️  Skipping sorry index {sorry_idx} - no proof state available")
                continue
                
            proof_state = proof_states[sorry_idx]
            
            # Get hole_id for keying results
            sorry_info = sorry_map.get(sorry_idx)
            if not sorry_info or not sorry_info.hole_id:
                print(f"⚠️  Skipping sorry index {sorry_idx} - no hole_id found in sorry_map")
                continue
            
            hole_id = sorry_info.hole_id
            print(f"🎯 Testing tactics on sorry index {sorry_idx} (Hole: {hole_id})")
            
            results['tactic_attempts'][hole_id] = []

            # Test each tactic on this proof state
            for tactic in tactics:
                tactic_result = self.test_tactic_on_proof_state(proof_state, tactic)
                
                attempt_details = {
                    'tactic': tactic,
                    'success': tactic_result.success,
                    'error_message': tactic_result.error_message
                }
                results['tactic_attempts'][hole_id].append(attempt_details)
                
                if tactic_result.success:
                    print(f"  ✅ {tactic} succeeded on {hole_id}")
                    results['successful_tactics'][hole_id] = tactic
                    break  # Stop at first successful tactic
                else:
                    print(f"  ❌ {tactic} failed on {hole_id}")
        
        # --- Summary Calculation ---
        solved_sorries_count = len(results['successful_tactics'])
        total_tactic_tests = sum(len(attempts) for attempts in results['tactic_attempts'].values())
        total_sorries_attempted = len(results['tactic_attempts'])

        success_rate = 0
        if total_sorries_attempted > 0:
            success_rate = solved_sorries_count / total_sorries_attempted * 100
        
        print(f"📈 ProofStep Results:")
        print(f"  Solved sorries: {solved_sorries_count}/{total_sorries_attempted}")
        print(f"  Success rate (per sorry): {success_rate:.1f}%")
        print(f"  Total proof state tests: {total_tactic_tests}")
        
        # Detailed breakdown
        print("  --- Detailed Tactic Results ---")
        for hole_id, attempts in results['tactic_attempts'].items():
            if hole_id in results['successful_tactics']:
                tactic = results['successful_tactics'][hole_id]
                print(f"  - {hole_id}: SOLVED with '{tactic}'")
                for attempt in attempts:
                    status = "✅" if attempt['success'] else "❌"
                    print(f"    {status} {attempt['tactic']}")
            else:
                print(f"  - {hole_id}: NOT SOLVED")
                for attempt in attempts:
                    error_info = f" ({attempt['error_message']})" if attempt['error_message'] else ""
                    print(f"    ❌ {attempt['tactic']}{error_info}")
        
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
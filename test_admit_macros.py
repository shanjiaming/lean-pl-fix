#!/usr/bin/env python3
"""Test if admit macros work with ProofStep"""

from lean_interact import Command, LeanServer, LeanREPLConfig, LocalProject, ProofStep

def test_admit_macros():
    # Setup Lean server
    localprojectdir = "../matheye/benchmarks/"
    config = LeanREPLConfig(verbose=True, project=LocalProject(localprojectdir))
    server = LeanServer(config)
    
    # Test code with admit macros (like in clear_version.lean)
    test_code = '''import Mathlib

macro "hole_2" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)
macro "skip_hole" : term => `(sorry)

theorem complex_have_chain (n : ℕ) (h : n > 0) : n + n ≥ n := by
  have h1 : n ≥ 1 := by
    hole_2
  clear h1
  have h1 : n ≥ 1 := skip_hole
  have h2 : n + n ≥ n + 1 := by
    have h3 : n ≥ 1 := h1
    have h4 : n + n = n + n := rfl
    have h5 : n + 1 ≤ n + n := by
      hole_4
    clear h5
    have h5 : n + 1 ≤ n + n := skip_hole
    hole_3
  clear h2
  have h2 : n + n ≥ n + 1 := skip_hole
  have h6 : n + 1 ≥ n := by
    hole_5
  clear h6
  have h6 : n + 1 ≥ n := skip_hole
  hole_1'''
    
    print("=== Testing admit macros with ProofStep ===")
    
    # First get file response
    response = server.run(Command(cmd=test_code))
    print(f"Command response: {type(response)}")
    
    if response.get_errors():
        print(f"Error: {response.get_errors()}")
        return
    
    print(f"Number of sorries: {len(response.sorries)}")
    for i, sorry in enumerate(response.sorries):
        print(f"Sorry {i}: proof_state={sorry.proof_state}, goal='{sorry.goal[:100]}...', pos=({sorry.start_pos.line}, {sorry.start_pos.column})")
    
    # Test tactics on the first sorry if available
    if response.sorries:
        print(f"\n=== Testing tactics on proof_state 0 ===")
        
        # Test omega
        omega_response = server.run(ProofStep(proof_state=0, tactic="omega"))
        print(f"Omega response: {omega_response}")
        print(f"  Type: {type(omega_response)}")
        if hasattr(omega_response, 'proof_status'):
            print(f"  Status: {omega_response.proof_status}")
            print(f"  Goals: {len(omega_response.goals) if hasattr(omega_response, 'goals') else 'N/A'}")
        
        # Test linarith
        linarith_response = server.run(ProofStep(proof_state=0, tactic="linarith"))
        print(f"Linarith response: {linarith_response}")
        print(f"  Type: {type(linarith_response)}")
        if hasattr(linarith_response, 'proof_status'):
            print(f"  Status: {linarith_response.proof_status}")
            print(f"  Goals: {len(linarith_response.goals) if hasattr(linarith_response, 'goals') else 'N/A'}")

if __name__ == "__main__":
    test_admit_macros()
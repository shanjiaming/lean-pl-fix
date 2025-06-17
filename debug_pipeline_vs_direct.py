#!/usr/bin/env python3
"""Compare pipeline ProofStep vs direct ProofStep"""

import os
from unified_problem_manager import problem_manager
from proofstep_lean_integration import MinimalLeanProofStepIntegrator
from lean_interact import FileCommand, LeanServer, LeanREPLConfig, LocalProject, ProofStep

def compare_pipeline_vs_direct():
    # Get demo problem
    problem = problem_manager.get_problem('demo', 'demo_complex_p1')
    header_content = problem_manager.get_header_content(problem)
    
    # Get the exact file path that pipeline uses
    clear_version_path = "decomposition_results/demo/decomposed/demo_complex_p1/clear_version.lean"
    absolute_clear_path = os.path.abspath(clear_version_path)
    
    print("=== Direct Test with File Path ===")
    
    # Setup same server as MinimalLeanProofStepIntegrator
    localprojectdir = "../matheye/benchmarks/"
    config = LeanREPLConfig(verbose=True, project=LocalProject(localprojectdir))
    server = LeanServer(config)
    server.start()
    
    try:
        # Test using FileCommand (like pipeline does)
        response = server.run(FileCommand(path=absolute_clear_path))
        print(f"FileCommand response: {len(response.sorries)} sorries")
        
        if response.sorries:
            # Test omega on first sorry
            print(f"\n=== Testing omega on proof_state 0 ===")
            omega_response = server.run(ProofStep(proof_state=0, tactic="omega"))
            print(f"Omega response: {omega_response}")
            print(f"  Type: {type(omega_response)}")
            if hasattr(omega_response, 'proof_status'):
                print(f"  Status: {omega_response.proof_status}")
                print(f"  Goals: {len(omega_response.goals) if hasattr(omega_response, 'goals') else 'N/A'}")
            
            # Test linarith
            print(f"\n=== Testing linarith on proof_state 0 ===")
            linarith_response = server.run(ProofStep(proof_state=0, tactic="linarith"))
            print(f"Linarith response: {linarith_response}")
            if hasattr(linarith_response, 'proof_status'):
                print(f"  Status: {linarith_response.proof_status}")
                print(f"  Goals: {len(linarith_response.goals) if hasattr(linarith_response, 'goals') else 'N/A'}")
            
    finally:
        server.kill()
    
    print(f"\n=== Pipeline Test ===")
    integrator = MinimalLeanProofStepIntegrator()
    
    # Read clear version content
    with open(clear_version_path, 'r') as f:
        clear_content = f.read()
    
    print("Clear version file content (first 20 lines):")
    for i, line in enumerate(clear_content.split('\n')[:20]):
        print(f"  {i+1}: {line}")
    
    # Also test what session_analyzer generates
    from proofstep_integration import ProofStepIntegrator
    session_analyzer = ProofStepIntegrator(header_content)
    session = session_analyzer.initialize_session(clear_content)
    
    print(f"\nSession analyzer found {len(session.sorry_map)} sorries")
    
    # Extract proof states like pipeline does
    proof_states = integrator.extract_proof_states_from_sorries(header_content, clear_content)
    print(f"Pipeline found {len(proof_states)} proof states")
    
    if 0 in proof_states:
        # Test omega on first proof state like pipeline does
        proof_state = proof_states[0]
        result = integrator.test_tactic_on_proof_state(proof_state, "omega")
        print(f"Pipeline omega result: success={result.success}")
        if result.error_message:
            print(f"  Error: {result.error_message}")
        
        # Test linarith
        result = integrator.test_tactic_on_proof_state(proof_state, "linarith")
        print(f"Pipeline linarith result: success={result.success}")
        if result.error_message:
            print(f"  Error: {result.error_message}")

if __name__ == "__main__":
    compare_pipeline_vs_direct()
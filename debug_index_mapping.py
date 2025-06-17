#!/usr/bin/env python3
"""Debug the index mapping between ProofStepIntegrator and MinimalLeanProofStepIntegrator"""

import os
from unified_problem_manager import problem_manager
from proofstep_integration import ProofStepIntegrator
from proofstep_lean_integration import MinimalLeanProofStepIntegrator

def debug_index_mapping():
    # Get demo problem
    problem = problem_manager.get_problem('demo', 'demo_complex_p1')
    header_content = problem_manager.get_header_content(problem)
    
    # Read clear version file
    clear_version_path = "decomposition_results/demo/decomposed/demo_complex_p1/clear_version.lean"
    with open(clear_version_path, 'r') as f:
        clear_with_macros = f.read()
    
    print("=== ProofStepIntegrator Analysis ===")
    session_analyzer = ProofStepIntegrator(header_content)
    session = session_analyzer.initialize_session(clear_with_macros)
    
    print(f"Found {len(session.sorry_map)} sorry mappings:")
    for idx, sorry_info in session.sorry_map.items():
        print(f"  {idx}: {sorry_info.macro_type} ({sorry_info.hole_id}) -> {'ENUM' if sorry_info.should_enumerate else 'SKIP'}")
    
    enumerable_indices = session.enumerable_indices
    print(f"Enumerable indices: {enumerable_indices}")
    
    print("\n=== MinimalLeanProofStepIntegrator Analysis ===")
    integrator = MinimalLeanProofStepIntegrator()
    
    # Debug: let's see what gets passed to extract_proof_states_from_sorries
    print(f"Header content length: {len(header_content)}")
    print(f"Clear content length: {len(clear_with_macros)}")
    print("First few lines of clear content:")
    for i, line in enumerate(clear_with_macros.split('\n')[:10]):
        print(f"  {i+1}: {line}")
    
    # Let's manually test what MinimalLeanProofStepIntegrator creates
    import tempfile
    from lean_interact import FileCommand, LeanServer, LeanREPLConfig, LocalProject
    
    # Create the exact same temporary file that MinimalLeanProofStepIntegrator would create
    with tempfile.NamedTemporaryFile(mode='w', suffix='.lean', delete=False) as f:
        f.write(f"{header_content}\n\n{clear_with_macros}")
        temp_file = f.name
    
    print(f"Created temp file: {temp_file}")
    print("Temp file contents:")
    with open(temp_file, 'r') as f:
        temp_content = f.read()
        for i, line in enumerate(temp_content.split('\n')[:15]):
            print(f"  {i+1}: {line}")
    
    # Test with the same lean server setup as MinimalLeanProofStepIntegrator
    localprojectdir = "../matheye/benchmarks/"
    config = LeanREPLConfig(verbose=True, project=LocalProject(localprojectdir))
    server = LeanServer(config)
    server.start()
    
    try:
        response = server.run(FileCommand(path=temp_file))
        print(f"📊 Direct ProofStep test: {len(response.sorries)} sorries")
        for i, sorry in enumerate(response.sorries):
            print(f"  Sorry {i}: proof_state={sorry.proof_state}, pos=({sorry.start_pos.line}, {sorry.start_pos.column})")
    finally:
        server.kill()
        import os
        os.unlink(temp_file)
    
    print(f"\nNow running original MinimalLeanProofStepIntegrator:")
    proof_states = integrator.extract_proof_states_from_sorries(header_content, clear_with_macros)
    
    print(f"Found {len(proof_states)} proof states:")
    for idx, proof_state in proof_states.items():
        print(f"  {idx}: context={proof_state.context}, position={proof_state.position_info}")
    
    print("\n=== Index Mapping Comparison ===")
    print("ProofStepIntegrator enumerable indices:", enumerable_indices)
    print("MinimalLeanProofStepIntegrator proof state indices:", list(proof_states.keys()))
    
    # Check if there's a mismatch
    available_proof_states = set(proof_states.keys())
    enumerable_set = set(enumerable_indices)
    
    missing_proof_states = enumerable_set - available_proof_states
    extra_proof_states = available_proof_states - enumerable_set
    
    if missing_proof_states:
        print(f"❌ Missing proof states for enumerable indices: {missing_proof_states}")
    if extra_proof_states:
        print(f"⚠️  Extra proof states not in enumerable indices: {extra_proof_states}")
    
    if not missing_proof_states and not extra_proof_states:
        print("✅ Perfect index mapping!")
    
    # Test a simple tactic on the first enumerable index
    if enumerable_indices and enumerable_indices[0] in proof_states:
        test_idx = enumerable_indices[0]
        print(f"\n=== Testing 'omega' on index {test_idx} ===")
        
        proof_state = proof_states[test_idx]
        result = integrator.test_tactic_on_proof_state(proof_state, "omega")
        
        print(f"Result: success={result.success}, tactic={result.tactic}")
        if result.error_message:
            print(f"Error: {result.error_message}")

if __name__ == "__main__":
    debug_index_mapping()
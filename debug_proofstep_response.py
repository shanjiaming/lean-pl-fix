from lean_interact import Command, LeanServer, LeanREPLConfig, TempRequireProject, LocalProject, ProofStep
localprojectdir = "../matheye/benchmarks/"
config = LeanREPLConfig(verbose=True, project=LocalProject(localprojectdir))
print(config.__dict__)

server = LeanServer(config)

def test_proofstep_debug():
    header_file = "/home/matheye/lean-pl-fix/decomposition_results/demo/decomposed/demo_complex_p1/header.lean"
    # Test the clear version file
    clear_file = "/home/matheye/lean-pl-fix/decomposition_results/demo/decomposed/demo_complex_p1/clear_version.lean"
    filled_file = "/home/matheye/lean-pl-fix/decomposition_results/demo/decomposed/demo_complex_p1/synthesized_proof.lean"
    print("=== Testing ProofStep on clear_version.lean ===")
    
    with open(header_file, "r") as f:
        header = f.read()
    with open(filled_file, "r") as f:
        filled = f.read()
    with open(clear_file, "r") as f:
        clear = f.read()
    # response = server.run(Command(cmd=header + "\n" + filled))
    # print(f"Command response: {type(response)}")
    
    # if hasattr(response, 'messages'):
    #     print(f"Error: {response.messages}")
    #     return
    

    # First get file response
    response = server.run(Command(cmd=header + "\n" + clear))
    print(f"Command response: {type(response)}")
    
    if response.get_errors():
        print(f"Error: {response.get_errors()}")
        return

    print(f"Number of sorries: {len(response.sorries)}")
    for i, sorry in enumerate(response.sorries):
        print(f"Sorry {i}: proof_state={sorry.proof_state}, goal='{sorry.goal[:100]}...', pos=({sorry.start_pos.line}, {sorry.start_pos.column})")
    
    # Test simp on the first enumerable sorry (proof_state 0)
    if response.sorries:
        print(f"\n=== Testing 'simp' on proof_state 0 ===")
        
        simp_response = server.run(ProofStep(proof_state=0, tactic="simp"))
        print(f"Simp response: {simp_response}")

        simp_response = server.run(ProofStep(proof_state=0, tactic="www"))
        print(f"Simp response: {simp_response}")

        simp_response = server.run(ProofStep(proof_state=0, tactic="omega"))
        print(f"Simp response: {simp_response}")
        
if __name__ == "__main__":
    test_proofstep_debug()
import os
import tempfile
from turtle import setposition
from proofstep_lean_integration import MinimalLeanProofStepIntegrator
from lean_interact import PickleProofState, UnpickleProofState, FileCommand

# 1. Minimal Lean code
HEADER = """import Mathlib
import Aesop

setposition maxHeartbeats 0

open BigOperators Real Nat Topology Rat
"""
LEAN_CODE = """theorem aime_1983_p1 (x y z w : ℕ) (ht : 1 < x ∧ 1 < y ∧ 1 < z) (hw : 0 ≤ w)
    (h0 : Real.log w / Real.log x = 24) (h1 : Real.log w / Real.log y = 40)
    (h2 : Real.log w / Real.log (x * y * z) = 12) : Real.log w / Real.log z = 60 := by sorry"""

def main():
    # 2. Create temporary files
    lean_fd, lean_path = tempfile.mkstemp(suffix=".lean")
    pickle_fd, pickle_path = tempfile.mkstemp(suffix=".olean")
    with os.fdopen(lean_fd, 'w') as f: f.write(HEADER + LEAN_CODE)

    try:
        # 3. Phase 1: Pickle the proof state
        print("--- Phase 1: Pickling ---")
        integrator1 = MinimalLeanProofStepIntegrator()
        integrator1.initialize_lean_server()
        sorries = integrator1.extract_proof_states_from_sorries(HEADER, LEAN_CODE)
        ps_id = sorries[0].proof_state
        integrator1.lean_server.run(PickleProofState(proof_state=ps_id, pickle_to=pickle_path))
        integrator1.shutdown_lean_server()
        print(f"Pickled PS_{ps_id} to {os.path.basename(pickle_path)}")

        # 4. Phase 2: Unpickle in a new, clean server
        print("\\n--- Phase 2: Unpickling ---")
        integrator2 = MinimalLeanProofStepIntegrator()
        integrator2.initialize_lean_server()
        # CRITICAL: Re-establish environment before unpickling
        # integrator2.lean_server.run(FileCommand(path=lean_path, content=HEADER + LEAN_CODE))
        result = integrator2.lean_server.run(UnpickleProofState(unpickle_proof_state_from=pickle_path))
        integrator2.shutdown_lean_server()

        # 5. Verify result
        print(f"Result: {result}")
        assert 'error' not in str(result).lower(), "Unpickle failed!"
        print("\\n✅ SUCCESS: Core pickle/unpickle test passed!")

    finally:
        os.remove(lean_path)
        os.remove(pickle_path)

if __name__ == "__main__":
    main() 
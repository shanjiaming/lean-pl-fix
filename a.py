from lean_interact import Command, LeanServer, LeanREPLConfig, TempRequireProject, LocalProject, ProofStep

from proofstep_lean_integration import ProofState
localprojectdir = "../matheye/benchmarks/"
config = LeanREPLConfig(verbose=True, project=LocalProject(localprojectdir))
print(config.__dict__)
import psutil
current_memory_percent = psutil.virtual_memory().percent
print(current_memory_percent)
server = LeanServer(config)
response = server.run(Command(cmd="""import Mathlib
theorem eq_comm_demo (x y : ℕ) : x = y ↔ y = x := by
  constructor
  · 
    have a: x = y -> y = x := by
      intro h 
      rw [<- h]
      rw [h]
      <;>linarith
    exact a
  · 
    sorry

""", all_tactics=True))

current_memory_percent = psutil.virtual_memory().percent
print(current_memory_percent)

response = server.run(ProofStep(proof_state=0, tactic="""(
rw [a]
)""", ))
current_memory_percent = psutil.virtual_memory().percent
print(current_memory_percent)

response = server.run(ProofStep(proof_state=0, tactic="""(
rw [h]
)"""))
current_memory_percent = psutil.virtual_memory().percent
print(current_memory_percent)

# for tactic in response.tactics:
    # print(tactic.tactic + " " + str(tactic.start_pos) + " " + str(tactic.end_pos))
from lean_interact import Command, LeanServer, LeanREPLConfig, TempRequireProject, LocalProject
localprojectdir = "../matheye/benchmarks/"
config = LeanREPLConfig(verbose=True, project=LocalProject(localprojectdir))
print(config.__dict__)

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
    rw [a]
    rw [h]

""", all_tactics=True))

for tactic in response.tactics:
    print(tactic.tactic + " " + str(tactic.start_pos) + " " + str(tactic.end_pos))
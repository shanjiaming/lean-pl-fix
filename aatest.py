from lean_interact import TempRequireProject, LeanREPLConfig, LeanServer, Command

config = LeanREPLConfig(verbose=True, project=TempRequireProject("mathlib"))
server = LeanServer(config)

# Execute with options to get tactics information

cmd = """import Mathlib
example : 1=1 := by
  have ex_mathlib (x : ℝ) : x + 0 = x :=
    by
    have (x : ℝ) : x + 0 = x := by
      have hh (x : ℝ) : x + 0 = x := by simp
      simp
    have h2 : x + 0 = x := by exact this x
    exact h2
"""

response = server.run(Command(cmd=cmd, all_tactics=True))
print(response)
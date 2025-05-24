from lean_interact import LeanREPLConfig, LeanServer, Command, TempRequireProject

config = LeanREPLConfig(verbose=True, project=TempRequireProject("mathlib")) # download and build Lean REPL
server = LeanServer(config) # start Lean REPL


print(config.__dict__)

cmddd="""import Mathlib
"""

# response = server.run(Command(cmd=cmddd))
# print(response)
# Execute with options to get tactics information
response = server.run(Command(cmd="theorem ex (n : Nat) : n = 5 → n = 5 := by simp", all_tactics=True))
print(response)


config = LeanREPLConfig(verbose=True, project=TempRequireProject("mathlib")) # download and build Lean REPL
server = LeanServer(config) # start Lean REPL

response = server.run(Command(cmd="theorem ex (n : Nat) : n = 5 → n = 5 := by simp", all_tactics=True))
print(response)
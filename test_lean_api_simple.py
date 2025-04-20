from lean_interact import LeanREPLConfig, LeanServer, Command, TempRequireProject

config = LeanREPLConfig(verbose=True, project=TempRequireProject("mathlib")) # download and build Lean REPL
server = LeanServer(config) # start Lean REPL



cmddd="""import Mathlib
"""

# response = server.run(Command(cmd=cmddd))
# print(response)
# Execute with options to get tactics information
response = server.run(Command(cmd="theorem ex (n : Nat) : n = 5 → n = 5 := by simp", all_tactics=True))
print(response)

response = server.run(Command(cmd="""import Mathlib
import Aesop
set_option maxHeartbeats 0  -- Disable heartbeat limit to prevent timeout during proof checking
open BigOperators Real Nat Topology Rat  -- Open common mathematical namespaces
theorem mathd_algebra_182 (y : ℂ) : 7 * (3 * y + 2) = 21 * y + 14 := by
  rw [mul_add]  -- Rewrites using the distributive property: a*(b+c) = a*b + a*c
  rw [mul_assoc]  -- Rewrites a*(b*c) as (a*b)*c
  norm_num  -- Normalizes numerical expressions, computing 7*3 to 21 and 7*2 to 14
""", all_tactics=True))
print(response)


# Continue in the same environment
# response = server.run(Command(cmd="#check ex", env=response.env))
# print(response)

import Mathlib
open Lean

run_cmd do
  let env ← Lean.getEnv
  let name := ``add_comm
  let module? := env.getModuleFor? name
  logInfo m!"{module?}" -- some (Mathlib.Algebra.Group.Defs)
  let name := `not_a_theorem
  let module? := env.getModuleFor? name
  logInfo m!"{module?}" -- none

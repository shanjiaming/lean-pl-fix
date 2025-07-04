import Lean
import Mathlib
open Lean Elab Command Term

/--
`#find_in_module My.Module.Name`
Finds all theorems defined in the specified module (file).
-/
syntax (name := findInModule) "#find_in_module" ident : command

@[command_elab findInModule]
def elabFindInModule : CommandElab := fun stx => do
  runTermElabM fun _ => do
    let moduleName := stx[1].getId
    let env ← getEnv
    let some modIdx := env.getModuleIdx? moduleName
      | logError m!"Module `{moduleName}` not found. Make sure it's imported."
        return

    let thms := env.constants.toList.filter fun (declName, cinfo) =>
      let isTheorem := match cinfo with | .thmInfo _ => true | _ => false
      -- Check if the theorem's module index matches the one we found
      isTheorem && env.getModuleIdxFor? declName == some modIdx

    if thms.isEmpty then
      logInfo m!"[find_in_module] No theorems found in module `{moduleName}`."
    else
      logInfo m!"--- Theorems in module `{moduleName}` ---"
      for (name, info) in thms do
        logInfo m!"{name} : {info.type}"

-- This will now show the theorems defined in that specific file.
#find_in_module Mathlib.Algebra.Order.Group.Unbundled.Abs
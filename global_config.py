from lean_interact import Command, LeanServer, LeanREPLConfig, TempRequireProject, ProofStep

# Anonymous configuration - update paths according to your local setup
project_repl_config = LeanREPLConfig(local_repl_path = "~/lean-repl", lean_version="v4.21.0-rc3", project=TempRequireProject("mathlib"))

# Define the base path for the mathlib4 source code - update according to your installation
MATHLIB_BASE_PATH = "~/.local/lib/lean_interact/cache/mathlib"

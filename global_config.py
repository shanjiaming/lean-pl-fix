from lean_interact import LeanREPLConfig, TempRequireProject

# Anonymous configuration - update paths according to your local setup
project_repl_config = LeanREPLConfig(local_repl_path = "~/lean-repl", lean_version="v4.21.0-rc3", project=TempRequireProject("mathlib"))

from lean_interact import Command, LeanServer, LeanREPLConfig, TempRequireProject, ProofStep

project_repl_config = LeanREPLConfig(local_repl_path = "/Users/sjm/coding/projects/Newton/repl", lean_version="v4.21.0-rc3", project=TempRequireProject("mathlib"))

# Define the base path for the mathlib4 source code
MATHLIB_BASE_PATH = "~/miniconda3/lib/python3.13/site-packages/lean_interact/cache/tmp_projects/v4.21.0-rc3/1e05fd82f2c4fc489117f059ac17237437a6dbc201ad266e76e4f63abf7f4e88/.lake/packages/mathlib"

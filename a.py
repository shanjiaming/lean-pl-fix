from lean_interact import Command, LeanServer, LeanREPLConfig, TempRequireProject, LocalProject
localprojectdir = "../matheye/benchmarks/"
config = LeanREPLConfig(verbose=True, project=LocalProject(localprojectdir))
print(config.__dict__)

server = LeanServer(config)
response = server.run(Command(cmd="""import Mathlib
theorem ex_mathlib (x : ℝ) (y : ℚ) :
  ( Irrational x ) -> Irrational ( x + y ) := sorry"""))
print(response)
breakpoint()
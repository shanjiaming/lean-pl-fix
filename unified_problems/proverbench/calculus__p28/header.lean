import Mathlib

open Polynomial Set

/-- Define the parabola as a polynomial x² + 3 -/
noncomputable def parabola_poly : Polynomial ℝ :=
  X^2 + C 3

/-- Convert polynomial to real function -/
noncomputable def parabola_fun (x : ℝ) : ℝ :=
  aeval x parabola_poly
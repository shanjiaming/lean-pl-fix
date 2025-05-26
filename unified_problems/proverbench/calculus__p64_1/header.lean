import Mathlib

/- For the equation cos(2x) - √3 sin(2x) = √2, there exist exactly four solutions
   in the interval [0, 2π), namely x = 0, x = π/3, x = π, and x = 4π/3. -/

/-- The left side of the equation cos(2x) - √3 sin(2x) = √2 -/
noncomputable def equation (x : ℝ) : ℝ :=
  Real.cos (2 * x) - Real.sqrt 3 * Real.sin (2 * x)
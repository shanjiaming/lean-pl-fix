import Mathlib

/-
The indefinite integral \[\int \frac{x}{x^2+1}\,dx\] is equal to \[\frac12\ln(x^2+1)+C.\]
-/

-- Define the function to be integrated
noncomputable def integrand (x : ℝ) : ℝ := x / (x^2 + 1)

-- Theorem statement
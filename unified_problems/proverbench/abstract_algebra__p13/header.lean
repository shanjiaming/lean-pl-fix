import Mathlib

/-
The real values of \(a\) for which there exists a rational function \(f(x)\) that satisfies
\(f(x^2) = f(x)^2 - a\) are \(0\) and \(2\).
-/

open Polynomial

/-- The polynomial X² -/
noncomputable def square_poly : Polynomial ℚ := X * X
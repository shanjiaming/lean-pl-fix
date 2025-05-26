import Mathlib

/-
The value of the integral \[\int_3^9 (x^2-3) dx,\] is 216 according to the Fundamental Theorem of Calculus.
-/

open Real

-- Define the polynomial function
noncomputable def f (x : ℝ) : ℝ := x^2 - 3

-- Theorem statement
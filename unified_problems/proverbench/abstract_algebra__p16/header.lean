import Mathlib

/-
The only polynomials \(P\) for which \(P(x)^2-1= 4P(x^2-4x+1)\) are the constant polynomials \(P(x) = 2 + \sqrt{5}\) and \(P(x) = 2 - \sqrt{5}\).
-/

open Polynomial

variable {P : Polynomial ℝ}
import Mathlib

/-
The only polynomials P(x) that satisfy the equation \(P(x)^2 - 2 = 2P(2x^2 - 1)\) are
\(P(x) = 1 + \sqrt{3}\) or \(P(x) = 1 - \sqrt{3}\).
-/

open Polynomial

variable {P : Polynomial ℝ}
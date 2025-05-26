import Mathlib

/-
A real-coefficient polynomial P that satisfies P(cos x) = P(sin x) for all x is equivalent to
another polynomial Q such that P(x) = Q(x^4 - x^2) for each x.
-/

open Polynomial

variable {P : Polynomial ℝ}
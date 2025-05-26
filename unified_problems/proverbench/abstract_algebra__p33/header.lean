import Mathlib

/-
For a polynomial P, the equation \(16P(x^2)=P(2x)^2\) holds if and only if
\(P(x)=16\left(\frac14x\right)^n\) for some \(n\in\mathbb{N}\).
-/

open Polynomial

variable {P : Polynomial ℝ}
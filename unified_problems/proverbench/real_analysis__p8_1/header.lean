import Mathlib

/-
For the function $f(x)=\ln(x^2+1)$, the domain is the set of all real numbers, i.e., $\text{Dom}(f) = \mathbb{R} = (-\infty, \infty)$.
-/

open Real Set

-- Define the function f(x) = ln(x^2 + 1)
noncomputable def f (x : ℝ) : ℝ := log (x^2 + 1)

-- Lemma: x^2 + 1 is always positive for all real numbers x
import Mathlib

open Nat Set

-- {f : ℝ → ℝ | ∃ᵉ (c > 0) (d > (0 : ℝ)), (d = 1 → c = 1) ∧ (Ioi 0).EqOn f (fun x ↦ c * x ^ d)}
/--
Find all differentiable functions $f:(0,\infty) \to (0,\infty)$ for which there is a positive real number $a$ such that $f'(\frac{a}{x})=\frac{x}{f(x)}$ for all $x>0$.
-/
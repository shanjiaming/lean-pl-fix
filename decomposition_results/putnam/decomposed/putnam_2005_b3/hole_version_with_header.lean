import Mathlib

open Nat Set

-- {f : ℝ → ℝ | ∃ᵉ (c > 0) (d > (0 : ℝ)), (d = 1 → c = 1) ∧ (Ioi 0).EqOn f (fun x ↦ c * x ^ d)}
/--
Find all differentiable functions $f:(0,\infty) \to (0,\infty)$ for which there is a positive real number $a$ such that $f'(\frac{a}{x})=\frac{x}{f(x)}$ for all $x>0$.
-/
macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)

theorem putnam_2005_b3
    (f : ℝ → ℝ)
    (hf : ∀ x > 0, 0 < f x)
    (hf' : DifferentiableOn ℝ f (Ioi 0)) :
    (∃ a > 0, ∀ x > 0, deriv f (a / x) = x / f x) ↔ f ∈ (({f : ℝ → ℝ | ∃ᵉ (c > 0) (d > (0 : ℝ)), (d = 1 → c = 1) ∧ (Ioi 0).EqOn f (fun x ↦ c * x ^ d)}) : Set (ℝ → ℝ) ) := by
  constructor
  · 
    intro h
    have h₁ : ∃ᵉ (c > (0 : ℝ)) (d > (0 : ℝ)), (d = 1 → c = 1) ∧ (Ioi (0 : ℝ)).EqOn f (fun x => c * x ^ d) := by hole_1
    exact h₁
  · 
    intro h
    have h₁ : ∃ a > 0, ∀ x > 0, deriv f (a / x) = x / f x := by hole_2
    hole_3
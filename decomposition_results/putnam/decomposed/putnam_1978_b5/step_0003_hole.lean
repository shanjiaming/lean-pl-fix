theorem h₂ (S : Set ℝ[X]) (hS : S = {p | p.degree = 4 ∧ ∀ x ∈ Icc (-1) 1, eval x p ∈ Icc 0 1}) (x : ℝ) (hx h₁ : x ∈ Icc (-1) 1) : -1 ≤ x := by -- exact h₁.1
  hole
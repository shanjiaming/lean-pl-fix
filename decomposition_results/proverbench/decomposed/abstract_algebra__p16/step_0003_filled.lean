theorem h₂ (P : ℝ[X]) (h : ∀ (x : ℝ), eval x P ^ 2 - 1 = 4 * eval (x ^ 2 - 4 * x + 1) P) (h₁ : ¬P.degree ≤ 0) : P.degree ≥ 1 :=
  by
  have h₃ : P.degree ≠ 0 := by sorry
  have h₄ : P.degree ≥ 1 := by sorry
  --  exact h₄
  simpa
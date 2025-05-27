theorem h₂ (P : ℝ[X]) (hDegree : P.degree ≤ 5) (h : (∀ (x : ℝ), eval x (P %ₘ (X - 1) ^ 3) = -1) ∧ ∀ (x : ℝ), eval x (P %ₘ (X + 1) ^ 3) = 1) (h₁ : P %ₘ (X - 1) ^ 3 = -1) : P %ₘ (X + 1) ^ 3 = 1 :=
  by
  have h₃ : ∀ x : ℝ, (P %ₘ (X + 1 : Polynomial ℝ) ^ 3).eval x = 1 := by sorry
  have h₄ : P %ₘ (X + 1 : Polynomial ℝ) ^ 3 = 1 := by sorry
  --  exact h₄
  hole
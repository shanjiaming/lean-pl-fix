theorem h₄ (x z : ℝ) (P : ℕ → ℝ) (xlt1 : |x| < 1) (zgt1 : |z| > 1) (hP h₁ : ∀ n ≥ 1, P n = (∏ i, (1 - z * x ^ (↑i : ℕ))) / ∏ i, (z - x ^ (↑i : ℕ))) (h₂ : ∀ n ≥ 1, P n = 0) : ∀ j ≥ 1, P j = 0 := by
  intro j hj
  exact h₂ j hj
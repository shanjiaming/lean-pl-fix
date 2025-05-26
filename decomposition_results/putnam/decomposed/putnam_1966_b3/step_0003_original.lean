theorem h₁ (p : ℕ → ℝ) (hpos : ∀ (n : ℕ), p n > 0) (r : ℝ) (h_tendsto : sorry) : ∀ n ≥ 1, 0 < p n := by
  intro n hn
  exact hpos n
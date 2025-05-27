theorem h₃ (b✝ b : ℕ → ℝ) (h_pos : ∀ (n : ℕ), b n > 0) (h_lim : Tendsto b atTop (𝓝 (1 / 2))) (N : ℕ) (hN : ∀ n ≥ N, b n < 3 / 4) : ∀ n ≥ N, b n < 3 / 4 := by
  intro n hn
  exact hN n hn
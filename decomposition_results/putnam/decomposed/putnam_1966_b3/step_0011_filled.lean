theorem h₇ (p : ℕ → ℝ) (hpos : ∀ (n : ℕ), p n > 0) (r : ℝ) (h_tendsto : sorry) (h₁ : ∀ n ≥ 1, 0 < p n) (h₂ : ∀ n ≥ 1, 0 < ∑ i ∈ Finset.Icc 1 n, p i) (m : ℕ) (h₆ : ¬m = 0) : m ≥ 1 := by
  --  by_contra h₇
  have h₈ : m = 0 := by sorry
  --  contradiction
  omega
theorem h₂ (p : ℕ → ℝ) (hpos : ∀ (n : ℕ), p n > 0) (r : ℝ) (h_tendsto : sorry) (h₁ : ∀ n ≥ 1, 0 < p n) : ∀ n ≥ 1, 0 < ∑ i ∈ Finset.Icc 1 n, p i :=
  by
  intro n hn
  have h₃ : ∑ i in Finset.Icc 1 n, p i > 0 := by sorry
  exact h₃
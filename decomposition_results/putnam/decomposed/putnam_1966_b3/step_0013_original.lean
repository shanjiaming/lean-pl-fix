theorem h₈ (p : ℕ → ℝ) (hpos : ∀ (n : ℕ), p n > 0) (r : ℝ) (h_tendsto : sorry) (h₁ : ∀ n ≥ 1, 0 < p n) (h₂ : ∀ n ≥ 1, 0 < ∑ i ∈ Finset.Icc 1 n, p i) (m : ℕ) (h₆ : ¬m = 0) (h₇ : m ≥ 1) : ∑ n ∈ Finset.Icc 1 m, p n * (↑n : ℝ) ^ 2 / (∑ i ∈ Finset.Icc 1 n, p i) ^ 2 ≥ 0 :=
  by
  apply Finset.sum_nonneg
  intro n hn
  have h₉ : 0 < p n := hpos n
  have h₁₀ : 0 < ∑ i in Finset.Icc 1 n, p i := by sorry
  have h₁₁ : 0 ≤ (p n) * n ^ 2 / (∑ i in Finset.Icc 1 n, p i) ^ 2 := by sorry
  exact h₁₁
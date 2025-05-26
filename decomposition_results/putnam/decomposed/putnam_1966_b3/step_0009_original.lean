theorem h₄ (p : ℕ → ℝ) (hpos : ∀ (n : ℕ), p n > 0) (r : ℝ) (h_tendsto : sorry) (h₁ : ∀ n ≥ 1, 0 < p n) (h₂ : ∀ n ≥ 1, 0 < ∑ i ∈ Finset.Icc 1 n, p i) : ∃ S, ∀ (m : ℕ), ∑ n ∈ Finset.Icc 1 m, p n * (↑n : ℝ) ^ 2 / (∑ i ∈ Finset.Icc 1 n, p i) ^ 2 ≤ S :=
  by
  use (∑ n in Finset.Icc 1 0, (p n) * n ^ 2 / (∑ i in Finset.Icc 1 n, p i) ^ 2) + 1
  intro m
  have h₅ :
    ∑ n in Finset.Icc 1 m, (p n) * n ^ 2 / (∑ i in Finset.Icc 1 n, p i) ^ 2 ≤
      (∑ n in Finset.Icc 1 0, (p n) * n ^ 2 / (∑ i in Finset.Icc 1 n, p i) ^ 2) + 1 := by sorry
  exact h₅
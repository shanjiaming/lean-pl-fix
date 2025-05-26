theorem h₃ (p : ℕ → ℝ) (hpos : ∀ (n : ℕ), p n > 0) (r : ℝ) (h_tendsto : sorry) (h₁ : ∀ n ≥ 1, 0 < p n) (n : ℕ) (hn : n ≥ 1) : ∑ i ∈ Finset.Icc 1 n, p i > 0 :=
  by
  have h₄ : ∀ i ∈ Finset.Icc 1 n, p i > 0 := by sorry
  have h₅ : ∑ i in Finset.Icc 1 n, p i > 0 := by sorry
  --  exact h₅
  hole
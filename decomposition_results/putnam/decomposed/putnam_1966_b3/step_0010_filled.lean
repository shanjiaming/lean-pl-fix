theorem h₅ (p : ℕ → ℝ) (hpos : ∀ (n : ℕ), p n > 0) (r : ℝ) (h_tendsto : sorry) (h₁ : ∀ n ≥ 1, 0 < p n) (h₂ : ∀ n ≥ 1, 0 < ∑ i ∈ Finset.Icc 1 n, p i) (m : ℕ) : ∑ n ∈ Finset.Icc 1 m, p n * (↑n : ℝ) ^ 2 / (∑ i ∈ Finset.Icc 1 n, p i) ^ 2 ≤
    ∑ n ∈ Finset.Icc 1 0, p n * (↑n : ℝ) ^ 2 / (∑ i ∈ Finset.Icc 1 n, p i) ^ 2 + 1 :=
  by
  --  by_cases h₆ : m = 0
  --  · subst h₆
  --    simp [Finset.sum_Icc_succ_top] <;> norm_num <;> linarith [hpos 0]
  ·
    have h₇ : m ≥ 1 := by sorry
    have h₈ : ∑ n in Finset.Icc 1 m, (p n) * n ^ 2 / (∑ i in Finset.Icc 1 n, p i) ^ 2 ≥ 0 := by sorry
    have h₉ : ∑ n in Finset.Icc 1 0, (p n) * n ^ 2 / (∑ i in Finset.Icc 1 n, p i) ^ 2 = 0 := by sorry
  --    linarith
  hole
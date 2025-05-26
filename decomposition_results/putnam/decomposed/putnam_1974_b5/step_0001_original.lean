theorem putnam_1974_b5  : ∀ n ≥ 0, ∑ i ∈ Finset.Icc 0 n, (↑n : ℝ) ^ i / (↑i ! : ℝ) > rexp (↑n : ℝ) / 2 :=
  by
  have h_main : ∀ (n : ℕ), ∑ i in Finset.Icc (0 : ℕ) n, (n ^ i : ℝ) / (Nat.factorial i) > (Real.exp n) / 2 := by sorry
  intro n hn
  have h₁ : ∑ i in Finset.Icc (0 : ℕ) n, (n ^ i : ℝ) / (Nat.factorial i) > (Real.exp n) / 2 := h_main n
  simpa using h₁
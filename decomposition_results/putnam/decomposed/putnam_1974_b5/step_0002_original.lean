theorem h_main  : ∀ (n : ℕ), ∑ i ∈ Finset.Icc 0 n, (↑n : ℝ) ^ i / (↑i ! : ℝ) > rexp (↑n : ℝ) / 2 :=
  by
  intro n
  have h₁ : ∑ i in Finset.Icc (0 : ℕ) n, ((n : ℝ) ^ i / Nat.factorial i : ℝ) > (Real.exp n) / 2 := by sorry
  exact h₁
theorem algebra_sum1onsqrt2to1onsqrt10000lt198  : ∑ k ∈ Finset.Icc 2 10000, 1 / √(↑k : ℝ) < 198 :=
  by
  have h₁ : ∀ (k : ℕ), k ∈ Finset.Icc (2 : ℕ) 10000 → (1 : ℝ) / Real.sqrt k < 2 * (Real.sqrt k - Real.sqrt (k - 1)) := by sorry
  have h₂ : (∑ k in Finset.Icc (2 : ℕ) 10000, 2 * (Real.sqrt (k : ℝ) - Real.sqrt ((k : ℝ) - 1))) = 198 := by sorry
  have h₃ : (∑ k in Finset.Icc (2 : ℕ) 10000, 1 / Real.sqrt k) < 198 := by sorry
  exact h₃
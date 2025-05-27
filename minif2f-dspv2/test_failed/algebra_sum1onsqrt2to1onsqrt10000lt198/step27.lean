theorem h₃ (h₁ : ∀ k ∈ Finset.Icc 2 10000, 1 / √(↑k : ℝ) < 2 * (√(↑k : ℝ) - √((↑k : ℝ) - 1))) (h₂ : ∑ k ∈ Finset.Icc 2 10000, 2 * (√(↑k : ℝ) - √((↑k : ℝ) - 1)) = 198) : ∑ k ∈ Finset.Icc 2 10000, 1 / √(↑k : ℝ) < 198 :=
  by
  have h₄ : (∑ k in Finset.Icc (2 : ℕ) 10000, (1 : ℝ) / Real.sqrt k) < 198 := by sorry
  exact h₄
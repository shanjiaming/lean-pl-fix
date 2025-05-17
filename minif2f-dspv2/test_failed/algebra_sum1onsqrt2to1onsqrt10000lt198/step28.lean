theorem h₄ (h₁ : ∀ k ∈ Finset.Icc 2 10000, 1 / √(↑k : ℝ) < 2 * (√(↑k : ℝ) - √((↑k : ℝ) - 1))) (h₂ : ∑ k ∈ Finset.Icc 2 10000, 2 * (√(↑k : ℝ) - √((↑k : ℝ) - 1)) = 198) : ∑ k ∈ Finset.Icc 2 10000, 1 / √(↑k : ℝ) < 198 :=
  by
  have h₅ :
    (∑ k in Finset.Icc (2 : ℕ) 10000, (1 : ℝ) / Real.sqrt k) <
      ∑ k in Finset.Icc (2 : ℕ) 10000, 2 * (Real.sqrt (k : ℝ) - Real.sqrt ((k : ℝ) - 1)) := by sorry
  have h₅₃ : (∑ k in Finset.Icc (2 : ℕ) 10000, 2 * (Real.sqrt (k : ℝ) - Real.sqrt ((k : ℝ) - 1))) = 198 := by sorry
  have h₅₄ : (∑ k in Finset.Icc (2 : ℕ) 10000, (1 : ℝ) / Real.sqrt k) < 198 := by sorry
  exact h₅₄
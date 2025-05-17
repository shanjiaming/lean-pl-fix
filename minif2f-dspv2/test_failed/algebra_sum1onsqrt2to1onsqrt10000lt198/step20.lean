theorem h₂ (h₁ : ∀ k ∈ Finset.Icc 2 10000, 1 / √(↑k : ℝ) < 2 * (√(↑k : ℝ) - √((↑k : ℝ) - 1))) : ∑ k ∈ Finset.Icc 2 10000, 2 * (√(↑k : ℝ) - √((↑k : ℝ) - 1)) = 198 :=
  by
  have h₃ :
    (∑ k in Finset.Icc (2 : ℕ) 10000, 2 * (Real.sqrt (k : ℝ) - Real.sqrt ((k : ℝ) - 1))) =
      2 * (Real.sqrt (10000 : ℝ) - Real.sqrt (1 : ℝ)) := by sorry
  rw [h₃]
  have h₄ : Real.sqrt (10000 : ℝ) = 100 := by sorry
  have h₅ : Real.sqrt (1 : ℝ) = 1 := by sorry
  rw [h₄, h₅] <;> norm_num
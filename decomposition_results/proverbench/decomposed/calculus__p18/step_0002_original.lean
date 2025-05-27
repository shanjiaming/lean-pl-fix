theorem h_main  : ∫ (x : ℝ) in Set.Icc 2 8, 1 / x + x ^ 2 = log 4 + 168 :=
  by
  have h₁ :
    (∫ x in Set.Icc 2 8, (1 / x + x ^ 2 : ℝ)) = (∫ x in Set.Icc 2 8, (1 / x : ℝ)) + ∫ x in Set.Icc 2 8, (x ^ 2 : ℝ) := by sorry
  rw [h₁]
  have h₂ : (∫ x in Set.Icc 2 8, (1 / x : ℝ)) = Real.log 8 - Real.log 2 := by sorry
  have h₃ : (∫ x in Set.Icc 2 8, (x ^ 2 : ℝ)) = (168 : ℝ) := by sorry
  rw [h₂, h₃]
  have h₄ : Real.log 4 = Real.log 8 - Real.log 2 := by sorry
  rw [h₄] <;> ring_nf <;> norm_num <;> linarith
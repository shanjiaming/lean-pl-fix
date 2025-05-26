theorem h₃ (h₁ : 0 < 4 / 9) (h₂ : 4 / 9 < 4 * √2 / 9) : ∫ (x : ℝ) in Set.Ioo 0 (√2 / 3), max (4 / 9 - (2 * x - 3 * x ^ 3)) 0 =
    ∫ (x : ℝ) in Set.Ioo 0 (√6 / 3), max (2 * x - 3 * x ^ 3 - 4 / 9) 0 :=
  by
  have h₃₁ : (∫ x in Set.Ioo 0 ((Real.sqrt 2) / 3), max (((4 / 9) : ℝ) - (2 * x - 3 * x ^ 3)) 0) = 0 := by sorry
  have h₃₂ : (∫ x in Set.Ioo 0 ((Real.sqrt 6) / 3), max ((2 * x - 3 * x ^ 3) - ((4 / 9) : ℝ)) 0) = 0 := by sorry
  rw [h₃₁, h₃₂] <;> norm_num
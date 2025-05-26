theorem derivative_value_at_pi_over_3  : 2 * (1 / cos (π / 3)) ^ 2 * tan (π / 3) = 8 * √3 :=
  by
  have h₁ : Real.cos (Real.pi / 3) = 1 / 2 := by sorry
  have h₂ : Real.tan (Real.pi / 3) = Real.sqrt 3 := by sorry
  have h₃ : (1 / Real.cos (Real.pi / 3)) ^ 2 = 4 := by sorry
  have h₄ : 2 * (1 / Real.cos (Real.pi / 3)) ^ 2 * Real.tan (Real.pi / 3) = 8 * Real.sqrt 3 := by sorry
  rw [h₄] <;> linarith [Real.sqrt_nonneg 3]
theorem h_cbrt (h_sqrt : √1000000 = 1000) : 1000000 ^ (1 / 3) = 100 :=
  by
  have h₁ : Real.log ((1000000 : ℝ) ^ ((1 : ℝ) / 3)) = Real.log (100 : ℝ) := by sorry
  have h₂ : (1000000 : ℝ) ^ ((1 : ℝ) / 3) > 0 := by sorry
  have h₃ : (100 : ℝ) > 0 := by sorry
  have h₄ : Real.log ((1000000 : ℝ) ^ ((1 : ℝ) / 3)) = Real.log (100 : ℝ) := by sorry
  have h₅ : Real.log ((1000000 : ℝ) ^ ((1 : ℝ) / 3)) = Real.log (100 : ℝ) := by sorry
  have h₆ : (1000000 : ℝ) ^ ((1 : ℝ) / 3) = 100 := by sorry
  --  rw [h₆] <;> norm_num
  hole
theorem h₁ (h_sqrt : √1000000 = 1000) : Real.log (1000000 ^ (1 / 3)) = Real.log 100 :=
  by
  have h₂ : Real.log ((1000000 : ℝ) ^ ((1 : ℝ) / 3)) = ((1 : ℝ) / 3) * Real.log (1000000 : ℝ) := by sorry
  --  rw [h₂]
  have h₃ : Real.log (1000000 : ℝ) = Real.log ((100 : ℝ) ^ 3) := by sorry
  rw [h₃]
  have h₄ : Real.log ((100 : ℝ) ^ 3) = 3 * Real.log (100 : ℝ) := by sorry
  rw [h₄]
  ring_nf <;> field_simp [Real.log_mul, Real.log_pow] <;> ring_nf <;> norm_num
  hole
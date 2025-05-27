theorem h₁₃ (h₁₁ : Real.log 6 = Real.log 2 + Real.log 3) (h₁₂ : Real.log 6 / Real.log 2 = 1 + Real.log 3 / Real.log 2) : Real.log 6 / Real.log 3 = 1 + Real.log 2 / Real.log 3 :=
  by
  rw [h₁₁]
  field_simp [Real.log_ne_zero_of_pos_of_ne_one (by norm_num : (0 : ℝ) < 3) (by norm_num : (3 : ℝ) ≠ 1)] <;> ring_nf <;>
      field_simp [Real.log_ne_zero_of_pos_of_ne_one (by norm_num : (0 : ℝ) < 3) (by norm_num : (3 : ℝ) ≠ 1)] <;>
    ring_nf
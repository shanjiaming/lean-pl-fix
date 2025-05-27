theorem h₁₂ (h₁₁ : Real.log 6 = Real.log 2 + Real.log 3) : Real.log 6 / Real.log 2 = 1 + Real.log 3 / Real.log 2 :=
  by
  rw [h₁₁]
  field_simp [Real.log_ne_zero_of_pos_of_ne_one (by norm_num : (0 : ℝ) < 2) (by norm_num : (2 : ℝ) ≠ 1)] <;> ring_nf <;>
      field_simp [Real.log_ne_zero_of_pos_of_ne_one (by norm_num : (0 : ℝ) < 2) (by norm_num : (2 : ℝ) ≠ 1)] <;>
    ring_nf
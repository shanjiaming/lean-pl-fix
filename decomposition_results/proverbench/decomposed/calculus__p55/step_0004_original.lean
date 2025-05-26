theorem h₂ (h₁ : sorry = 512) : sorry = 34 :=
  by
  have h₃ : m_comp 2 5 (-6) 3 = 5 * (2 : ℝ) ^ 3 + (-6 : ℝ) := by sorry
  rw [h₃]
  norm_num [Real.rpow_nat_cast, pow_succ] <;> norm_num <;> rfl
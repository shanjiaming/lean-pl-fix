theorem h₁ (p q : ℤ) (h : ∃ r, cos ((↑p : ℝ) * π / (↑q : ℝ)) = (↑r : ℝ)) (hq : q = 0) : cos ((↑p : ℝ) * π / (↑q : ℝ)) = 1 :=
  by
  have h₂ : (q : ℝ) = 0 := by sorry
  have h₃ : (p * π / q : ℝ) = 0 := by sorry
  --  rw [h₃]
  --  norm_num [Real.cos_zero] <;> simp_all [Real.cos_zero]
  hole
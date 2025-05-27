theorem h₁ (p q : ℤ) (h : ∃ r, cos (↑p * π / ↑q) = ↑r) (hq : q = 0) : cos (↑p * π / ↑q) = 1 :=
  by
  have h₂ : (q : ℝ) = 0 := by sorry
  have h₃ : (p * π / q : ℝ) = 0 := by sorry
  rw [h₃]
  norm_num [Real.cos_zero] <;> simp_all [Real.cos_zero]
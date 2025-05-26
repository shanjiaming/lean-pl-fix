theorem h₃ (p q : ℤ) (h : ∃ r, cos ((↑p : ℝ) * π / (↑q : ℝ)) = (↑r : ℝ)) (hq : q = 0) (h₂ : (↑q : ℝ) = 0) : (↑p : ℝ) * π / (↑q : ℝ) = 0 := by
  rw [div_eq_mul_inv]
  simp [h₂, mul_zero] <;> ring_nf <;> field_simp [h₂] <;> ring_nf
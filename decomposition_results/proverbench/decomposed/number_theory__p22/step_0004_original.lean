theorem h₃ (p q : ℤ) (h : ∃ r, cos (↑p * π / ↑q) = ↑r) (hq : q = 0) (h₂ : ↑q = 0) : ↑p * π / ↑q = 0 := by
  rw [div_eq_mul_inv]
  simp [h₂, mul_zero] <;> ring_nf <;> field_simp [h₂] <;> ring_nf
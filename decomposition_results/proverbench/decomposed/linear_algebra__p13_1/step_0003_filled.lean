theorem h₁ (T : ℤ × ℤ →+ ℤ) (x y : ℤ) : T (x, y) = T (x • (1, 0) + y • (0, 1)) := by
  --  simp [Prod.ext_iff, add_zsmul, mul_comm] <;> ring_nf <;> simp_all <;> omega
  norm_num
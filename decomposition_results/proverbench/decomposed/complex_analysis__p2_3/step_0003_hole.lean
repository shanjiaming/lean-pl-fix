theorem h2 (h1 : (1 + sorry) ^ 2 = 2 * sorry) : (1 + sorry) ^ 4 = -4 := by
  --  calc
  --    (1 + I) ^ 4 = ((1 + I) ^ 2) ^ 2 := by ring_nf
  --    _ = (2 * I) ^ 2 := by rw [h1]
  --    _ = 4 * I ^ 2 := by
  --      ring_nf <;>
  --              simp [Complex.ext_iff, pow_two, Complex.I_mul_I, Complex.I_mul_I, Complex.I_mul_I, Complex.I_mul_I] <;>
  --            norm_num <;>
  --          ring_nf <;>
  --        norm_num
  --    _ = -4 :=
  --      by
  --      have h : I ^ 2 = -1 := by
  --        simp [Complex.ext_iff, pow_two, Complex.I_mul_I, Complex.I_mul_I, Complex.I_mul_I, Complex.I_mul_I] <;> norm_num
  --      rw [h] <;> ring_nf <;>
  --          simp [Complex.ext_iff, pow_two, Complex.I_mul_I, Complex.I_mul_I, Complex.I_mul_I, Complex.I_mul_I] <;>
  --        norm_num
  hole
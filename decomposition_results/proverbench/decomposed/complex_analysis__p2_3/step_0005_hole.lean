theorem h4 (h1 : (1 + I) ^ 2 = 2 * I) (h2 : (1 + I) ^ 4 = -4) (h3 : (1 + I) ^ 8 = 16) : (1 + I) ^ 10 = 32 * I := by
  --  calc
  --    (1 + I) ^ 10 = (1 + I) ^ 8 * (1 + I) ^ 2 :=
  --      by
  --      rw [show (10 : ℕ) = 8 + 2 by norm_num]
  --      rw [pow_add] <;> ring_nf
  --    _ = 16 * (2 * I) := by rw [h3, h1] <;> ring_nf
  --    _ = 32 * I := by
  --      ring_nf <;>
  --                      simp [Complex.ext_iff, pow_two, Complex.I_mul_I, Complex.I_mul_I, Complex.I_mul_I,
  --                        Complex.I_mul_I] <;>
  --                    norm_num <;>
  --                  ring_nf <;>
  --                norm_num <;>
  --              simp [Complex.ext_iff, pow_two, Complex.I_mul_I, Complex.I_mul_I, Complex.I_mul_I, Complex.I_mul_I] <;>
  --            norm_num <;>
  --          ring_nf <;>
  --        norm_num
  hole
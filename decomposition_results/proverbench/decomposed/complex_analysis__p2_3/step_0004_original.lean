theorem h3 (h1 : (1 + sorry) ^ 2 = 2 * sorry) (h2 : (1 + sorry) ^ 4 = -4) : (1 + sorry) ^ 8 = 16 := by
  calc
    (1 + I) ^ 8 = ((1 + I) ^ 4) ^ 2 := by ring_nf
    _ = (-4 : ℂ) ^ 2 := by rw [h2]
    _ = 16 := by
      norm_num [Complex.ext_iff, pow_two, Complex.I_mul_I, Complex.I_mul_I, Complex.I_mul_I, Complex.I_mul_I] <;>
                          ring_nf <;>
                        norm_num <;>
                      simp [Complex.ext_iff, pow_two, Complex.I_mul_I, Complex.I_mul_I, Complex.I_mul_I,
                        Complex.I_mul_I] <;>
                    norm_num <;>
                  ring_nf <;>
                norm_num <;>
              simp [Complex.ext_iff, pow_two, Complex.I_mul_I, Complex.I_mul_I, Complex.I_mul_I, Complex.I_mul_I] <;>
            norm_num <;>
          ring_nf <;>
        norm_num
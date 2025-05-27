theorem h1  : (1 + I) ^ 2 = 2 * I := by
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
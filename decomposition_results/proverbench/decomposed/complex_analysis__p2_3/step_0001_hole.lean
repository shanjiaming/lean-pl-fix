theorem complex_power_example  : (1 + sorry) ^ 10 = 32 * sorry :=
  by
  have h1 : (1 + I) ^ 2 = 2 * I := by sorry
  have h2 : (1 + I) ^ 4 = -4 := by sorry
  have h3 : (1 + I) ^ 8 = 16 := by sorry
  have h4 : (1 + I) ^ 10 = 32 * I := by sorry
  --  rw [h4] <;> simp [Complex.ext_iff, pow_two, Complex.I_mul_I, Complex.I_mul_I, Complex.I_mul_I, Complex.I_mul_I] <;>
                norm_num <;>
              ring_nf <;>
            norm_num <;>
          simp [Complex.ext_iff, pow_two, Complex.I_mul_I, Complex.I_mul_I, Complex.I_mul_I, Complex.I_mul_I] <;>
        norm_num <;>
      ring_nf <;>
    norm_num
  hole
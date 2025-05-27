theorem h₁  : I ^ 4 = 1 := by
  --  norm_num [pow_succ, Complex.ext_iff, Complex.I_mul_I, Complex.I_mul_I] <;>
          simp [Complex.ext_iff, pow_succ, Complex.I_mul_I, Complex.I_mul_I] <;>
        norm_num <;>
      simp_all [Complex.ext_iff, pow_succ, Complex.I_mul_I, Complex.I_mul_I] <;>
    norm_num
  hole
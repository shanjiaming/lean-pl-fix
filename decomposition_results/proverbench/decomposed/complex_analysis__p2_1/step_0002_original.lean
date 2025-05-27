theorem h₀  : 5 * ↑π / 2 = ↑π / 2 + 2 * ↑π := by
  ring_nf <;> simp [Complex.ext_iff, Complex.I_mul_I, mul_comm] <;> norm_num <;> ring_nf at * <;> norm_num at * <;>
            simp_all [Complex.ext_iff, Complex.I_mul_I, mul_comm] <;>
          norm_num <;>
        ring_nf at * <;>
      norm_num at * <;>
    linarith
theorem h₀  : 5 * (↑π : ℂ) / 2 = (↑π : ℂ) / 2 + 2 * (↑π : ℂ) := by
  --  ring_nf <;> simp [Complex.ext_iff, Complex.I_mul_I, mul_comm] <;> norm_num <;> ring_nf at * <;> norm_num at * <;>
            simp_all [Complex.ext_iff, Complex.I_mul_I, mul_comm] <;>
          norm_num <;>
        ring_nf at * <;>
      norm_num at * <;>
    linarith
  hole
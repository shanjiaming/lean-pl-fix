theorem h1  : cexp (I * (↑π / 2)) = sorry + I * sorry := by
  rw [Complex.exp_eq_exp_re_mul_sin_add_cos] <;> simp [Complex.ext_iff, mul_comm] <;> ring_nf <;> norm_num <;>
        field_simp [Real.pi_pos.le] <;>
      ring_nf <;>
    norm_num
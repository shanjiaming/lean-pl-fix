theorem h1  : rexp (sorry * (π / 2)) = cos (π / 2) + sorry * sin (π / 2) := by
  --  rw [Complex.exp_eq_exp_re_mul_sin_add_cos] <;> simp [Complex.ext_iff, mul_comm] <;> ring_nf <;> norm_num <;>
        field_simp [Real.pi_pos.le] <;>
      ring_nf <;>
    norm_num
  hole
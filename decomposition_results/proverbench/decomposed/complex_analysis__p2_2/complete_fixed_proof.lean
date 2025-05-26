theorem final_simplification : exp (I * (π / 2)) = I:=
  by
  have h1 : exp (I * (π / 2)) = cos (π / 2) + I * sin (π / 2):= by
    --  rw [Complex.exp_eq_exp_re_mul_sin_add_cos] <;> simp [Complex.ext_iff, mul_comm] <;> ring_nf <;> norm_num <;>
          field_simp [Real.pi_pos.le] <;>
        ring_nf <;>
      norm_num
    hole
  have h2 : cos (π / 2) = 0:= by -- norm_num [Real.cos_pi_div_two] <;> linarith [Real.pi_gt_three]
    norm_num
  have h3 : sin (π / 2) = 1:= by -- norm_num [Real.sin_pi_div_two] <;> linarith [Real.pi_gt_three]
    norm_num
  have h4 : exp (I * (π / 2)) = I:= by
    --  rw [h1, h2, h3] <;> simp [Complex.ext_iff, Complex.I_re, Complex.I_im] <;> norm_num <;>
          simp_all [Complex.ext_iff, Complex.I_re, Complex.I_im] <;>
        norm_num <;>
      linarith [Real.pi_gt_three]
    hole
  --  rw [h4] <;> simp [Complex.ext_iff, Complex.I_re, Complex.I_im] <;> norm_num <;>
        simp_all [Complex.ext_iff, Complex.I_re, Complex.I_im] <;>
      norm_num <;>
    linarith [Real.pi_gt_three]
  hole
theorem final_simplification  : rexp (sorry * (π / 2)) = sorry :=
  by
  have h1 : exp (I * (π / 2)) = cos (π / 2) + I * sin (π / 2) := by sorry
  have h2 : cos (π / 2) = 0 := by sorry
  have h3 : sin (π / 2) = 1 := by sorry
  have h4 : exp (I * (π / 2)) = I := by sorry
  --  rw [h4] <;> simp [Complex.ext_iff, Complex.I_re, Complex.I_im] <;> norm_num <;>
        simp_all [Complex.ext_iff, Complex.I_re, Complex.I_im] <;>
      norm_num <;>
    linarith [Real.pi_gt_three]
  hole
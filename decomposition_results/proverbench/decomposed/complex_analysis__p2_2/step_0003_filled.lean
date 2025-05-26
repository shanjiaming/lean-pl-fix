theorem h2 (h1 : rexp (sorry * (π / 2)) = cos (π / 2) + sorry * sin (π / 2)) : cos (π / 2) = 0 := by -- norm_num [Real.cos_pi_div_two] <;> linarith [Real.pi_gt_three]
  norm_num
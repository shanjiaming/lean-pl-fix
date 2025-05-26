theorem h3 (h1 : rexp (sorry * (π / 2)) = cos (π / 2) + sorry * sin (π / 2)) (h2 : cos (π / 2) = 0) : sin (π / 2) = 1 := by -- norm_num [Real.sin_pi_div_two] <;> linarith [Real.pi_gt_three]
  norm_num
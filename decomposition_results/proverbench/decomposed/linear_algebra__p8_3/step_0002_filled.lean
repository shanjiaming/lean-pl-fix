theorem h_exists  : ∃ x, -19 * x.1 + 8 * x.2.1 = -108 ∧ -71 * x.1 + 30 * x.2.1 = -404 ∧ -2 * x.1 + x.2.1 = -12 ∧ 4 * x.1 + x.2.2 = 14 :=
  by
  --  refine' ⟨(4, -4, -2), _⟩
  norm_num [verify_solution]
  hole
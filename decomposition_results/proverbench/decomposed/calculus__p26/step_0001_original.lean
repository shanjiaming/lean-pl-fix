theorem derivative_of_exp_at_e  : deriv (fun x => rexp x) sorry = rexp sorry :=
  by
  have h : deriv (fun x => exp x) e = exp e := by sorry
  exact h
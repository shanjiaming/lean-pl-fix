macro "hole_2" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem derivative_of_exp_at_e : deriv (fun x => exp x) e = exp e := by
  have h : deriv (fun x => exp x) e = exp e := by
    hole_2
  hole_1
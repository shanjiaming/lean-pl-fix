theorem derivative_of_exp_at_e : deriv (fun x => exp x) e = exp e := by
  have h : deriv (fun x => exp x) e = exp e := by
    rw [show (deriv (fun x => exp x) e) = exp e by
      -- Use the known fact that the derivative of `exp` is `exp` and evaluate at `e`
      rw [Real.deriv_exp]
      <;> simp]
  exact h
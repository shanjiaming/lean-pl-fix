theorem derivative_of_exp_at_e : deriv (fun x => exp x) e = exp e:=
  by
  have h : deriv (fun x => exp x) e = exp e:= by
    --  rw [show (deriv (fun x => exp x) e) = exp e by rw [Real.deriv_exp] <;> simp]
    hole
  --  exact h
  hole
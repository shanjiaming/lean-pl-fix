theorem derivative_of_cube_at_four : deriv (fun x : ℝ => x ^ 3) 4 = 48:=
  by
  have h : deriv (fun x : ℝ => x ^ 3) 4 = 48:=
    by
    --  rw [show (deriv (fun x : ℝ => x ^ 3) 4) = deriv (fun x : ℝ => x ^ 3) 4 by rfl]
    norm_num [deriv_pow] <;> ring_nf <;> norm_num <;> linarith
    hole
  --  exact h
  hole
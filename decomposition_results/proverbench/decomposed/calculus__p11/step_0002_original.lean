theorem h  : deriv (fun x => x ^ 3) 4 = 48 :=
  by
  rw [show (deriv (fun x : ℝ => x ^ 3) 4) = deriv (fun x : ℝ => x ^ 3) 4 by rfl]
  norm_num [deriv_pow] <;> ring_nf <;> norm_num <;> linarith
theorem h₁  : (deriv fun x => cos x) = fun x => -sin x :=
  by
  --  funext x
  --  rw [show deriv (fun x => Real.cos x) x = -Real.sin x by rw [Real.deriv_cos] <;> simp [Real.sin_neg]]
  norm_num
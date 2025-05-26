theorem cos_derivative : deriv (fun x => Real.cos x) = fun x => -Real.sin x:=
  by
  have h₁ : deriv (fun x => Real.cos x) = fun x => -Real.sin x:=
    by
    --  funext x
    --  rw [show deriv (fun x => Real.cos x) x = -Real.sin x by rw [Real.deriv_cos] <;> simp [Real.sin_neg]]
    norm_num
  --  exact h₁
  norm_num
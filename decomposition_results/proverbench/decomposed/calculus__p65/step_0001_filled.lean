theorem cos_derivative  : (deriv fun x => Real.cos x) = fun x => -Real.sin x :=
  by
  have h₁ : deriv (fun x => Real.cos x) = fun x => -Real.sin x := by sorry
  --  exact h₁
  norm_num
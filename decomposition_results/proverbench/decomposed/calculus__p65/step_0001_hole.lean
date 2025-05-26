theorem cos_derivative  : (deriv fun x => cos x) = fun x => -sin x :=
  by
  have h₁ : deriv (fun x => Real.cos x) = fun x => -Real.sin x := by sorry
  --  exact h₁
  hole
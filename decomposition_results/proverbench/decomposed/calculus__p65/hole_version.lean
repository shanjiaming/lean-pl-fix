macro "hole_2" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem cos_derivative : deriv (fun x => Real.cos x) = fun x => -Real.sin x := by
  have h₁ : deriv (fun x => Real.cos x) = fun x => -Real.sin x := by
    hole_2
  hole_1
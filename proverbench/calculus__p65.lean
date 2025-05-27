theorem cos_derivative : deriv (fun x => Real.cos x) = fun x => -Real.sin x := by
  have h₁ : deriv (fun x => Real.cos x) = fun x => -Real.sin x := by
    funext x
    rw [show deriv (fun x => Real.cos x) x = -Real.sin x by
      -- Use the known derivative of the cosine function
      rw [Real.deriv_cos]
      <;> simp [Real.sin_neg]]
  exact h₁
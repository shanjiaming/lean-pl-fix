theorem h₂ (x✝ x : ℝ) (h : IsLocalMax f x ∨ IsLocalMin f x) (h₁ : f_deriv x = 0) : x = 2 ∨ x = 4 := by
  apply (critical_points x).mp
  exact h₁
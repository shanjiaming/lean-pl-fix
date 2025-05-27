theorem only_local_extrema (x✝ x : ℝ) : IsLocalMax f x ∨ IsLocalMin f x → x = 2 ∨ x = 4 :=
  by
  intro h
  have h₁ : f_deriv x = 0 := by sorry
  have h₂ : x = 2 ∨ x = 4 := by sorry
  exact h₂
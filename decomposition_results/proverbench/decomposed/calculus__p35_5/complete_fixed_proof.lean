theorem only_local_extrema (x : ℝ) : IsLocalMax f x ∨ IsLocalMin f x → x = 2 ∨ x = 4:=
  by
  intro h
  have h₁ : f_deriv x = 0:= by sorry
    hole
  have h₂ : x = 2 ∨ x = 4:= by
    apply (critical_points x).mp
    exact h₁
    hole
  exact h₂
  hole
theorem h₃ (x : ℝ) (h₁ : ∃ x, IsLocalMax f x) (h₂ : ∃ x, IsLocalMin f x) : ∀ (x : ℝ), IsLocalMax f x ∨ IsLocalMin f x → x = 2 ∨ x = 4 :=
  by
  --  intro x hx
  --  exact only_local_extrema x hx
  hole
theorem h_cases (x : ℝ) (h : sorry = 0) : x = 2 ∨ x = 4 :=
  by
  have h₁ : f_deriv x = 0 ↔ x = 2 ∨ x = 4 := critical_points x
  have h₂ : x = 2 ∨ x = 4 := by sorry
  --  exact h₂
  hole
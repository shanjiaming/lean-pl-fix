theorem h_u_diff (u v : ℝ → ℝ) (u_val : u 0 = 1 ∧ u 1 = 2 ∧ u 2 = 3) (v_val : v 0 = 2 ∧ v 1 = 3 ∧ v 2 = 4) (u_deriv : deriv u 0 = 4 ∧ deriv u 1 = 5 ∧ deriv u 2 = 6) (v_deriv : deriv v 0 = 7 ∧ deriv v 1 = 8 ∧ deriv v 2 = 9) (h_v_diff : DifferentiableAt ℝ v 0) : DifferentiableAt ℝ u (v 0) :=
  by
  have h₁ : v 0 = 2 := by sorry
  --  rw [h₁]
  have h₂ : deriv u 2 = 6 := u_deriv.2.2
  have h₃ : DifferentiableAt ℝ u 2 := by sorry
  --  exact h₃
  hole
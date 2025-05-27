theorem verify_critical_values  : ∀ (x : ℝ), critical_values_of_cubic x :=
  by
  intro x
  have h_main : (f_deriv x = 0 ↔ x = -2 ∨ x = 3) := by sorry
  exact h_main
theorem critical_points (x : ℝ) : ∃ a b, a < b ∧ a = (21 - √497) / 4 ∧ b = (21 + √497) / 4 ∧ ∀ (x : ℝ), deriv (deriv f) x = 0 ↔ x = a ∨ x = b :=
  by
  have h_main :
    ∃ (a b : ℝ),
      a < b ∧
        a = (21 - Real.sqrt 497) / 4 ∧ b = (21 + Real.sqrt 497) / 4 ∧ ∀ (x : ℝ), deriv (deriv f) x = 0 ↔ x = a ∨ x = b := by sorry
  --  exact h_main
  hole
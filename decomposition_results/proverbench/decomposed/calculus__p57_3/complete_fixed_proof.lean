theorem critical_points :
  ∃ a b : ℝ, a < b ∧ a = (21 - sqrt 497) / 4 ∧ b = (21 + sqrt 497) / 4 ∧ ∀ x, deriv (deriv f) x = 0 ↔ x = a ∨ x = b:=
  by
  have h_main :
    ∃ (a b : ℝ),
      a < b ∧
        a = (21 - Real.sqrt 497) / 4 ∧ b = (21 + Real.sqrt 497) / 4 ∧ ∀ (x : ℝ), deriv (deriv f) x = 0 ↔ x = a ∨ x = b := by sorry
  --  exact h_main
  norm_cast
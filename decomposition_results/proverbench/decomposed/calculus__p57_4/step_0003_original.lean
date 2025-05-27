theorem h₁ (x : ℝ) : ∃ a b, a < b ∧ a = (21 - √497) / 4 ∧ b = (21 + √497) / 4 ∧ ∀ (x : ℝ), deriv (deriv f) x = 0 ↔ x = a ∨ x = b :=
  by exact critical_points
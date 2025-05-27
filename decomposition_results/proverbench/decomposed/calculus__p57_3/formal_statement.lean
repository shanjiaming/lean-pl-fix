/-- The critical points of f''(x) -/
lemma critical_points : ∃ a b : ℝ, a < b ∧
  a = (21 - sqrt 497) / 4 ∧
  b = (21 + sqrt 497) / 4 ∧
  ∀ x, deriv (deriv f) x = 0 ↔ x = a ∨ x = b :=
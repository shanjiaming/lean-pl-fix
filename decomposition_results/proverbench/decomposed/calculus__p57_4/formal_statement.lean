/-- f(x) is concave up on the intervals (-∞, (21 - √497)/4) and ((21 + √497)/4, ∞) -/
theorem concave_up_intervals : ∃ a b : ℝ, a < b ∧
  (∀ x < a, deriv (deriv f) x > 0) ∧
  (∀ x > b, deriv (deriv f) x > 0) ∧
  a = (21 - sqrt 497) / 4 ∧
  b = (21 + sqrt 497) / 4 :=
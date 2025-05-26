theorem f_second_deriv (x : ℝ) : deriv (deriv sorry) x = (50 * x ^ 2 - 525 * x - 175) / (5 * x ^ 2 + 35) ^ (5 / 2) :=
  by
  have h₁ : deriv (deriv f) x = (50 * x ^ 2 - 525 * x - 175) / ((5 * x ^ 2 + 35) ^ 2) := by sorry
  have h₂ : ((5 * x ^ 2 + 35) : ℝ) ^ (5 / 2) = (5 * x ^ 2 + 35) ^ 2 := by sorry
  have h₃ : deriv (deriv f) x = (50 * x ^ 2 - 525 * x - 175) / ((5 * x ^ 2 + 35) ^ (5 / 2)) := by sorry
  --  exact h₃
  hole
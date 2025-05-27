/-- The second derivative of f(x) -/
lemma f_second_deriv (x : ℝ) : deriv (deriv f) x = (50 * x^2 - 525 * x - 175) / ((5 * x^2 + 35)^(5/2)) :=
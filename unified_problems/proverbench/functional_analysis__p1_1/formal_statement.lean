/-- The partial derivative condition for f -/
lemma f_partial_condition (u v : ℝ) :
  deriv (fun u => f u v) u - deriv (fun v => f u v) v = 2 * (u - v) * exp (-(u+v)) :=
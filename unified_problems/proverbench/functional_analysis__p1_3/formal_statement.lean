/-- The partial derivative of g with respect to x -/
lemma partial_g_x (x y : ℝ) :
  deriv (fun x => g x y) x = (4 * x - 2 * y) * exp (-y) :=
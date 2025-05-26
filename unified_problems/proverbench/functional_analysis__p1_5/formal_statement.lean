/-- The critical points of f -/
lemma critical_points (u v : ℝ) :
  deriv (fun u => f u v) u = 0 ∧ deriv (fun v => f u v) v = 0 ↔ u = 0 ∧ v = 0 :=
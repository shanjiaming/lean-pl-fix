theorem h₂ (x : ℝ) (hx : x > 0) (h_imp : 2 ≤ log x → rexp 2 ≤ x) (h : rexp 2 ≤ x) (h₁ : log (rexp 2) ≤ log x) : log (rexp 2) = 2 := by -- rw [log_exp]
  hole
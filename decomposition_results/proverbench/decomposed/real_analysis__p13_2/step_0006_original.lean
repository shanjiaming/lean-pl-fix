theorem h₁ (x : ℝ) (hx : x > 0) (h_imp : 2 ≤ Real.log x → rexp 2 ≤ x) (h : rexp 2 ≤ x) : Real.log (rexp 2) ≤ Real.log x := by
  apply log_le_log
  · positivity
  · exact h
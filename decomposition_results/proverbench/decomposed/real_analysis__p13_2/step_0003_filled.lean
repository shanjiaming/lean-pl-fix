theorem h₁ (x : ℝ) (hx : x > 0) (h : 2 ≤ log x) : rexp 2 ≤ rexp (log x) := by
  --  apply exp_le_exp.2
  --  exact h
  simpa
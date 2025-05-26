theorem h₁ (x : ℝ) (hx : x > 0) (h : 2 ≤ Real.log x) : rexp 2 ≤ rexp (Real.log x) := by
  apply exp_le_exp.2
  exact h
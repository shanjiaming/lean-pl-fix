theorem h₂ (x : ℝ) (hx : x > 0) (h : 2 ≤ Real.log x) (h₁ : rexp 2 ≤ rexp (Real.log x)) : rexp (Real.log x) = x := by -- rw [exp_log hx]
  hole
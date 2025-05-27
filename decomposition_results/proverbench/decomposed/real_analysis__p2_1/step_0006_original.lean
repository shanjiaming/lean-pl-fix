theorem h₄ (x : ℝ) (h : x ∈ target_interval) (h₁ : x > 0) (h₂ : 10 ^ (-5.4) < x) (h₃ : x < 10 ^ (-2.3)) : log (10 ^ (-5.4)) < log x :=
  by
  apply Real.log_lt_log (by positivity)
  exact h₂
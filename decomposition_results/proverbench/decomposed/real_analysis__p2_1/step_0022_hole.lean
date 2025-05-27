theorem h₁₀₅₆ (x : ℝ) (h : x ∈ target_interval) (h₁ : x > 0) (h₂ : 10 ^ (-5.4) < x) (h₃ : x < 10 ^ (-2.3)) (h₄ : log (10 ^ (-5.4)) < log x) (h₅ : log x < log (10 ^ (-2.3))) (h₆ : -5.4 * log 10 < log x) (h₇ : log x < -2.3 * log 10) (h₈ : 2.3 * log 10 < -log x) (h₉ : -log x < 5.4 * log 10) (h₁₀₁ : logb 10 x = log x / log 10) (h₁₀₃ : 2.3 * log 10 < -log x) (h₁₀₄ : log 10 > 0) (h₁₀₅₁ : 2.3 * log 10 < -log x) (h₁₀₅₃ : log 10 > 0) (h₁₀₅₄ : -(log x / log 10) = -log x / log 10) (h₁₀₅₅ : 2.3 * log 10 < -log x) : 2.3 < -log x / log 10 :=
  by
  --  rw [lt_div_iff h₁₀₄]
  nlinarith
  hole
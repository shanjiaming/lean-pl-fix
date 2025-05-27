theorem h₁₁₅ (x : ℝ) (h : x ∈ target_interval) (h₁ : x > 0) (h₂ : 10 ^ (-5.4) < x) (h₃ : x < 10 ^ (-2.3)) (h₄ : log (10 ^ (-5.4)) < log x) (h₅ : log x < log (10 ^ (-2.3))) (h₆ : -5.4 * log 10 < log x) (h₇ : log x < -2.3 * log 10) (h₈ : 2.3 * log 10 < -log x) (h₉ : -log x < 5.4 * log 10) (h₁₀ : 2.3 < -logb 10 x) (h₁₁₁ : logb 10 x = log x / log 10) (h₁₁₃ : -log x < 5.4 * log 10) (h₁₁₄ : log 10 > 0) : -(log x / log 10) < 5.4 :=
  by
  have h₁₁₅₁ : -Real.log x < (5.4 : ℝ) * Real.log 10 := h₉
  have h₁₁₅₂ : -(Real.log x / Real.log 10) = -Real.log x / Real.log 10 := by sorry
  --  rw [h₁₁₅₂]
  have h₁₁₅₃ : -Real.log x < (5.4 : ℝ) * Real.log 10 := h₉
  have h₁₁₅₄ : -Real.log x / Real.log 10 < (5.4 : ℝ) := by sorry
  --  linarith
  hole
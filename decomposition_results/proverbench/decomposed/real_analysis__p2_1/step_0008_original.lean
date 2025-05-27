theorem h₆ (x : ℝ) (h : x ∈ target_interval) (h₁ : x > 0) (h₂ : 10 ^ (-5.4) < x) (h₃ : x < 10 ^ (-2.3)) (h₄ : log (10 ^ (-5.4)) < log x) (h₅ : log x < log (10 ^ (-2.3))) : -5.4 * log 10 < log x :=
  by
  have h₆₁ : Real.log ((10 : ℝ) ^ (-5.4 : ℝ)) = (-5.4 : ℝ) * Real.log 10 := by sorry
  rw [h₆₁] at h₄
  linarith
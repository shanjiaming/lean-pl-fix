theorem h₁ (x : ℝ) (h : x ∈ target_interval) : x > 0 := by
  have h₂ : x ∈ Set.Ioo (10 ^ (-5.4 : ℝ)) (10 ^ (-2.3 : ℝ)) := h
  have h₃ : (10 : ℝ) ^ (-5.4 : ℝ) < x := h₂.1
  have h₄ : x < (10 : ℝ) ^ (-2.3 : ℝ) := h₂.2
  have h₅ : (10 : ℝ) ^ (-5.4 : ℝ) > 0 := by sorry
  --  linarith
  linarith
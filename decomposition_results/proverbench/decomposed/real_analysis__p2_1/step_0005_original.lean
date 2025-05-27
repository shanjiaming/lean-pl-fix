theorem h₃ (x : ℝ) (h : x ∈ target_interval) (h₁ : x > 0) (h₂ : 10 ^ (-5.4) < x) : x < 10 ^ (-2.3) :=
  by
  have h₃ : x ∈ Set.Ioo (10 ^ (-5.4 : ℝ)) (10 ^ (-2.3 : ℝ)) := h
  exact h₃.2
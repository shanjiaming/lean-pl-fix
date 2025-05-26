theorem h₃₄ (x : ℝ) (hx : x ∈ Set.Ioo 0 8) (h₁ : 0 < x) (h₂ : x < 8) (h₃₁ : 0 < x) (h₃₂ : x < 8) (h₃₃ : 0 < 8 - x) : 0 < x * (8 - x) := by -- positivity
  nlinarith
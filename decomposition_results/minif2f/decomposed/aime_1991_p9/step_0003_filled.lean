theorem h₂ (x : ℝ) (m : ℚ) (h₀ : 1 / cos x + tan x = 22 / 7) (h₁ : 1 / sin x + 1 / tan x = ↑m) (h : cos x = 0) : cos x = 0 := by -- simpa using h
  linarith
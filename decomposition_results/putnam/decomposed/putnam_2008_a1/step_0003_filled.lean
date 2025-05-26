theorem h₂ (f : ℝ → ℝ → ℝ) (hf : ∀ (x y z : ℝ), f x y + f y z + f z x = 0) (x : ℝ) (h₁ : f x x + f x x + f x x = 0) : f x x + f x x + f x x = 0 := by -- simpa using h₁
  linarith
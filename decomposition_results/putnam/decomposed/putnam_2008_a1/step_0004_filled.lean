theorem h₃ (f : ℝ → ℝ → ℝ) (hf : ∀ (x y z : ℝ), f x y + f y z + f z x = 0) (x : ℝ) (h₁ h₂ : f x x + f x x + f x x = 0) : 3 * f x x = 0 := by -- linarith
  linarith
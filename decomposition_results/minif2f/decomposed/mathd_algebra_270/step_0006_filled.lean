theorem h₃₁ (f : ℝ → ℝ) (h₀ : ∀ (x : ℝ), x ≠ -2 → f x = 1 / (x + 2)) (h₁ : f 1 = 1 / 3) (h₂ : f (f 1) = f (1 / 3)) : 1 / 3 ≠ -2 := by -- norm_num
  norm_num
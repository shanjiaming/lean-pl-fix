theorem h₂ (f : ℝ → ℝ) (h₀ : ∀ (x : ℝ), x ≠ -2 → f x = 1 / (x + 2)) (h₁ : f 1 = 1 / 3) : f (f 1) = f (1 / 3) := by -- rw [h₁] <;> norm_num
  hole
theorem h₁ (x : ℝ) : ∀ (x : ℝ), f x = 1 := by
  --  intro x
  have h₂ : f x = (8 * x - x ^ 2 : ℝ) ^ (1 / 3 : ℝ) := rfl
  --  rw [h₂]
  have h₃ : (1 / 3 : ℝ) = (0 : ℝ) := by sorry
  --  rw [h₃]
  have h₄ : (8 * x - x ^ 2 : ℝ) ^ (0 : ℝ) = 1 := by sorry
  --  rw [h₄] <;> norm_num
  linarith
theorem h₄ (x y z : ℝ) (h₀ : 3 * x + y = 17) (h₁ : 5 * y + z = 14) (h₂ : 3 * x + 5 * z = 41) (h₃ : 6 * x + 6 * y + 6 * z = 72) : x + y + z = 12 := by
  have h₄₁ : x + y + z = (6 * x + 6 * y + 6 * z) / 6 := by sorry
  --  rw [h₄₁]
  --  --  rw [h₃] <;> norm_num <;> linarith
  hole
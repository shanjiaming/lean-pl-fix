theorem h₁ (x : ℝ) : cos (2 * x - 6) - 1 = -2 * sin (x - 3) ^ 2 :=
  by
  have h₂ : Real.cos (2 * x - 6) = Real.cos (2 * (x - 3)) := by sorry
  --  rw [h₂]
  have h₃ : Real.cos (2 * (x - 3)) = 1 - 2 * Real.sin (x - 3) ^ 2 := by sorry
  --  --  rw [h₃] <;> ring
  linarith
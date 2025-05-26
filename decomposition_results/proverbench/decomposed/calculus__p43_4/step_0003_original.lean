theorem h₂ (h₁ : 2.5 - 2 ≠ 0) : sorry - sorry = (2.5 - 2) * -32 :=
  by
  have h₃ : (heightFunction 2.5 - heightFunction 2 : ℝ) / (2.5 - 2 : ℝ) = -32 := averageVelocity
  have h₄ : (heightFunction 2.5 - heightFunction 2 : ℝ) = -32 * (2.5 - 2 : ℝ) := by sorry
  have h₅ : (heightFunction 2.5 - heightFunction 2 : ℝ) = (2.5 - 2 : ℝ) * -32 := by sorry
  exact h₅
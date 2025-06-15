theorem graphSatisfiesAvgVelocity :
(2.5 - 2) * -32 = heightFunction 2.5 - heightFunction 2 := by
  have h₁ : (2.5 - 2 : ℝ) ≠ 0 := by
    admit
  
  have h₂ : heightFunction 2.5 - heightFunction 2 = (2.5 - 2 : ℝ) * -32 := by
    have h₃ : (heightFunction 2.5 - heightFunction 2 : ℝ) / (2.5 - 2 : ℝ) = -32 := averageVelocity
    have h₄ : (heightFunction 2.5 - heightFunction 2 : ℝ) = -32 * (2.5 - 2 : ℝ) := by
      have h₅ : (heightFunction 2.5 - heightFunction 2 : ℝ) = -32 * (2.5 - 2 : ℝ) := by
        have h₆ : (2.5 - 2 : ℝ) ≠ 0 := h₁
        admit
      admit
    have h₅ : (heightFunction 2.5 - heightFunction 2 : ℝ) = (2.5 - 2 : ℝ) * -32 := by
      admit
    admit
  
  have h₃ : (2.5 - 2 : ℝ) * -32 = heightFunction 2.5 - heightFunction 2 := by
    admit
  
  admit
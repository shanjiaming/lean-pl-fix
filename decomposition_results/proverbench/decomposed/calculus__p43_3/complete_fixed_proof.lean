theorem averageVelocity : (heightFunction 2.5 - heightFunction 2) / (2.5 - 2) = -32 := by
  have h_denominator : (2.5 - 2 : ℝ) = 1 / 2 := by
    admit
  
  have h_numerator : (heightFunction 2.5 - heightFunction 2 : ℝ) = -16 := by
    have h₁ : heightFunction 2.5 = 0 := heightAtTwoPointFive
    have h₂ : heightFunction 2 = 16 := heightAtTwo
    admit
  
  have h_final : (heightFunction 2.5 - heightFunction 2) / (2.5 - 2) = -32 := by
    admit
  
  admit
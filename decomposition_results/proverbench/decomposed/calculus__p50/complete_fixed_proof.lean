theorem integral_x_sin_x_pi_over_2 :
∫ x in Icc 0 (π / 2), x * sin x = 1 := by
  have h₁ : (∫ x in Icc 0 (π / 2), x * sin x) = 1 := by
    have h₂ : (∫ x in (0 : ℝ)..(π / 2 : ℝ), x * sin x) = 1 := by
      
      admit
    
    have h₃ : (∫ x in Icc 0 (π / 2), x * sin x) = (∫ x in (0 : ℝ)..(π / 2 : ℝ), x * sin x) := by
      admit
    admit
  admit
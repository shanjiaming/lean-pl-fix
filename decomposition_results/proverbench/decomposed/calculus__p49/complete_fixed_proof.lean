theorem integral_of_rational_function_over_interval :
∫ x in Set.Icc (-1) 1, (x^2 / (1 + x^2)) = 2 - π / 2 := by
  have h_main : (∫ x in Set.Icc (-1) 1, (x^2 / (1 + x^2 : ℝ))) = 2 - π / 2 := by
    have h₁ : (∫ x in Set.Icc (-1) 1, (x^2 / (1 + x^2 : ℝ))) = ∫ x in Set.Icc (-1) 1, (1 : ℝ) - ∫ x in Set.Icc (-1) 1, (1 / (1 + x^2 : ℝ)) := by
      have h₁₁ : (∫ x in Set.Icc (-1) 1, (x^2 / (1 + x^2 : ℝ))) = ∫ x in Set.Icc (-1) 1, (1 : ℝ) - (1 / (1 + x^2 : ℝ)) := by
        congr
        ext x
        have h₁₂ : x ^ 2 / (1 + x ^ 2 : ℝ) = 1 - 1 / (1 + x ^ 2 : ℝ) := by
          by_cases h : (1 + x ^ 2 : ℝ) = 0
          · have h₂ : x ^ 2 = -1 := by
              admit
            have h₃ : (x : ℝ) ^ 2 ≥ 0 := by admit
            admit
        admit
      rw [h₁₁]
      
      have h₂ : (∫ x in Set.Icc (-1) 1, (1 : ℝ) - (1 / (1 + x ^ 2 : ℝ))) = (∫ x in Set.Icc (-1) 1, (1 : ℝ)) - ∫ x in Set.Icc (-1) 1, (1 / (1 + x ^ 2 : ℝ)) := by
        admit
      admit
    admit
  admit
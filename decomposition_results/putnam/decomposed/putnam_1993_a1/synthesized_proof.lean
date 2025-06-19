theorem putnam_1993_a1
: 0 < ((4 / 9) : ℝ ) ∧ ((4 / 9) : ℝ ) < (4 * Real.sqrt 2) / 9 ∧ (∫ x in Set.Ioo 0 ((Real.sqrt 2) / 3), max (((4 / 9) : ℝ ) - (2 * x - 3 * x ^ 3)) 0) = (∫ x in Set.Ioo 0 ((Real.sqrt 6) / 3), max ((2 * x - 3 * x ^ 3) - ((4 / 9) : ℝ )) 0) := by
  have h₁ : 0 < ((4 / 9) : ℝ) := by norm_num
  
  have h₂ : ((4 / 9) : ℝ) < (4 * Real.sqrt 2) / 9 := by
    have h₂₁ : Real.sqrt 2 > 1 := by
      admit
    have h₂₂ : (4 : ℝ) / 9 < (4 * Real.sqrt 2) / 9 := by
      linarith
    linarith
  
  have h₃ : (∫ x in Set.Ioo 0 ((Real.sqrt 2) / 3), max (((4 / 9) : ℝ) - (2 * x - 3 * x ^ 3)) 0) = (∫ x in Set.Ioo 0 ((Real.sqrt 6) / 3), max ((2 * x - 3 * x ^ 3) - ((4 / 9) : ℝ)) 0) := by
    have h₃₁ : (∫ x in Set.Ioo 0 ((Real.sqrt 2) / 3), max (((4 / 9) : ℝ) - (2 * x - 3 * x ^ 3)) 0) = 0 := by
      
      have h₃₁₁ : ∀ x ∈ Set.Ioo 0 ((Real.sqrt 2) / 3), (max (((4 / 9) : ℝ) - (2 * x - 3 * x ^ 3)) 0 : ℝ) = 0 := by
        intro x hx
        have h₃₁₂ : 0 < x := by
          admit
        have h₃₁₃ : x < (Real.sqrt 2) / 3 := by
          admit
        have h₃₁₄ : (4 / 9 : ℝ) - (2 * x - 3 * x ^ 3) ≤ 0 := by
          
          have h₃₁₅ : 0 < x := h₃₁₂
          have h₃₁₆ : x < (Real.sqrt 2) / 3 := h₃₁₃
          have h₃₁₇ : 0 < Real.sqrt 2 := Real.sqrt_pos.mpr (by norm_num)
          have h₃₁₈ : 0 < Real.sqrt 2 := Real.sqrt_pos.mpr (by norm_num)
          have h₃₁₉ : 0 < Real.sqrt 2 := Real.sqrt_pos.mpr (by norm_num)
          
          admit
        
        have h₃₁₅ : (max (((4 / 9) : ℝ) - (2 * x - 3 * x ^ 3)) 0 : ℝ) = 0 := by
          admit
        linarith
      
      have h₃₁₆ : (∫ x in Set.Ioo 0 ((Real.sqrt 2) / 3), max (((4 / 9) : ℝ) - (2 * x - 3 * x ^ 3)) 0) = 0 := by
        have h₃₁₇ : (∫ x in Set.Ioo 0 ((Real.sqrt 2) / 3), max (((4 / 9) : ℝ) - (2 * x - 3 * x ^ 3)) 0) = ∫ x in Set.Ioo 0 ((Real.sqrt 2) / 3), (0 : ℝ) := by
          admit
        admit
      linarith
    have h₃₂ : (∫ x in Set.Ioo 0 ((Real.sqrt 6) / 3), max ((2 * x - 3 * x ^ 3) - ((4 / 9) : ℝ)) 0) = 0 := by
      
      have h₃₂₁ : ∀ x ∈ Set.Ioo 0 ((Real.sqrt 6) / 3), (max ((2 * x - 3 * x ^ 3) - ((4 / 9) : ℝ)) 0 : ℝ) = 0 := by
        intro x hx
        have h₃₂₂ : 0 < x := by
          admit
        have h₃₂₃ : x < (Real.sqrt 6) / 3 := by
          admit
        have h₃₂₄ : (2 * x - 3 * x ^ 3) - ((4 / 9) : ℝ) ≤ 0 := by
          
          have h₃₂₅ : 0 < x := h₃₂₂
          have h₃₂₆ : x < (Real.sqrt 6) / 3 := h₃₂₃
          have h₃₂₇ : 0 < Real.sqrt 6 := Real.sqrt_pos.mpr (by norm_num)
          have h₃₂₈ : 0 < Real.sqrt 6 := Real.sqrt_pos.mpr (by norm_num)
          have h₃₂₉ : 0 < Real.sqrt 6 := Real.sqrt_pos.mpr (by norm_num)
          
          admit
        
        have h₃₂₅ : (max ((2 * x - 3 * x ^ 3) - ((4 / 9) : ℝ)) 0 : ℝ) = 0 := by
          admit
        linarith
      
      have h₃₂₆ : (∫ x in Set.Ioo 0 ((Real.sqrt 6) / 3), max ((2 * x - 3 * x ^ 3) - ((4 / 9) : ℝ)) 0) = 0 := by
        have h₃₂₇ : (∫ x in Set.Ioo 0 ((Real.sqrt 6) / 3), max ((2 * x - 3 * x ^ 3) - ((4 / 9) : ℝ)) 0) = ∫ x in Set.Ioo 0 ((Real.sqrt 6) / 3), (0 : ℝ) := by
          admit
        admit
      linarith
    
    linarith
  
  norm_cast

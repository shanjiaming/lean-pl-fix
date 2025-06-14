macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem integral_of_function_equals_ln_plus_168 :
(∫ x in Set.Icc 2 8, (1 / x + x^2 : ℝ)) = Real.log 4 + 168 := by
  have h_main : (∫ x in Set.Icc 2 8, (1 / x + x^2 : ℝ)) = Real.log 4 + 168 := by
    have h₁ : (∫ x in Set.Icc 2 8, (1 / x + x^2 : ℝ)) = (∫ x in Set.Icc 2 8, (1 / x : ℝ)) + ∫ x in Set.Icc 2 8, (x^2 : ℝ) := by
      
      have h₁₁ : (∫ x in Set.Icc 2 8, (1 / x + x^2 : ℝ)) = ∫ x in Set.Icc 2 8, ((1 / x : ℝ) + (x^2 : ℝ)) := by hole_4
      rw [h₁₁]
      
      have h₁₂ : (∫ x in Set.Icc 2 8, ((1 / x : ℝ) + (x^2 : ℝ))) = (∫ x in Set.Icc 2 8, (1 / x : ℝ)) + ∫ x in Set.Icc 2 8, (x^2 : ℝ) := by
        hole_5
      hole_3
    rw [h₁]
    
    have h₂ : (∫ x in Set.Icc 2 8, (1 / x : ℝ)) = Real.log 8 - Real.log 2 := by
      have h₂₁ : (∫ x in Set.Icc 2 8, (1 / x : ℝ)) = Real.log 8 - Real.log 2 := by
        
        have h₂₂ : Real.log 8 - Real.log 2 = Real.log (8 / 2) := by
          hole_8
        rw [h₂₂]
        have h₂₃ : (∫ x in Set.Icc 2 8, (1 / x : ℝ)) = Real.log (8 / 2) := by
          
          have h₂₄ : ∫ x in Set.Icc 2 8, (1 / x : ℝ) = ∫ x in (2 : ℝ)..(8 : ℝ), (1 / x : ℝ) := by
            hole_10
          rw [h₂₄]
          
          have h₂₅ : ∫ x in (2 : ℝ)..(8 : ℝ), (1 / x : ℝ) = Real.log (8 / 2) := by
            
            hole_11
          hole_9
        hole_7
      hole_6
    
    have h₃ : (∫ x in Set.Icc 2 8, (x^2 : ℝ)) = (168 : ℝ) := by
      have h₃₁ : (∫ x in Set.Icc 2 8, (x^2 : ℝ)) = (168 : ℝ) := by
        
        have h₃₂ : ∫ x in Set.Icc 2 8, (x^2 : ℝ) = ∫ x in (2 : ℝ)..(8 : ℝ), (x^2 : ℝ) := by
          hole_14
        rw [h₃₂]
        
        have h₃₃ : ∫ x in (2 : ℝ)..(8 : ℝ), (x^2 : ℝ) = (168 : ℝ) := by
          hole_15
        hole_13
      hole_12
    rw [h₂, h₃]
    
    have h₄ : Real.log 4 = Real.log 8 - Real.log 2 := by
      have h₄₁ : Real.log 4 = Real.log (8 / 2) := by hole_17
      rw [h₄₁]
      have h₄₂ : Real.log (8 / 2) = Real.log 8 - Real.log 2 := by
        hole_18
      hole_16
    hole_2
  hole_1
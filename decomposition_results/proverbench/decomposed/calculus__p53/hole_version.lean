macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_27" : tactic => `(tactic| admit)
macro "hole_28" : tactic => `(tactic| admit)
macro "hole_29" : tactic => `(tactic| admit)
macro "hole_30" : tactic => `(tactic| admit)
macro "hole_32" : tactic => `(tactic| admit)
macro "hole_31" : tactic => `(tactic| admit)
macro "hole_26" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_34" : tactic => `(tactic| admit)
macro "hole_35" : tactic => `(tactic| admit)
macro "hole_36" : tactic => `(tactic| admit)
macro "hole_37" : tactic => `(tactic| admit)
macro "hole_39" : tactic => `(tactic| admit)
macro "hole_38" : tactic => `(tactic| admit)
macro "hole_41" : tactic => `(tactic| admit)
macro "hole_40" : tactic => `(tactic| admit)
macro "hole_33" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_42" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem integral_of_rational_function :
∫ x in a..b, (4 : ℝ) / (x^2 - 7*x + 12) = 4 * log (196 / 96) - 4 * log (197 / 97) := by
  have h₁ : a = 100 := by
    hole_2
  
  have h₂ : b = 200 := by
    hole_3
  
  have h₃ : ∫ x in (100 : ℝ)..(200 : ℝ), (4 : ℝ) / (x^2 - 7*x + 12) = 4 * log (196 / 96) - 4 * log (197 / 97) := by
    have h₄ : ∫ x in (100 : ℝ)..(200 : ℝ), (4 : ℝ) / (x^2 - 7*x + 12) = (4 : ℝ) * (Real.log (200 - 4) - Real.log (200 - 3)) - (4 : ℝ) * (Real.log (100 - 4) - Real.log (100 - 3)) := by
      
      have h₅ : ∫ x in (100 : ℝ)..(200 : ℝ), (4 : ℝ) / (x^2 - 7*x + 12) = ∫ x in (100 : ℝ)..(200 : ℝ), ( (4 : ℝ) / (x - 4) + (-4 : ℝ) / (x - 3) ) := by
        
        congr
        ext x
        have h₁ : x ^ 2 - 7 * x + 12 = (x - 4) * (x - 3) := by hole_7
        rw [h₁]
        have h₂ : x ≠ 4 := by
          hole_8
        have h₃ : x ≠ 3 := by
          hole_9
        hole_6
      rw [h₅]
      
      have h₆ : ∫ x in (100 : ℝ)..(200 : ℝ), ( (4 : ℝ) / (x - 4) + (-4 : ℝ) / (x - 3) ) = (∫ x in (100 : ℝ)..(200 : ℝ), (4 : ℝ) / (x - 4)) + ∫ x in (100 : ℝ)..(200 : ℝ), (-4 : ℝ) / (x - 3) := by
        hole_10
      rw [h₆]
      
      have h₇ : ∫ x in (100 : ℝ)..(200 : ℝ), (4 : ℝ) / (x - 4) = (4 : ℝ) * ( Real.log (200 - 4) - Real.log (100 - 4) ) := by
        have h₇₁ : ∫ x in (100 : ℝ)..(200 : ℝ), (4 : ℝ) / (x - 4) = ∫ x in (100 : ℝ)..(200 : ℝ), (4 : ℝ) * (1 / (x - 4)) := by
          hole_12
        rw [h₇₁]
        have h₇₂ : ∫ x in (100 : ℝ)..(200 : ℝ), (4 : ℝ) * (1 / (x - 4)) = (4 : ℝ) * ∫ x in (100 : ℝ)..(200 : ℝ), (1 / (x - 4)) := by
          
          hole_13
        rw [h₇₂]
        have h₇₃ : ∫ x in (100 : ℝ)..(200 : ℝ), (1 / (x - 4) : ℝ) = Real.log (200 - 4) - Real.log (100 - 4) := by
          
          have h₇₄ : ∫ x in (100 : ℝ)..(200 : ℝ), (1 / (x - 4) : ℝ) = Real.log (200 - 4) - Real.log (100 - 4) := by
            
            have h₇₅ : (200 : ℝ) - 4 > 0 := by hole_16
            have h₇₆ : (100 : ℝ) - 4 > 0 := by hole_17
            have h₇₇ : (200 : ℝ) - 3 > 0 := by hole_18
            have h₇₈ : (100 : ℝ) - 3 > 0 := by hole_19
            
            have h₇₉ : ∫ x in (100 : ℝ)..(200 : ℝ), (1 / (x - 4) : ℝ) = Real.log (200 - 4) - Real.log (100 - 4) := by
              
              have h₈₀ : ∫ x in (100 : ℝ)..(200 : ℝ), (1 / (x - 4) : ℝ) = Real.log (200 - 4) - Real.log (100 - 4) := by
                
                hole_21
              hole_20
            hole_15
          hole_14
        hole_11
      have h₈ : ∫ x in (100 : ℝ)..(200 : ℝ), (-4 : ℝ) / (x - 3) = (-4 : ℝ) * ( Real.log (200 - 3) - Real.log (100 - 3) ) := by
        have h₈₁ : ∫ x in (100 : ℝ)..(200 : ℝ), (-4 : ℝ) / (x - 3) = ∫ x in (100 : ℝ)..(200 : ℝ), (-4 : ℝ) * (1 / (x - 3)) := by
          hole_23
        rw [h₈₁]
        have h₈₂ : ∫ x in (100 : ℝ)..(200 : ℝ), (-4 : ℝ) * (1 / (x - 3)) = (-4 : ℝ) * ∫ x in (100 : ℝ)..(200 : ℝ), (1 / (x - 3)) := by
          
          hole_24
        rw [h₈₂]
        have h₈₃ : ∫ x in (100 : ℝ)..(200 : ℝ), (1 / (x - 3) : ℝ) = Real.log (200 - 3) - Real.log (100 - 3) := by
          
          have h₈₄ : ∫ x in (100 : ℝ)..(200 : ℝ), (1 / (x - 3) : ℝ) = Real.log (200 - 3) - Real.log (100 - 3) := by
            
            have h₈₅ : (200 : ℝ) - 3 > 0 := by hole_27
            have h₈₆ : (100 : ℝ) - 3 > 0 := by hole_28
            have h₈₇ : (200 : ℝ) - 4 > 0 := by hole_29
            have h₈₈ : (100 : ℝ) - 4 > 0 := by hole_30
            
            have h₈₉ : ∫ x in (100 : ℝ)..(200 : ℝ), (1 / (x - 3) : ℝ) = Real.log (200 - 3) - Real.log (100 - 3) := by
              
              have h₉₀ : ∫ x in (100 : ℝ)..(200 : ℝ), (1 / (x - 3) : ℝ) = Real.log (200 - 3) - Real.log (100 - 3) := by
                
                hole_32
              hole_31
            hole_26
          hole_25
        hole_22
      hole_5
    have h₅ : (4 : ℝ) * (Real.log (200 - 4) - Real.log (200 - 3)) - (4 : ℝ) * (Real.log (100 - 4) - Real.log (100 - 3)) = 4 * log (196 / 96) - 4 * log (197 / 97) := by
      have h₅₁ : Real.log (200 - 4) = Real.log 196 := by hole_34
      have h₅₂ : Real.log (200 - 3) = Real.log 197 := by hole_35
      have h₅₃ : Real.log (100 - 4) = Real.log 96 := by hole_36
      have h₅₄ : Real.log (100 - 3) = Real.log 97 := by hole_37
      rw [h₅₁, h₅₂, h₅₃, h₅₄]
      have h₅₅ : Real.log 196 = Real.log (196 / 96) + Real.log 96 := by
        have h₅₅₁ : Real.log (196 / 96) = Real.log 196 - Real.log 96 := by
          hole_39
        hole_38
      have h₅₆ : Real.log 197 = Real.log (197 / 97) + Real.log 97 := by
        have h₅₆₁ : Real.log (197 / 97) = Real.log 197 - Real.log 97 := by
          hole_41
        hole_40
      hole_33
    hole_4
  
  have h₄ : ∫ x in a..b, (4 : ℝ) / (x^2 - 7*x + 12) = 4 * log (196 / 96) - 4 * log (197 / 97) := by
    hole_42
  
  hole_1
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_29" : tactic => `(tactic| admit)
macro "hole_30" : tactic => `(tactic| admit)
macro "hole_32" : tactic => `(tactic| admit)
macro "hole_33" : tactic => `(tactic| admit)
macro "hole_31" : tactic => `(tactic| admit)
macro "hole_28" : tactic => `(tactic| admit)
macro "hole_27" : tactic => `(tactic| admit)
macro "hole_26" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_34" : tactic => `(tactic| admit)
macro "hole_35" : tactic => `(tactic| admit)
macro "hole_36" : tactic => `(tactic| admit)
macro "hole_37" : tactic => `(tactic| admit)
macro "hole_38" : tactic => `(tactic| admit)
macro "hole_39" : tactic => `(tactic| admit)
macro "hole_40" : tactic => `(tactic| admit)
macro "hole_41" : tactic => `(tactic| admit)
macro "hole_42" : tactic => `(tactic| admit)
macro "hole_43" : tactic => `(tactic| admit)
macro "hole_44" : tactic => `(tactic| admit)
macro "hole_45" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_47" : tactic => `(tactic| admit)
macro "hole_46" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_49" : tactic => `(tactic| admit)
macro "hole_50" : tactic => `(tactic| admit)
macro "hole_51" : tactic => `(tactic| admit)
macro "hole_52" : tactic => `(tactic| admit)
macro "hole_53" : tactic => `(tactic| admit)
macro "hole_48" : tactic => `(tactic| admit)
macro "hole_55" : tactic => `(tactic| admit)
macro "hole_56" : tactic => `(tactic| admit)
macro "hole_54" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem aime_1987_p5 (x y : ℤ) (h₀ : y ^ 2 + 3 * (x ^ 2 * y ^ 2) = 30 * x ^ 2 + 517) :
    3 * (x ^ 2 * y ^ 2) = 588 := by
  have h₁ : x ≠ 0 := by
    by_contra h
    have h₂ : x = 0 := by hole_3
    rw [h₂] at h₀
    have h₃ : y ^ 2 = 517 := by
      hole_4
    have h₄ : y ^ 2 = 517 := by hole_5
    have h₅ : y ≤ 23 := by
      hole_6
    have h₆ : y ≥ -23 := by
      hole_7
    have h₇ : y ≤ 23 := by hole_8
    have h₈ : y ≥ -23 := by hole_9
    hole_2
  
  have h₂ : (3 * x ^ 2 + 1 : ℤ) ∣ 507 := by
    have h₂₁ : (3 * x ^ 2 + 1 : ℤ) ∣ 30 * x ^ 2 + 517 := by
      use y ^ 2
      have h₂₁₁ : y ^ 2 + 3 * (x ^ 2 * y ^ 2) = 30 * x ^ 2 + 517 := h₀
      have h₂₁₂ : y ^ 2 * (3 * x ^ 2 + 1) = 30 * x ^ 2 + 517 := by
        hole_12
      hole_11
    have h₂₂ : (3 * x ^ 2 + 1 : ℤ) ∣ 507 := by
      have h₂₂₁ : (3 * x ^ 2 + 1 : ℤ) ∣ 30 * x ^ 2 + 517 := h₂₁
      have h₂₂₂ : (3 * x ^ 2 + 1 : ℤ) ∣ 507 := by
        have h₂₂₃ : (30 * x ^ 2 + 517 : ℤ) = 10 * (3 * x ^ 2 + 1) + 507 := by hole_15
        hole_14
      hole_13
    hole_10
  
  have h₃ : x ^ 2 = 4 := by
    have h₃₁ : (3 * x ^ 2 + 1 : ℤ) ∣ 507 := h₂
    have h₃₂ : x ^ 2 ≥ 1 := by
      by_contra h₃₂
      have h₃₃ : x ^ 2 ≤ 0 := by hole_18
      have h₃₄ : x = 0 := by
        hole_19
      hole_17
    
    
    
    have h₃₅ : 3 * x ^ 2 + 1 = 13 := by
      
      have h₃₅₁ : 3 * x ^ 2 + 1 = 13 := by
        
        have h₃₅₂ : 3 * x ^ 2 + 1 ∣ 507 := h₃₁
        have h₃₅₃ : 3 * x ^ 2 + 1 = 1 ∨ 3 * x ^ 2 + 1 = 3 ∨ 3 * x ^ 2 + 1 = 13 ∨ 3 * x ^ 2 + 1 = 39 ∨ 3 * x ^ 2 + 1 = 169 ∨ 3 * x ^ 2 + 1 = 507 := by
          
          have h₃₅₄ : 3 * x ^ 2 + 1 > 0 := by hole_23
          have h₃₅₅ : 3 * x ^ 2 + 1 ≤ 507 := by
            
            have h₃₅₆ : 3 * x ^ 2 + 1 ∣ 507 := h₃₅₂
            have h₃₅₇ : 3 * x ^ 2 + 1 ≤ 507 := Int.le_of_dvd (by norm_num) h₃₅₆
            hole_24
          
          have h₃₅₈ : 3 * x ^ 2 + 1 = 1 ∨ 3 * x ^ 2 + 1 = 3 ∨ 3 * x ^ 2 + 1 = 13 ∨ 3 * x ^ 2 + 1 = 39 ∨ 3 * x ^ 2 + 1 = 169 ∨ 3 * x ^ 2 + 1 = 507 := by
            
            have h₃₅₉ : 3 * x ^ 2 + 1 ∣ 507 := h₃₅₂
            have h₃₅₁₀ : 3 * x ^ 2 + 1 = 1 ∨ 3 * x ^ 2 + 1 = 3 ∨ 3 * x ^ 2 + 1 = 13 ∨ 3 * x ^ 2 + 1 = 39 ∨ 3 * x ^ 2 + 1 = 169 ∨ 3 * x ^ 2 + 1 = 507 := by
              
              have h₃₅₁₁ : 3 * x ^ 2 + 1 = 1 ∨ 3 * x ^ 2 + 1 = 3 ∨ 3 * x ^ 2 + 1 = 13 ∨ 3 * x ^ 2 + 1 = 39 ∨ 3 * x ^ 2 + 1 = 169 ∨ 3 * x ^ 2 + 1 = 507 := by
                
                have h₃₅₁₂ : 3 * x ^ 2 + 1 ∣ 507 := h₃₅₂
                have h₃₅₁₃ : 3 * x ^ 2 + 1 = 1 ∨ 3 * x ^ 2 + 1 = 3 ∨ 3 * x ^ 2 + 1 = 13 ∨ 3 * x ^ 2 + 1 = 39 ∨ 3 * x ^ 2 + 1 = 169 ∨ 3 * x ^ 2 + 1 = 507 := by
                  
                  have h₃₅₁₄ : 3 * x ^ 2 + 1 ∣ 507 := h₃₅₂
                  have h₃₅₁₅ : 3 * x ^ 2 + 1 ≤ 507 := by
                    
                    have h₃₅₁₆ : 3 * x ^ 2 + 1 ∣ 507 := h₃₅₂
                    have h₃₅₁₇ : 3 * x ^ 2 + 1 ≤ 507 := Int.le_of_dvd (by norm_num) h₃₅₁₆
                    hole_29
                  have h₃₅₁₈ : 3 * x ^ 2 + 1 > 0 := by hole_30
                  
                  have h₃₅₁₉ : 3 * x ^ 2 + 1 = 1 ∨ 3 * x ^ 2 + 1 = 3 ∨ 3 * x ^ 2 + 1 = 13 ∨ 3 * x ^ 2 + 1 = 39 ∨ 3 * x ^ 2 + 1 = 169 ∨ 3 * x ^ 2 + 1 = 507 := by
                    
                    have h₃₅₂₀ : 3 * x ^ 2 + 1 ∣ 507 := h₃₅₂
                    have h₃₅₂₁ : 3 * x ^ 2 + 1 ≤ 507 := by hole_32
                    have h₃₅₂₂ : 3 * x ^ 2 + 1 > 0 := by hole_33
                    
                    hole_31
                  hole_28
                hole_27
              hole_26
            hole_25
          hole_22
        
        rcases h₃₅₃ with (h₃₅₃ | h₃₅₃ | h₃₅₃ | h₃₅₃ | h₃₅₃ | h₃₅₃)
        · 
          exfalso
          have h₃₅₄ : x ^ 2 = 0 := by
            hole_34
          have h₃₅₅ : x = 0 := by
            hole_35
          contradiction
        · 
          exfalso
          have h₃₅₄ : x ^ 2 = 2 / 3 := by
            hole_36
          have h₃₅₅ : x ^ 2 ≥ 1 := by hole_37
          norm_num at h₃₅₄
          <;> omega
        · 
          exact h₃₅₃
        · 
          exfalso
          have h₃₅₄ : x ^ 2 = 38 / 3 := by
            hole_38
          have h₃₅₅ : x ^ 2 ≥ 1 := by hole_39
          norm_num at h₃₅₄
          <;> omega
        · 
          exfalso
          have h₃₅₄ : x ^ 2 = 56 := by
            hole_40
          have h₃₅₅ : x ^ 2 ≥ 1 := by hole_41
          have h₃₅₆ : x ≤ 7 := by hole_42
          have h₃₅₇ : x ≥ -7 := by hole_43
          interval_cases x <;> norm_num at h₃₅₄ ⊢ <;> omega
        · 
          exfalso
          have h₃₅₄ : x ^ 2 = 506 / 3 := by
            hole_44
          have h₃₅₅ : x ^ 2 ≥ 1 := by hole_45
          hole_21
      hole_20
    
    have h₃₆ : x ^ 2 = 4 := by
      have h₃₆₁ : 3 * x ^ 2 + 1 = 13 := h₃₅
      have h₃₆₂ : x ^ 2 = 4 := by
        hole_47
      hole_46
    hole_16
  
  have h₄ : y ^ 2 = 49 := by
    have h₄₁ : y ^ 2 + 3 * (x ^ 2 * y ^ 2) = 30 * x ^ 2 + 517 := h₀
    have h₄₂ : x ^ 2 = 4 := h₃
    have h₄₃ : y ^ 2 + 3 * (4 * y ^ 2) = 30 * 4 + 517 := by
      hole_49
    have h₄₄ : y ^ 2 + 3 * (4 * y ^ 2) = 30 * 4 + 517 := by
      hole_50
    have h₄₅ : y ^ 2 + 12 * y ^ 2 = 120 + 517 := by
      hole_51
    have h₄₆ : 13 * y ^ 2 = 637 := by
      hole_52
    have h₄₇ : y ^ 2 = 49 := by
      hole_53
    hole_48
  
  have h₅ : 3 * (x ^ 2 * y ^ 2) = 588 := by
    have h₅₁ : x ^ 2 = 4 := h₃
    have h₅₂ : y ^ 2 = 49 := h₄
    have h₅₃ : (x ^ 2 : ℤ) = 4 := by hole_55
    have h₅₄ : (y ^ 2 : ℤ) = 49 := by hole_56
    hole_54
  
  hole_1
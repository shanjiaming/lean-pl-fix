macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_26" : tactic => `(tactic| admit)
macro "hole_28" : tactic => `(tactic| admit)
macro "hole_27" : tactic => `(tactic| admit)
macro "hole_29" : tactic => `(tactic| admit)
macro "hole_31" : tactic => `(tactic| admit)
macro "hole_30" : tactic => `(tactic| admit)
macro "hole_32" : tactic => `(tactic| admit)
macro "hole_34" : tactic => `(tactic| admit)
macro "hole_33" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_35" : tactic => `(tactic| admit)
macro "hole_36" : tactic => `(tactic| admit)
macro "hole_37" : tactic => `(tactic| admit)
macro "hole_38" : tactic => `(tactic| admit)
macro "hole_40" : tactic => `(tactic| admit)
macro "hole_39" : tactic => `(tactic| admit)
macro "hole_41" : tactic => `(tactic| admit)
macro "hole_43" : tactic => `(tactic| admit)
macro "hole_45" : tactic => `(tactic| admit)
macro "hole_44" : tactic => `(tactic| admit)
macro "hole_46" : tactic => `(tactic| admit)
macro "hole_48" : tactic => `(tactic| admit)
macro "hole_47" : tactic => `(tactic| admit)
macro "hole_42" : tactic => `(tactic| admit)
macro "hole_49" : tactic => `(tactic| admit)
macro "hole_50" : tactic => `(tactic| admit)
macro "hole_51" : tactic => `(tactic| admit)
macro "hole_52" : tactic => `(tactic| admit)
macro "hole_54" : tactic => `(tactic| admit)
macro "hole_53" : tactic => `(tactic| admit)
macro "hole_55" : tactic => `(tactic| admit)
macro "hole_57" : tactic => `(tactic| admit)
macro "hole_59" : tactic => `(tactic| admit)
macro "hole_58" : tactic => `(tactic| admit)
macro "hole_60" : tactic => `(tactic| admit)
macro "hole_62" : tactic => `(tactic| admit)
macro "hole_61" : tactic => `(tactic| admit)
macro "hole_56" : tactic => `(tactic| admit)
macro "hole_63" : tactic => `(tactic| admit)
macro "hole_64" : tactic => `(tactic| admit)
macro "hole_65" : tactic => `(tactic| admit)
macro "hole_66" : tactic => `(tactic| admit)
macro "hole_68" : tactic => `(tactic| admit)
macro "hole_67" : tactic => `(tactic| admit)
macro "hole_69" : tactic => `(tactic| admit)
macro "hole_71" : tactic => `(tactic| admit)
macro "hole_73" : tactic => `(tactic| admit)
macro "hole_72" : tactic => `(tactic| admit)
macro "hole_74" : tactic => `(tactic| admit)
macro "hole_76" : tactic => `(tactic| admit)
macro "hole_75" : tactic => `(tactic| admit)
macro "hole_70" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_77" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_78" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem odd_divisors_of_polynomial_congruence_mod_20 (d x : ℤ) (hd : d ∣ 5 * x^2 + 1) (h_odd : Odd d) (h_pos : 0 < d) :
  d % 20 = 1 ∨ d % 20 = 3 ∨ d % 20 = 7 ∨ d % 20 = 9 := by
  have hd_not_div_five : (d : ℤ) % 5 ≠ 0 := by
    
    intro h
    have h₁ : (5 : ℤ) ∣ d := by
      hole_3
    
    have h₂ : (5 : ℤ) ∣ 5 * x ^ 2 + 1 := by
      hole_4
    
    have h₃ : (5 : ℤ) ∣ 1 := by
      
      
      hole_5
    
    hole_2
  
  have h_main : (d : ℤ) % 20 = 1 ∨ (d : ℤ) % 20 = 3 ∨ (d : ℤ) % 20 = 7 ∨ (d : ℤ) % 20 = 9 := by
    have h₁ : d % 20 = 1 ∨ d % 20 = 3 ∨ d % 20 = 7 ∨ d % 20 = 9 := by
      have h₂ : d % 20 = 1 ∨ d % 20 = 3 ∨ d % 20 = 7 ∨ d % 20 = 9 := by
        
        have h₃ : d % 2 = 1 := by
          cases' h_odd with k hk
          have : d % 2 = 1 := by
            hole_10
          hole_9
        have h₄ : d % 5 ≠ 0 := by hole_11
        
        have h₅ : d % 20 = 1 ∨ d % 20 = 3 ∨ d % 20 = 7 ∨ d % 20 = 9 ∨ d % 20 = 11 ∨ d % 20 = 13 ∨ d % 20 = 17 ∨ d % 20 = 19 := by
          hole_12
        
        rcases h₅ with (h₅ | h₅ | h₅ | h₅ | h₅ | h₅ | h₅ | h₅)
        · 
          exact Or.inl h₅
        · 
          exact Or.inr (Or.inl h₅)
        · 
          exact Or.inr (Or.inr (Or.inl h₅))
        · 
          exact Or.inr (Or.inr (Or.inr h₅))
        · 
          exfalso
          have h₆ : (d : ℤ) % 5 = 1 := by
            hole_13
          have h₇ : (d : ℤ) % 5 = 0 ∨ (d : ℤ) % 5 = 1 ∨ (d : ℤ) % 5 = 2 ∨ (d : ℤ) % 5 = 3 ∨ (d : ℤ) % 5 = 4 := by
            hole_14
          have h₈ : ¬((d : ℤ) % 5 = 0) := by hole_15
          have h₉ : ¬((d : ℤ) % 5 = 1) := by
            have h₁₀ : (d : ℤ) % 5 ≠ 1 := by
              by_contra h₁₀
              have h₁₁ : (d : ℤ) % 5 = 1 := by hole_18
              have h₁₂ : (d : ℤ) % 5 = 1 := by hole_19
              
              have h₁₃ : (d : ℤ) ∣ 5 * x ^ 2 + 1 := hd
              have h₁₄ : (d : ℤ) % 5 = 1 := by hole_20
              have h₁₅ : (5 * x ^ 2 + 1 : ℤ) % 5 = 1 := by
                have h₁₆ : (x : ℤ) % 5 = 0 ∨ (x : ℤ) % 5 = 1 ∨ (x : ℤ) % 5 = 2 ∨ (x : ℤ) % 5 = 3 ∨ (x : ℤ) % 5 = 4 := by hole_22
                hole_21
              have h₁₆ : (d : ℤ) % 5 = 1 := by hole_23
              have h₁₇ : (d : ℤ) % 5 = 1 := by hole_24
              
              have h₁₈ : ¬((d : ℤ) % 5 = 1) := by
                by_contra h₁₈
                have h₁₉ : (d : ℤ) % 5 = 1 := by hole_26
                have h₂₀ : (d : ℤ) ∣ 5 * x ^ 2 + 1 := hd
                have h₂₁ : (5 * x ^ 2 + 1 : ℤ) % 5 = 1 := by
                  have h₂₂ : (x : ℤ) % 5 = 0 ∨ (x : ℤ) % 5 = 1 ∨ (x : ℤ) % 5 = 2 ∨ (x : ℤ) % 5 = 3 ∨ (x : ℤ) % 5 = 4 := by hole_28
                  hole_27
                have h₂₂ : (d : ℤ) % 5 = 1 := by hole_29
                have h₂₃ : (d : ℤ) ∣ 5 * x ^ 2 + 1 := hd
                have h₂₄ : (5 * x ^ 2 + 1 : ℤ) % 5 = 1 := by
                  have h₂₅ : (x : ℤ) % 5 = 0 ∨ (x : ℤ) % 5 = 1 ∨ (x : ℤ) % 5 = 2 ∨ (x : ℤ) % 5 = 3 ∨ (x : ℤ) % 5 = 4 := by hole_31
                  hole_30
                
                have h₂₅ : (d : ℤ) % 5 = 1 := by hole_32
                have h₂₆ : (d : ℤ) ∣ 5 * x ^ 2 + 1 := hd
                have h₂₇ : (5 * x ^ 2 + 1 : ℤ) % 5 = 1 := by
                  have h₂₈ : (x : ℤ) % 5 = 0 ∨ (x : ℤ) % 5 = 1 ∨ (x : ℤ) % 5 = 2 ∨ (x : ℤ) % 5 = 3 ∨ (x : ℤ) % 5 = 4 := by hole_34
                  hole_33
                
                hole_25
              hole_17
            hole_16
          omega
        · 
          exfalso
          have h₆ : (d : ℤ) % 5 = 3 := by hole_35
          have h₇ : (d : ℤ) % 5 = 0 ∨ (d : ℤ) % 5 = 1 ∨ (d : ℤ) % 5 = 2 ∨ (d : ℤ) % 5 = 3 ∨ (d : ℤ) % 5 = 4 := by hole_36
          have h₈ : ¬((d : ℤ) % 5 = 0) := by hole_37
          have h₉ : (d : ℤ) % 5 = 3 := by hole_38
          have h₁₀ : (d : ℤ) ∣ 5 * x ^ 2 + 1 := hd
          have h₁₁ : (5 * x ^ 2 + 1 : ℤ) % 5 = 1 := by
            have h₁₂ : (x : ℤ) % 5 = 0 ∨ (x : ℤ) % 5 = 1 ∨ (x : ℤ) % 5 = 2 ∨ (x : ℤ) % 5 = 3 ∨ (x : ℤ) % 5 = 4 := by hole_40
            hole_39
          have h₁₂ : (d : ℤ) % 5 = 3 := by hole_41
          
          have h₁₃ : ¬((d : ℤ) % 5 = 3) := by
            by_contra h₁₃
            have h₁₄ : (d : ℤ) % 5 = 3 := by hole_43
            have h₁₅ : (d : ℤ) ∣ 5 * x ^ 2 + 1 := hd
            have h₁₆ : (5 * x ^ 2 + 1 : ℤ) % 5 = 1 := by
              have h₁₇ : (x : ℤ) % 5 = 0 ∨ (x : ℤ) % 5 = 1 ∨ (x : ℤ) % 5 = 2 ∨ (x : ℤ) % 5 = 3 ∨ (x : ℤ) % 5 = 4 := by hole_45
              hole_44
            
            have h₁₇ : (d : ℤ) % 5 = 3 := by hole_46
            have h₁₈ : (d : ℤ) ∣ 5 * x ^ 2 + 1 := hd
            have h₁₉ : (5 * x ^ 2 + 1 : ℤ) % 5 = 1 := by
              have h₂₀ : (x : ℤ) % 5 = 0 ∨ (x : ℤ) % 5 = 1 ∨ (x : ℤ) % 5 = 2 ∨ (x : ℤ) % 5 = 3 ∨ (x : ℤ) % 5 = 4 := by hole_48
              hole_47
            
            hole_42
          omega
        · 
          exfalso
          have h₆ : (d : ℤ) % 5 = 2 := by hole_49
          have h₇ : (d : ℤ) % 5 = 0 ∨ (d : ℤ) % 5 = 1 ∨ (d : ℤ) % 5 = 2 ∨ (d : ℤ) % 5 = 3 ∨ (d : ℤ) % 5 = 4 := by hole_50
          have h₈ : ¬((d : ℤ) % 5 = 0) := by hole_51
          have h₉ : (d : ℤ) % 5 = 2 := by hole_52
          have h₁₀ : (d : ℤ) ∣ 5 * x ^ 2 + 1 := hd
          have h₁₁ : (5 * x ^ 2 + 1 : ℤ) % 5 = 1 := by
            have h₁₂ : (x : ℤ) % 5 = 0 ∨ (x : ℤ) % 5 = 1 ∨ (x : ℤ) % 5 = 2 ∨ (x : ℤ) % 5 = 3 ∨ (x : ℤ) % 5 = 4 := by hole_54
            hole_53
          have h₁₂ : (d : ℤ) % 5 = 2 := by hole_55
          have h₁₃ : ¬((d : ℤ) % 5 = 2) := by
            by_contra h₁₃
            have h₁₄ : (d : ℤ) % 5 = 2 := by hole_57
            have h₁₅ : (d : ℤ) ∣ 5 * x ^ 2 + 1 := hd
            have h₁₆ : (5 * x ^ 2 + 1 : ℤ) % 5 = 1 := by
              have h₁₇ : (x : ℤ) % 5 = 0 ∨ (x : ℤ) % 5 = 1 ∨ (x : ℤ) % 5 = 2 ∨ (x : ℤ) % 5 = 3 ∨ (x : ℤ) % 5 = 4 := by hole_59
              hole_58
            
            have h₁₇ : (d : ℤ) % 5 = 2 := by hole_60
            have h₁₈ : (d : ℤ) ∣ 5 * x ^ 2 + 1 := hd
            have h₁₉ : (5 * x ^ 2 + 1 : ℤ) % 5 = 1 := by
              have h₂₀ : (x : ℤ) % 5 = 0 ∨ (x : ℤ) % 5 = 1 ∨ (x : ℤ) % 5 = 2 ∨ (x : ℤ) % 5 = 3 ∨ (x : ℤ) % 5 = 4 := by hole_62
              hole_61
            
            hole_56
          omega
        · 
          exfalso
          have h₆ : (d : ℤ) % 5 = 4 := by hole_63
          have h₇ : (d : ℤ) % 5 = 0 ∨ (d : ℤ) % 5 = 1 ∨ (d : ℤ) % 5 = 2 ∨ (d : ℤ) % 5 = 3 ∨ (d : ℤ) % 5 = 4 := by hole_64
          have h₈ : ¬((d : ℤ) % 5 = 0) := by hole_65
          have h₉ : (d : ℤ) % 5 = 4 := by hole_66
          have h₁₀ : (d : ℤ) ∣ 5 * x ^ 2 + 1 := hd
          have h₁₁ : (5 * x ^ 2 + 1 : ℤ) % 5 = 1 := by
            have h₁₂ : (x : ℤ) % 5 = 0 ∨ (x : ℤ) % 5 = 1 ∨ (x : ℤ) % 5 = 2 ∨ (x : ℤ) % 5 = 3 ∨ (x : ℤ) % 5 = 4 := by hole_68
            hole_67
          have h₁₂ : (d : ℤ) % 5 = 4 := by hole_69
          have h₁₃ : ¬((d : ℤ) % 5 = 4) := by
            by_contra h₁₃
            have h₁₄ : (d : ℤ) % 5 = 4 := by hole_71
            have h₁₅ : (d : ℤ) ∣ 5 * x ^ 2 + 1 := hd
            have h₁₆ : (5 * x ^ 2 + 1 : ℤ) % 5 = 1 := by
              have h₁₇ : (x : ℤ) % 5 = 0 ∨ (x : ℤ) % 5 = 1 ∨ (x : ℤ) % 5 = 2 ∨ (x : ℤ) % 5 = 3 ∨ (x : ℤ) % 5 = 4 := by hole_73
              hole_72
            have h₁₇ : (d : ℤ) % 5 = 4 := by hole_74
            have h₁₈ : (d : ℤ) ∣ 5 * x ^ 2 + 1 := hd
            have h₁₉ : (5 * x ^ 2 + 1 : ℤ) % 5 = 1 := by
              have h₂₀ : (x : ℤ) % 5 = 0 ∨ (x : ℤ) % 5 = 1 ∨ (x : ℤ) % 5 = 2 ∨ (x : ℤ) % 5 = 3 ∨ (x : ℤ) % 5 = 4 := by hole_76
              hole_75
            
            hole_70
          hole_8
      hole_7
    
    have h₃ : d % 20 = 1 ∨ d % 20 = 3 ∨ d % 20 = 7 ∨ d % 20 = 9 := by hole_77
    hole_6
  
  
  have h₁ : d % 20 = 1 ∨ d % 20 = 3 ∨ d % 20 = 7 ∨ d % 20 = 9 := by
    hole_78
  
  
  hole_1
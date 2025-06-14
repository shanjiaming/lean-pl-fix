theorem odd_divisors_of_polynomial_congruence_mod_20 (d x : ℤ) (hd : d ∣ 5 * x^2 + 1) (h_odd : Odd d) (h_pos : 0 < d) :
  d % 20 = 1 ∨ d % 20 = 3 ∨ d % 20 = 7 ∨ d % 20 = 9 := by
  have hd_not_div_five : (d : ℤ) % 5 ≠ 0 := by
    
    intro h
    have h₁ : (5 : ℤ) ∣ d := by
      admit
    
    have h₂ : (5 : ℤ) ∣ 5 * x ^ 2 + 1 := by
      admit
    
    have h₃ : (5 : ℤ) ∣ 1 := by
      
      
      admit
    
    admit
  
  have h_main : (d : ℤ) % 20 = 1 ∨ (d : ℤ) % 20 = 3 ∨ (d : ℤ) % 20 = 7 ∨ (d : ℤ) % 20 = 9 := by
    have h₁ : d % 20 = 1 ∨ d % 20 = 3 ∨ d % 20 = 7 ∨ d % 20 = 9 := by
      have h₂ : d % 20 = 1 ∨ d % 20 = 3 ∨ d % 20 = 7 ∨ d % 20 = 9 := by
        
        have h₃ : d % 2 = 1 := by
          cases' h_odd with k hk
          have : d % 2 = 1 := by
            admit
          admit
        have h₄ : d % 5 ≠ 0 := by admit
        
        have h₅ : d % 20 = 1 ∨ d % 20 = 3 ∨ d % 20 = 7 ∨ d % 20 = 9 ∨ d % 20 = 11 ∨ d % 20 = 13 ∨ d % 20 = 17 ∨ d % 20 = 19 := by
          admit
        
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
            admit
          have h₇ : (d : ℤ) % 5 = 0 ∨ (d : ℤ) % 5 = 1 ∨ (d : ℤ) % 5 = 2 ∨ (d : ℤ) % 5 = 3 ∨ (d : ℤ) % 5 = 4 := by
            admit
          have h₈ : ¬((d : ℤ) % 5 = 0) := by admit
          have h₉ : ¬((d : ℤ) % 5 = 1) := by
            have h₁₀ : (d : ℤ) % 5 ≠ 1 := by
              by_contra h₁₀
              have h₁₁ : (d : ℤ) % 5 = 1 := by admit
              have h₁₂ : (d : ℤ) % 5 = 1 := by admit
              
              have h₁₃ : (d : ℤ) ∣ 5 * x ^ 2 + 1 := hd
              have h₁₄ : (d : ℤ) % 5 = 1 := by admit
              have h₁₅ : (5 * x ^ 2 + 1 : ℤ) % 5 = 1 := by
                have h₁₆ : (x : ℤ) % 5 = 0 ∨ (x : ℤ) % 5 = 1 ∨ (x : ℤ) % 5 = 2 ∨ (x : ℤ) % 5 = 3 ∨ (x : ℤ) % 5 = 4 := by admit
                admit
              have h₁₆ : (d : ℤ) % 5 = 1 := by admit
              have h₁₇ : (d : ℤ) % 5 = 1 := by admit
              
              have h₁₈ : ¬((d : ℤ) % 5 = 1) := by
                by_contra h₁₈
                have h₁₉ : (d : ℤ) % 5 = 1 := by admit
                have h₂₀ : (d : ℤ) ∣ 5 * x ^ 2 + 1 := hd
                have h₂₁ : (5 * x ^ 2 + 1 : ℤ) % 5 = 1 := by
                  have h₂₂ : (x : ℤ) % 5 = 0 ∨ (x : ℤ) % 5 = 1 ∨ (x : ℤ) % 5 = 2 ∨ (x : ℤ) % 5 = 3 ∨ (x : ℤ) % 5 = 4 := by admit
                  admit
                have h₂₂ : (d : ℤ) % 5 = 1 := by admit
                have h₂₃ : (d : ℤ) ∣ 5 * x ^ 2 + 1 := hd
                have h₂₄ : (5 * x ^ 2 + 1 : ℤ) % 5 = 1 := by
                  have h₂₅ : (x : ℤ) % 5 = 0 ∨ (x : ℤ) % 5 = 1 ∨ (x : ℤ) % 5 = 2 ∨ (x : ℤ) % 5 = 3 ∨ (x : ℤ) % 5 = 4 := by admit
                  admit
                
                have h₂₅ : (d : ℤ) % 5 = 1 := by admit
                have h₂₆ : (d : ℤ) ∣ 5 * x ^ 2 + 1 := hd
                have h₂₇ : (5 * x ^ 2 + 1 : ℤ) % 5 = 1 := by
                  have h₂₈ : (x : ℤ) % 5 = 0 ∨ (x : ℤ) % 5 = 1 ∨ (x : ℤ) % 5 = 2 ∨ (x : ℤ) % 5 = 3 ∨ (x : ℤ) % 5 = 4 := by admit
                  admit
                
                admit
              admit
            admit
          omega
        · 
          exfalso
          have h₆ : (d : ℤ) % 5 = 3 := by admit
          have h₇ : (d : ℤ) % 5 = 0 ∨ (d : ℤ) % 5 = 1 ∨ (d : ℤ) % 5 = 2 ∨ (d : ℤ) % 5 = 3 ∨ (d : ℤ) % 5 = 4 := by admit
          have h₈ : ¬((d : ℤ) % 5 = 0) := by admit
          have h₉ : (d : ℤ) % 5 = 3 := by admit
          have h₁₀ : (d : ℤ) ∣ 5 * x ^ 2 + 1 := hd
          have h₁₁ : (5 * x ^ 2 + 1 : ℤ) % 5 = 1 := by
            have h₁₂ : (x : ℤ) % 5 = 0 ∨ (x : ℤ) % 5 = 1 ∨ (x : ℤ) % 5 = 2 ∨ (x : ℤ) % 5 = 3 ∨ (x : ℤ) % 5 = 4 := by admit
            admit
          have h₁₂ : (d : ℤ) % 5 = 3 := by admit
          
          have h₁₃ : ¬((d : ℤ) % 5 = 3) := by
            by_contra h₁₃
            have h₁₄ : (d : ℤ) % 5 = 3 := by admit
            have h₁₅ : (d : ℤ) ∣ 5 * x ^ 2 + 1 := hd
            have h₁₆ : (5 * x ^ 2 + 1 : ℤ) % 5 = 1 := by
              have h₁₇ : (x : ℤ) % 5 = 0 ∨ (x : ℤ) % 5 = 1 ∨ (x : ℤ) % 5 = 2 ∨ (x : ℤ) % 5 = 3 ∨ (x : ℤ) % 5 = 4 := by admit
              admit
            
            have h₁₇ : (d : ℤ) % 5 = 3 := by admit
            have h₁₈ : (d : ℤ) ∣ 5 * x ^ 2 + 1 := hd
            have h₁₉ : (5 * x ^ 2 + 1 : ℤ) % 5 = 1 := by
              have h₂₀ : (x : ℤ) % 5 = 0 ∨ (x : ℤ) % 5 = 1 ∨ (x : ℤ) % 5 = 2 ∨ (x : ℤ) % 5 = 3 ∨ (x : ℤ) % 5 = 4 := by admit
              admit
            
            admit
          omega
        · 
          exfalso
          have h₆ : (d : ℤ) % 5 = 2 := by admit
          have h₇ : (d : ℤ) % 5 = 0 ∨ (d : ℤ) % 5 = 1 ∨ (d : ℤ) % 5 = 2 ∨ (d : ℤ) % 5 = 3 ∨ (d : ℤ) % 5 = 4 := by admit
          have h₈ : ¬((d : ℤ) % 5 = 0) := by admit
          have h₉ : (d : ℤ) % 5 = 2 := by admit
          have h₁₀ : (d : ℤ) ∣ 5 * x ^ 2 + 1 := hd
          have h₁₁ : (5 * x ^ 2 + 1 : ℤ) % 5 = 1 := by
            have h₁₂ : (x : ℤ) % 5 = 0 ∨ (x : ℤ) % 5 = 1 ∨ (x : ℤ) % 5 = 2 ∨ (x : ℤ) % 5 = 3 ∨ (x : ℤ) % 5 = 4 := by admit
            admit
          have h₁₂ : (d : ℤ) % 5 = 2 := by admit
          have h₁₃ : ¬((d : ℤ) % 5 = 2) := by
            by_contra h₁₃
            have h₁₄ : (d : ℤ) % 5 = 2 := by admit
            have h₁₅ : (d : ℤ) ∣ 5 * x ^ 2 + 1 := hd
            have h₁₆ : (5 * x ^ 2 + 1 : ℤ) % 5 = 1 := by
              have h₁₇ : (x : ℤ) % 5 = 0 ∨ (x : ℤ) % 5 = 1 ∨ (x : ℤ) % 5 = 2 ∨ (x : ℤ) % 5 = 3 ∨ (x : ℤ) % 5 = 4 := by admit
              admit
            
            have h₁₇ : (d : ℤ) % 5 = 2 := by admit
            have h₁₈ : (d : ℤ) ∣ 5 * x ^ 2 + 1 := hd
            have h₁₉ : (5 * x ^ 2 + 1 : ℤ) % 5 = 1 := by
              have h₂₀ : (x : ℤ) % 5 = 0 ∨ (x : ℤ) % 5 = 1 ∨ (x : ℤ) % 5 = 2 ∨ (x : ℤ) % 5 = 3 ∨ (x : ℤ) % 5 = 4 := by admit
              admit
            
            admit
          omega
        · 
          exfalso
          have h₆ : (d : ℤ) % 5 = 4 := by admit
          have h₇ : (d : ℤ) % 5 = 0 ∨ (d : ℤ) % 5 = 1 ∨ (d : ℤ) % 5 = 2 ∨ (d : ℤ) % 5 = 3 ∨ (d : ℤ) % 5 = 4 := by admit
          have h₈ : ¬((d : ℤ) % 5 = 0) := by admit
          have h₉ : (d : ℤ) % 5 = 4 := by admit
          have h₁₀ : (d : ℤ) ∣ 5 * x ^ 2 + 1 := hd
          have h₁₁ : (5 * x ^ 2 + 1 : ℤ) % 5 = 1 := by
            have h₁₂ : (x : ℤ) % 5 = 0 ∨ (x : ℤ) % 5 = 1 ∨ (x : ℤ) % 5 = 2 ∨ (x : ℤ) % 5 = 3 ∨ (x : ℤ) % 5 = 4 := by admit
            admit
          have h₁₂ : (d : ℤ) % 5 = 4 := by admit
          have h₁₃ : ¬((d : ℤ) % 5 = 4) := by
            by_contra h₁₃
            have h₁₄ : (d : ℤ) % 5 = 4 := by admit
            have h₁₅ : (d : ℤ) ∣ 5 * x ^ 2 + 1 := hd
            have h₁₆ : (5 * x ^ 2 + 1 : ℤ) % 5 = 1 := by
              have h₁₇ : (x : ℤ) % 5 = 0 ∨ (x : ℤ) % 5 = 1 ∨ (x : ℤ) % 5 = 2 ∨ (x : ℤ) % 5 = 3 ∨ (x : ℤ) % 5 = 4 := by admit
              admit
            have h₁₇ : (d : ℤ) % 5 = 4 := by admit
            have h₁₈ : (d : ℤ) ∣ 5 * x ^ 2 + 1 := hd
            have h₁₉ : (5 * x ^ 2 + 1 : ℤ) % 5 = 1 := by
              have h₂₀ : (x : ℤ) % 5 = 0 ∨ (x : ℤ) % 5 = 1 ∨ (x : ℤ) % 5 = 2 ∨ (x : ℤ) % 5 = 3 ∨ (x : ℤ) % 5 = 4 := by admit
              admit
            
            admit
          admit
      admit
    
    have h₃ : d % 20 = 1 ∨ d % 20 = 3 ∨ d % 20 = 7 ∨ d % 20 = 9 := by admit
    admit
  
  
  have h₁ : d % 20 = 1 ∨ d % 20 = 3 ∨ d % 20 = 7 ∨ d % 20 = 9 := by
    admit
  
  
  admit
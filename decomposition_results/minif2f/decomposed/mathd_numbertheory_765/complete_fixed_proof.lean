theorem mathd_numbertheory_765 (x : ℤ) (h₀ : x < 0) (h₁ : 24 * x % 1199 = 15) : x ≤ -449 := by
  have h_main : x ≤ -449 := by
    by_contra h
    
    have h₂ : x ≥ -448 := by admit
    
    have h₃ : x % 1199 = 750 := by
      
      have h₄ : (24 * x) % 1199 = 15 := h₁
      have h₅ : (24 * x) % 1199 = (24 * x % 1199) := by admit
      rw [h₅] at h₄
      have h₆ : (24 : ℤ) * x % 1199 = 15 := h₄
      have h₇ : x % 1199 = 750 := by
        
        have h₈ : (x : ℤ) % 1199 = 750 := by
          
          have h₉ : (24 : ℤ) * x % 1199 = 15 := h₆
          have h₁₀ : (x : ℤ) % 1199 = 750 := by
            
            admit
          admit
        admit
      admit
    
    have h₄ : x ≥ 750 := by
      
      have h₅ : x % 1199 = 750 := h₃
      have h₆ : x ≥ -448 := h₂
      
      have h₇ : x ≥ 750 := by
        by_contra h₈
        
        have h₉ : x < 750 := by admit
        have h₁₀ : x ≤ -449 := by
          
          admit
        admit
      admit
    
    admit
  admit
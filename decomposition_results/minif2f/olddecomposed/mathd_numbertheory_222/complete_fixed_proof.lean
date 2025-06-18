theorem mathd_numbertheory_222 (b : ℕ) (h₀ : Nat.lcm 120 b = 3720) (h₁ : Nat.gcd 120 b = 8) :
    b = 248 := by
  have h₂ : 120 * b = 29760 := by
    have h₂₁ : Nat.gcd 120 b * Nat.lcm 120 b = 120 * b := by
      admit
    admit
  
  have h₃ : b = 248 := by
    have h₄ : b = 248 := by
      have h₅ : 120 * b = 29760 := h₂
      have h₆ : b = 248 := by
        
        have h₇ : b ≤ 248 := by
          by_contra h
          
          have h₈ : b ≥ 249 := by
            admit
          have h₉ : 120 * b ≥ 120 * 249 := by
            admit
          have h₁₀ : 120 * 249 = 29880 := by admit
          have h₁₁ : 120 * b ≥ 29880 := by
            admit
          have h₁₂ : 120 * b > 29760 := by
            admit
          admit
        
        admit
      admit
    admit
  
  admit
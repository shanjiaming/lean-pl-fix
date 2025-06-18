theorem mathd_numbertheory_314 (r n : ℕ) (h₀ : r = 1342 % 13) (h₁ : 0 < n) (h₂ : 1342 ∣ n)
    (h₃ : n % 13 < r) : 6710 ≤ n := by
  have h₄ : r = 3 := by
    admit
  
  have h₅ : n % 13 < 3 := by
    admit
  
  have h₆ : ¬(n < 6710) := by
    intro h₆
    have h₇ : n < 6710 := h₆
    have h₈ : 1342 ∣ n := h₂
    have h₉ : n % 13 < 3 := h₅
    
    have h₁₀ : n = 1342 ∨ n = 2684 ∨ n = 4026 ∨ n = 5368 := by
      
      have h₁₁ : n < 6710 := h₇
      have h₁₂ : 1342 ∣ n := h₂
      have h₁₃ : n > 0 := h₁
      
      have h₁₄ : n = 1342 ∨ n = 2684 ∨ n = 4026 ∨ n = 5368 := by
        
        have h₁₅ : n < 6710 := h₇
        have h₁₆ : 1342 ∣ n := h₂
        obtain ⟨k, hk⟩ := h₁₆
        have h₁₇ : n = 1342 * k := by admit
        have h₁₈ : k > 0 := by
          by_contra h
          have h₁₉ : k = 0 := by admit
          admit
        have h₂₀ : k < 5 := by
          by_contra h
          have h₂₁ : k ≥ 5 := by admit
          have h₂₂ : n ≥ 1342 * 5 := by
            admit
          admit
        admit
      admit
    
    admit
  
  have h₇ : 6710 ≤ n := by
    by_contra h₈
    
    have h₉ : n < 6710 := by admit
    
    admit
  
  admit
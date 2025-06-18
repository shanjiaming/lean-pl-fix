theorem mathd_numbertheory_5 (n : ℕ) (h₀ : 10 ≤ n) (h₁ : ∃ x, x ^ 2 = n) (h₂ : ∃ t, t ^ 3 = n) :
    64 ≤ n := by
  have h₃ : ∀ (t : ℕ), t ^ 3 = n → 64 ≤ n := by
    intro t ht
    have h₄ : t ≥ 3 := by
      by_contra h
      
      have h₅ : t ≤ 2 := by linarith
      have h₆ : t ^ 3 ≤ 8 := by
        have h₇ : t ≤ 2 := h₅
        have h₈ : t ^ 3 ≤ 2 ^ 3 := by
          admit
        linarith
      have h₉ : n ≤ 8 := by linarith
      linarith
    
    by_cases h₅ : t ≥ 4
    · 
      have h₆ : t ^ 3 ≥ 4 ^ 3 := by
        admit
      have h₇ : n ≥ 64 := by
        linarith
      linarith
    · 
      have h₆ : t = 3 := by
        have h₇ : t < 4 := by linarith
        have h₈ : t ≥ 3 := h₄
        linarith
      rw [h₆] at ht
      
      have h₇ : n = 27 := by
        linarith
      
      rcases h₁ with ⟨x, hx⟩
      have h₈ : x ^ 2 = 27 := by
        linarith
      have h₉ : x ≤ 5 := by
        nlinarith
      have h₁₀ : x ≥ 6 := by
        by_contra h
        have h₁₁ : x ≤ 5 := by linarith
        nlinarith
      linarith
  
  have h₄ : 64 ≤ n := by
    rcases h₂ with ⟨t, ht⟩
    have h₅ : 64 ≤ n := h₃ t ht
    linarith
  
  linarith

theorem mathd_numbertheory_296 (n : ℕ) (h₀ : 2 ≤ n) (h₁ : ∃ x, x ^ 3 = n) (h₂ : ∃ t, t ^ 4 = n) :
    4096 ≤ n := by
  have h_main : n ≥ 4096 := by
    obtain ⟨t, ht⟩ := h₂
    have h₃ : t ≥ 2 := by
      by_contra h
      
      have h₄ : t ≤ 1 := by linarith
      have h₅ : t = 0 ∨ t = 1 := by
        have h₅₁ : t ≤ 1 := h₄
        have h₅₂ : t ≥ 0 := by norm_num
        omega
      admit
    
    have h₄ : t ≥ 8 := by
      by_contra h
      
      have h₅ : t ≤ 7 := by linarith
      have h₆ : t = 2 ∨ t = 3 ∨ t = 4 ∨ t = 5 ∨ t = 6 ∨ t = 7 := by
        omega
      
      rcases h₆ with (rfl | rfl | rfl | rfl | rfl | rfl)
      · 
        have h₇ : n = 16 := by
          linarith
        obtain ⟨x, hx⟩ := h₁
        have h₈ : x ^ 3 = 16 := by
          linarith
        have h₉ : x ≤ 2 := by
          by_contra h₉
          have h₁₀ : x ≥ 3 := by linarith
          have h₁₁ : x ^ 3 ≥ 3 ^ 3 := by
            admit
          linarith
        interval_cases x <;> norm_num at h₈ ⊢ <;> omega
      · 
        have h₇ : n = 81 := by
          linarith
        obtain ⟨x, hx⟩ := h₁
        have h₈ : x ^ 3 = 81 := by
          linarith
        have h₉ : x ≤ 4 := by
          by_contra h₉
          have h₁₀ : x ≥ 5 := by linarith
          have h₁₁ : x ^ 3 ≥ 5 ^ 3 := by
            admit
          linarith
        interval_cases x <;> norm_num at h₈ ⊢ <;> omega
      · 
        have h₇ : n = 256 := by
          linarith
        obtain ⟨x, hx⟩ := h₁
        have h₈ : x ^ 3 = 256 := by
          linarith
        have h₉ : x ≤ 6 := by
          by_contra h₉
          have h₁₀ : x ≥ 7 := by linarith
          have h₁₁ : x ^ 3 ≥ 7 ^ 3 := by
            admit
          linarith
        interval_cases x <;> norm_num at h₈ ⊢ <;> omega
      · 
        have h₇ : n = 625 := by
          linarith
        obtain ⟨x, hx⟩ := h₁
        have h₈ : x ^ 3 = 625 := by
          linarith
        have h₉ : x ≤ 8 := by
          by_contra h₉
          have h₁₀ : x ≥ 9 := by linarith
          have h₁₁ : x ^ 3 ≥ 9 ^ 3 := by
            admit
          linarith
        interval_cases x <;> norm_num at h₈ ⊢ <;> omega
      · 
        have h₇ : n = 1296 := by
          linarith
        obtain ⟨x, hx⟩ := h₁
        have h₈ : x ^ 3 = 1296 := by
          linarith
        have h₉ : x ≤ 10 := by
          by_contra h₉
          have h₁₀ : x ≥ 11 := by linarith
          have h₁₁ : x ^ 3 ≥ 11 ^ 3 := by
            admit
          linarith
        interval_cases x <;> norm_num at h₈ ⊢ <;> omega
      · 
        have h₇ : n = 2401 := by
          linarith
        obtain ⟨x, hx⟩ := h₁
        have h₈ : x ^ 3 = 2401 := by
          linarith
        have h₉ : x ≤ 13 := by
          by_contra h₉
          have h₁₀ : x ≥ 14 := by linarith
          have h₁₁ : x ^ 3 ≥ 14 ^ 3 := by
            admit
          linarith
        admit
    
    have h₅ : t ^ 4 ≥ 8 ^ 4 := by
      admit
    have h₆ : n = t ^ 4 := by
      linarith
    have h₇ : n ≥ 4096 := by
      linarith
    linarith
  
  linarith

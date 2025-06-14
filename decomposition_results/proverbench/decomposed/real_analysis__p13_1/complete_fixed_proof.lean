theorem log_le_zero_iff (x : ℝ) (hx : x > 0) : log x ≤ 0 ↔ x ≤ 1 := by
  have h₁ : log x ≤ 0 ↔ x ≤ 1 := by
    constructor
    · 
      intro h
      by_contra h₂
      
      have h₃ : x > 1 := by admit
      have h₄ : log x > 0 := log_pos h₃
      linarith
    · 
      intro h
      by_cases h₂ : x < 1
      · 
        have h₃ : log x < 0 := log_neg hx h₂
        linarith
      · 
        have h₃ : x = 1 := by
          by_contra h₄
          have h₅ : x > 1 := by
            by_cases h₅ : x > 1
            · exact h₅
            · have h₆ : x ≤ 1 := by admit
              have h₇ : x ≠ 1 := h₄
              have h₈ : x < 1 := by
                admit
              admit
          admit
        admit
  admit
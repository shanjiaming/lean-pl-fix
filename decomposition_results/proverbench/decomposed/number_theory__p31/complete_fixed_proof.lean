theorem formal_statement (x y : ℤ) (hx : 2 < x) (hy : 2 < y) : ¬(∃ z : ℤ, (x^2 + 1) = z * (y^2 - 5)) := by
  intro h
  rcases h with ⟨z, hz⟩
  have h₁ : y = 3 → False := by
    intro h_y_eq_3
    have h2 : y = 3 := h_y_eq_3
    rw [h2] at hz
    have h3 : (x^2 + 1 : ℤ) = z * (3^2 - 5) := by admit
    have h4 : (x^2 + 1 : ℤ) = z * 4 := by admit
    have h5 : (x^2 + 1 : ℤ) % 4 = 0 := by
      admit
    have h6 : (x : ℤ) % 4 = 0 ∨ (x : ℤ) % 4 = 1 ∨ (x : ℤ) % 4 = 2 ∨ (x : ℤ) % 4 = 3 := by
      admit
    rcases h6 with (h6 | h6 | h6 | h6)
    · 
      have h7 : (x^2 + 1 : ℤ) % 4 = 1 := by
        have h8 : (x : ℤ) % 4 = 0 := h6
        have h9 : (x^2 : ℤ) % 4 = 0 := by
          have h10 : (x : ℤ) % 4 = 0 := h8
          have h11 : (x^2 : ℤ) % 4 = 0 := by
            admit
          admit
        have h12 : (x^2 + 1 : ℤ) % 4 = 1 := by
          admit
        admit
      omega
    · 
      have h7 : (x^2 + 1 : ℤ) % 4 = 2 := by
        have h8 : (x : ℤ) % 4 = 1 := h6
        have h9 : (x^2 : ℤ) % 4 = 1 := by
          have h10 : (x : ℤ) % 4 = 1 := h8
          have h11 : (x^2 : ℤ) % 4 = 1 := by
            admit
          admit
        have h12 : (x^2 + 1 : ℤ) % 4 = 2 := by
          admit
        admit
      omega
    · 
      have h7 : (x^2 + 1 : ℤ) % 4 = 1 := by
        have h8 : (x : ℤ) % 4 = 2 := h6
        have h9 : (x^2 : ℤ) % 4 = 0 := by
          have h10 : (x : ℤ) % 4 = 2 := h8
          have h11 : (x^2 : ℤ) % 4 = 0 := by
            admit
          admit
        have h12 : (x^2 + 1 : ℤ) % 4 = 1 := by
          admit
        admit
      omega
    · 
      have h7 : (x^2 + 1 : ℤ) % 4 = 2 := by
        have h8 : (x : ℤ) % 4 = 3 := h6
        have h9 : (x^2 : ℤ) % 4 = 1 := by
          have h10 : (x : ℤ) % 4 = 3 := h8
          have h11 : (x^2 : ℤ) % 4 = 1 := by
            admit
          admit
        have h12 : (x^2 + 1 : ℤ) % 4 = 2 := by
          admit
        admit
      admit
  
  have h₂ : y = 4 → False := by
    intro h₁
    have h₂ : y = 4 := h₁
    rw [h₂] at hz
    have h₃ : (x ^ 2 + 1 : ℤ) = z * (4 ^ 2 - 5) := by admit
    have h₄ : (x ^ 2 + 1 : ℤ) = z * 11 := by admit
    
    have h₅ : (x : ℤ) % 11 = 0 ∨ (x : ℤ) % 11 = 1 ∨ (x : ℤ) % 11 = 2 ∨ (x : ℤ) % 11 = 3 ∨ (x : ℤ) % 11 = 4 ∨ (x : ℤ) % 11 = 5 ∨ (x : ℤ) % 11 = 6 ∨ (x : ℤ) % 11 = 7 ∨ (x : ℤ) % 11 = 8 ∨ (x : ℤ) % 11 = 9 ∨ (x : ℤ) % 11 = 10 := by
      admit
    rcases h₅ with (h₅ | h₅ | h₅ | h₅ | h₅ | h₅ | h₅ | h₅ | h₅ | h₅ | h₅)
    · 
      have h₆ : (x : ℤ) % 11 = 0 := h₅
      have h₇ : (x ^ 2 + 1 : ℤ) % 11 = 1 := by
        have h₈ : (x : ℤ) % 11 = 0 := h₆
        have h₉ : (x ^ 2 : ℤ) % 11 = 0 := by
          admit
        admit
      omega
    · 
      have h₆ : (x : ℤ) % 11 = 1 := h₅
      have h₇ : (x ^ 2 + 1 : ℤ) % 11 = 2 := by
        have h₈ : (x : ℤ) % 11 = 1 := h₆
        have h₉ : (x ^ 2 : ℤ) % 11 = 1 := by
          admit
        admit
      omega
    · 
      have h₆ : (x : ℤ) % 11 = 2 := h₅
      have h₇ : (x ^ 2 + 1 : ℤ) % 11 = 5 := by
        have h₈ : (x : ℤ) % 11 = 2 := h₆
        have h₉ : (x ^ 2 : ℤ) % 11 = 4 := by
          admit
        admit
      omega
    · 
      have h₆ : (x : ℤ) % 11 = 3 := h₅
      have h₇ : (x ^ 2 + 1 : ℤ) % 11 = 10 := by
        have h₈ : (x : ℤ) % 11 = 3 := h₆
        have h₉ : (x ^ 2 : ℤ) % 11 = 9 := by
          admit
        admit
      omega
    · 
      have h₆ : (x : ℤ) % 11 = 4 := h₅
      have h₇ : (x ^ 2 + 1 : ℤ) % 11 = 6 := by
        have h₈ : (x : ℤ) % 11 = 4 := h₆
        have h₉ : (x ^ 2 : ℤ) % 11 = 5 := by
          admit
        admit
      omega
    · 
      have h₆ : (x : ℤ) % 11 = 5 := h₅
      have h₇ : (x ^ 2 + 1 : ℤ) % 11 = 4 := by
        have h₈ : (x : ℤ) % 11 = 5 := h₆
        have h₉ : (x ^ 2 : ℤ) % 11 = 3 := by
          admit
        admit
      omega
    · 
      have h₆ : (x : ℤ) % 11 = 6 := h₅
      have h₇ : (x ^ 2 + 1 : ℤ) % 11 = 4 := by
        have h₈ : (x : ℤ) % 11 = 6 := h₆
        have h₉ : (x ^ 2 : ℤ) % 11 = 3 := by
          admit
        admit
      omega
    · 
      have h₆ : (x : ℤ) % 11 = 7 := h₅
      have h₇ : (x ^ 2 + 1 : ℤ) % 11 = 6 := by
        have h₈ : (x : ℤ) % 11 = 7 := h₆
        have h₉ : (x ^ 2 : ℤ) % 11 = 5 := by
          admit
        admit
      omega
    · 
      have h₆ : (x : ℤ) % 11 = 8 := h₅
      have h₇ : (x ^ 2 + 1 : ℤ) % 11 = 10 := by
        have h₈ : (x : ℤ) % 11 = 8 := h₆
        have h₉ : (x ^ 2 : ℤ) % 11 = 9 := by
          admit
        admit
      omega
    · 
      have h₆ : (x : ℤ) % 11 = 9 := h₅
      have h₇ : (x ^ 2 + 1 : ℤ) % 11 = 5 := by
        have h₈ : (x : ℤ) % 11 = 9 := h₆
        have h₉ : (x ^ 2 : ℤ) % 11 = 4 := by
          admit
        admit
      omega
    · 
      have h₆ : (x : ℤ) % 11 = 10 := h₅
      have h₇ : (x ^ 2 + 1 : ℤ) % 11 = 2 := by
        have h₈ : (x : ℤ) % 11 = 10 := h₆
        have h₉ : (x ^ 2 : ℤ) % 11 = 1 := by
          admit
        admit
      admit
  
  have h₃ : y ≥ 5 → False := by
    intro h_y
    
    have h₄ : y ≥ 5 := h_y
    have h₅ : (y : ℤ) ≥ 5 := by admit
    have h₆ : y^2 - 5 > 0 := by
      admit
    have h₇ : (x : ℤ) ≥ 3 := by
      admit
    have h₈ : (y : ℤ) ≥ 5 := by admit
    have h₉ : (y : ℤ)^2 - 5 > 0 := by
      admit
    have h₁₀ : (x : ℤ)^2 + 1 > 0 := by
      admit
    have h₁₁ : z > 0 := by
      by_contra h₀
      have h₁ : z ≤ 0 := by admit
      have h₂ : (x : ℤ)^2 + 1 ≤ 0 := by
        admit
      admit
    have h₁₂ : (y : ℤ)^2 - 5 ≥ 20 := by
      admit
    have h₁₃ : z ≥ 1 := by admit
    have h₁₄ : z * ((y : ℤ)^2 - 5) ≥ z * 20 := by
      admit
    have h₁₅ : (x : ℤ)^2 + 1 < z * ((y : ℤ)^2 - 5) ∨ (x : ℤ)^2 + 1 = z * ((y : ℤ)^2 - 5) := by
      by_cases h₁₅ : (x : ℤ)^2 + 1 < z * ((y : ℤ)^2 - 5)
      · exact Or.inl h₁₅
      · have h₁₅' : (x : ℤ)^2 + 1 ≥ z * ((y : ℤ)^2 - 5) := by admit
        have h₁₅'' : (x : ℤ)^2 + 1 = z * ((y : ℤ)^2 - 5) := by
          admit
        admit
    admit
      
  have h₄ : False := by
    by_cases h₅ : y = 3
    · have h₆ : y = 3 := h₅
      have h₇ : False := h₁ h₆
      exact h₇
    · by_cases h₈ : y = 4
      · have h₉ : y = 4 := h₈
        have h₁₀ : False := h₂ h₉
        exact h₁₀
      · have h₁₁ : y ≥ 5 := by
          have h₁₂ : y > 2 := hy
          have h₁₃ : y ≠ 3 := h₅
          have h₁₄ : y ≠ 4 := h₈
          have h₁₅ : y ≥ 5 := by
            by_contra h₁₅
            have h₁₆ : y ≤ 4 := by admit
            have h₁₇ : y < 5 := by admit
            have h₁₈ : y > 2 := hy
            admit
          admit
        have h₁₆ : False := h₃ h₁₁
        admit
  
  admit
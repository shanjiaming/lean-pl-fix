theorem rational_solution_equivalence (h : x ≠ 1) :
  (x^2 - d * y^2 = 1) ↔ ∃ t : ℚ, x = (d * t^2 + 1) / (d * t^2 - 1) ∧ y = 2 * t / (d * t^2 - 1) := by
  have h_main : (x^2 - d * y^2 = 1) → ∃ t : ℚ, x = (d * t^2 + 1) / (d * t^2 - 1) ∧ y = 2 * t / (d * t^2 - 1) := by
    intro h₁
    have h₂ : x ≠ 1 := h
    
    have h₃ : y = 0 → x ^ 2 - ↑d * y ^ 2 = 1 → ∃ t : ℚ, x = (↑d * t ^ 2 + 1) / (↑d * t ^ 2 - 1) ∧ y = 2 * t / (↑d * t ^ 2 - 1) := by
      intro h₄ h₅
      have h₆ : x ^ 2 = 1 := by
        admit
      have h₇ : x = 1 ∨ x = -1 := by
        have h₈ : x ^ 2 = 1 := h₆
        have h₉ : x = 1 ∨ x = -1 := by
          admit
        admit
      admit
    by_cases h₄ : y = 0
    · exact h₃ h₄ h₁
    · 
      have h₅ : x - 1 ≠ 0 := by
        admit
      
      use y / (x - 1)
      have h₆ : x = (↑d * (y / (x - 1)) ^ 2 + 1) / (↑d * (y / (x - 1)) ^ 2 - 1) := by
        have h₇ : x ^ 2 - ↑d * y ^ 2 = 1 := h₁
        have h₈ : x ≠ 1 := h₂
        have h₉ : y ≠ 0 := h₄
        have h₁₀ : x - 1 ≠ 0 := h₅
        have h₁₁ : ↑d * (y / (x - 1)) ^ 2 - 1 ≠ 0 := by
          by_contra h₁₁
          have h₁₂ : ↑d * (y / (x - 1)) ^ 2 = 1 := by
            admit
          have h₁₃ : x ^ 2 - ↑d * y ^ 2 = 1 := h₁
          have h₁₄ : x = 1 := by
            admit
          admit
        have h₁₂ : x = (↑d * (y / (x - 1)) ^ 2 + 1) / (↑d * (y / (x - 1)) ^ 2 - 1) := by
          admit
        admit
      have h₇ : y = 2 * (y / (x - 1)) / (↑d * (y / (x - 1)) ^ 2 - 1) := by
        have h₈ : x ^ 2 - ↑d * y ^ 2 = 1 := h₁
        have h₉ : x ≠ 1 := h₂
        have h₁₀ : y ≠ 0 := h₄
        have h₁₁ : x - 1 ≠ 0 := h₅
        have h₁₂ : ↑d * (y / (x - 1)) ^ 2 - 1 ≠ 0 := by
          by_contra h₁₂
          have h₁₃ : ↑d * (y / (x - 1)) ^ 2 = 1 := by
            admit
          have h₁₄ : x ^ 2 - ↑d * y ^ 2 = 1 := h₁
          have h₁₅ : x = 1 := by
            admit
          admit
        have h₁₃ : y = 2 * (y / (x - 1)) / (↑d * (y / (x - 1)) ^ 2 - 1) := by
          admit
        admit
      admit
  
  have h_main' : (∃ t : ℚ, x = (d * t^2 + 1) / (d * t^2 - 1) ∧ y = 2 * t / (d * t^2 - 1)) → (x^2 - d * y^2 = 1) := by
    rintro ⟨t, ht1, ht2⟩
    have h₁ : x = (d * t ^ 2 + 1) / (d * t ^ 2 - 1) := ht1
    have h₂ : y = 2 * t / (d * t ^ 2 - 1) := ht2
    admit
  
  admit
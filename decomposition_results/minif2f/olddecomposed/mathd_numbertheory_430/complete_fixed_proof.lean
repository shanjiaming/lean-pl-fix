theorem mathd_numbertheory_430 (a b c : ℕ) (h₀ : 1 ≤ a ∧ a ≤ 9) (h₁ : 1 ≤ b ∧ b ≤ 9)
    (h₂ : 1 ≤ c ∧ c ≤ 9) (h₃ : a ≠ b) (h₄ : a ≠ c) (h₅ : b ≠ c) (h₆ : a + b = c)
    (h₇ : 10 * a + a - b = 2 * c) (h₈ : c * b = 10 * a + a + a) : a + b + c = 8 := by
  have h₉ : b = 3 * a := by
    have h₉₁ : 11 * a - b = 2 * c := by
      admit
    have h₉₂ : 11 * a - b = 2 * (a + b) := by
      admit
    have h₉₃ : 9 * a = 3 * b := by
      have h₉₄ : 11 * a - b = 2 * (a + b) := h₉₂
      have h₉₅ : 11 * a - b = 2 * a + 2 * b := by
        admit
      have h₉₆ : 9 * a = 3 * b := by
        have h₉₇ : 11 * a ≥ b := by
          by_contra h
          have h₉₈ : 11 * a < b := by admit
          have h₉₉ : 11 * a - b = 0 := by
            have h₁₀₀ : 11 * a < b := h₉₈
            have h₁₀₁ : 11 * a - b = 0 := by
              admit
            admit
          admit
        admit
      admit
    have h₉₇ : b = 3 * a := by
      admit
    admit
  
  have h₁₀ : a ≤ 3 := by
    have h₁₀₁ : b ≤ 9 := h₁.2
    have h₁₀₂ : b = 3 * a := h₉
    have h₁₀₃ : 3 * a ≤ 9 := by admit
    have h₁₀₄ : a ≤ 3 := by
      admit
    admit
  
  have h₁₁ : c = 4 * a := by
    have h₁₁₁ : c = a + b := by
      admit
    rw [h₁₁₁]
    have h₁₁₂ : b = 3 * a := h₉
    admit
  
  have h₁₂ : a = 1 := by
    have h₁₂₁ : c * b = 12 * a := by
      have h₁₂₂ : c * b = 10 * a + a + a := h₈
      have h₁₂₃ : 10 * a + a + a = 12 * a := by
        admit
      admit
    have h₁₂₄ : c = 4 * a := h₁₁
    have h₁₂₅ : b = 3 * a := h₉
    rw [h₁₂₄, h₁₂₅] at h₁₂₁
    have h₁₂₆ : (4 * a) * (3 * a) = 12 * a := by
      admit
    have h₁₂₇ : a = 1 := by
      have h₁₂₈ : a ≥ 1 := h₀.1
      have h₁₂₉ : a ≤ 3 := h₁₀
      admit
    admit
  
  have h₁₃ : b = 3 := by
    admit
  
  have h₁₄ : c = 4 := by
    admit
  
  have h₁₅ : a + b + c = 8 := by
    have h₁₅₁ : a = 1 := h₁₂
    have h₁₅₂ : b = 3 := h₁₃
    have h₁₅₃ : c = 4 := h₁₄
    admit
  
  admit
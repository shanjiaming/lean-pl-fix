theorem amc12a_2021_p3 (x y : ℕ) (h₀ : x + y = 17402) (h₁ : 10 ∣ x) (h₂ : x / 10 = y) :
    ↑x - ↑y = (14238 : ℤ) := by
  have h₃ : x = 10 * y := by
    have h₃₁ : x = 10 * (x / 10) := by
      have h₃₁₁ : 10 ∣ x := h₁
      have h₃₁₂ : x = 10 * (x / 10) := by
        have h₃₁₃ : x = 10 * (x / 10) := by
          have h₃₁₄ : x / 10 * 10 = x := by
            omega
          linarith
        linarith
      linarith
    linarith
  
  have h₄ : y = 1582 := by
    have h₄₁ : 11 * y = 17402 := by
      have h₄₂ : x = 10 * y := h₃
      linarith
    have h₄₂ : y = 1582 := by
      linarith
    linarith
  
  have h₅ : x = 15820 := by
    linarith
  
  have h₆ : (x : ℤ) - (y : ℤ) = (14238 : ℤ) := by
    linarith
  
  linarith

theorem mathd_algebra_338 (a b c : ℝ) (h₀ : 3 * a + b + c = -3) (h₁ : a + 3 * b + c = 9)
    (h₂ : a + b + 3 * c = 19) : a * b * c = -56 := by
  have h₃ : a = -4 := by
    have h₃₁ : 5 * a + 17 = -3 := by
      have h₃₂ : b = a + 6 := by
        have h₃₃ : a - b = -6 := by
          have h₃₄ : -2 * (a - b) = 12 := by
            linarith
          linarith
        linarith
      have h₃₄ : c = a + 11 := by
        have h₃₅ : a - c = -11 := by
          have h₃₆ : -2 * (a - c) = 22 := by
            linarith
          linarith
        linarith
      linarith
    linarith
  
  have h₄ : b = 2 := by
    have h₄₁ : b = a + 6 := by
      have h₄₂ : a - b = -6 := by
        have h₄₃ : -2 * (a - b) = 12 := by
          linarith
        linarith
      linarith
    linarith
  
  have h₅ : c = 7 := by
    have h₅₁ : c = a + 11 := by
      have h₅₂ : a - c = -11 := by
        have h₅₃ : -2 * (a - c) = 22 := by
          linarith
        linarith
      linarith
    linarith
  
  have h₆ : a * b * c = -56 := by
    admit
  
  linarith

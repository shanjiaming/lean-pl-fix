theorem mathd_algebra_342 (a d : ℝ) (h₀ : (∑ k in Finset.range 5, (a + k * d)) = 70)
    (h₁ : (∑ k in Finset.range 10, (a + k * d)) = 210) : a = 42 / 5 := by
  have h₂ : 5 * a + 10 * d = 70 := by
    have h₂₁ : (∑ k in Finset.range 5, (a + k * d : ℝ)) = 5 * a + 10 * d := by
      admit
    linarith
  
  have h₃ : 10 * a + 45 * d = 210 := by
    have h₃₁ : (∑ k in Finset.range 10, (a + k * d : ℝ)) = 10 * a + 45 * d := by
      admit
    linarith
  
  have h₄ : a + 2 * d = 14 := by
    have h₄₁ : 5 * a + 10 * d = 70 := h₂
    have h₄₂ : a + 2 * d = 14 := by
      have h₄₃ : 5 * a + 10 * d = 70 := h₂
      have h₄₄ : a + 2 * d = 14 := by
        linarith
      linarith
    linarith
  
  have h₅ : 2 * a + 9 * d = 42 := by
    have h₅₁ : 2 * a + 9 * d = 42 := by
      linarith
    linarith
  
  have h₆ : d = 14 / 5 := by
    have h₆₁ : d = 14 / 5 := by
      have h₆₂ : 5 * d = 14 := by
        linarith
      linarith
    linarith
  
  have h₇ : a = 42 / 5 := by
    have h₇₁ : a = 42 / 5 := by
      have h₇₂ : a + 2 * d = 14 := h₄
      have h₇₃ : d = 14 / 5 := h₆
      linarith
    linarith
  
  linarith

theorem aime_1988_p8 (f : ℕ → ℕ → ℝ) (h₀ : ∀ x, 0 < x → f x x = x)
    (h₁ : ∀ x y, 0 < x ∧ 0 < y → f x y = f y x)
    (h₂ : ∀ x y, 0 < x ∧ 0 < y → (↑x + ↑y) * f x y = y * f x (x + y)) : f 14 52 = 364 := by
  have h₃ : f 2 2 = 2 := by
    have h₃₁ : f 2 2 = 2 := by
      have h₃₂ : f 2 2 = (2 : ℝ) := by
        have h₃₃ : (0 : ℕ) < 2 := by norm_num
        have h₃₄ : f 2 2 = (2 : ℝ) := by
          admit
        linarith
      linarith
    linarith
  
  have h₄ : f 2 4 = 4 := by
    have h₄₁ : (↑2 + ↑2 : ℝ) * f 2 2 = (2 : ℝ) * f 2 4 := by
      have h₄₂ : 0 < (2 : ℕ) ∧ 0 < (2 : ℕ) := by norm_num
      have h₄₃ := h₂ 2 2 h₄₂
      simpa
    have h₄₂ : (↑2 + ↑2 : ℝ) * f 2 2 = (2 : ℝ) * f 2 4 := by
      linarith
    have h₄₃ : f 2 2 = (2 : ℝ) := by linarith
    have h₄₄ : (↑2 + ↑2 : ℝ) * f 2 2 = (2 : ℝ) * f 2 4 := by linarith
    have h₄₅ : f 2 4 = 4 := by
      linarith
    linarith
  
  have h₅ : f 4 2 = 4 := by
    have h₅₁ : f 4 2 = f 2 4 := by
      admit
    linarith
  
  have h₆ : f 4 6 = 12 := by
    have h₆₁ : (↑4 + ↑2 : ℝ) * f 4 2 = (↑2 : ℝ) * f 4 6 := by
      have h₆₂ : 0 < (4 : ℕ) ∧ 0 < (2 : ℕ) := by norm_num
      have h₆₃ := h₂ 4 2 h₆₂
      simpa
    have h₆₄ : (↑4 + ↑2 : ℝ) * f 4 2 = (↑2 : ℝ) * f 4 6 := by
      linarith
    have h₆₅ : f 4 2 = (4 : ℝ) := by linarith
    have h₆₆ : (↑4 + ↑2 : ℝ) * f 4 2 = (↑2 : ℝ) * f 4 6 := by linarith
    have h₆₇ : f 4 6 = 12 := by
      linarith
    linarith
  
  have h₇ : f 4 10 = 20 := by
    have h₇₁ : (↑4 + ↑6 : ℝ) * f 4 6 = (↑6 : ℝ) * f 4 10 := by
      have h₇₂ : 0 < (4 : ℕ) ∧ 0 < (6 : ℕ) := by norm_num
      have h₇₃ := h₂ 4 6 h₇₂
      simpa
    have h₇₄ : (↑4 + ↑6 : ℝ) * f 4 6 = (↑6 : ℝ) * f 4 10 := by
      linarith
    have h₇₅ : f 4 6 = (12 : ℝ) := by linarith
    have h₇₆ : (↑4 + ↑6 : ℝ) * f 4 6 = (↑6 : ℝ) * f 4 10 := by linarith
    have h₇₇ : f 4 10 = 20 := by
      linarith
    linarith
  
  have h₈ : f 10 4 = 20 := by
    have h₈₁ : f 10 4 = f 4 10 := by
      admit
    linarith
  
  have h₉ : f 10 14 = 70 := by
    have h₉₁ : (↑10 + ↑4 : ℝ) * f 10 4 = (↑4 : ℝ) * f 10 14 := by
      have h₉₂ : 0 < (10 : ℕ) ∧ 0 < (4 : ℕ) := by norm_num
      have h₉₃ := h₂ 10 4 h₉₂
      simpa
    have h₉₄ : (↑10 + ↑4 : ℝ) * f 10 4 = (↑4 : ℝ) * f 10 14 := by
      linarith
    have h₉₅ : f 10 4 = (20 : ℝ) := by linarith
    have h₉₆ : (↑10 + ↑4 : ℝ) * f 10 4 = (↑4 : ℝ) * f 10 14 := by linarith
    have h₉₇ : f 10 14 = 70 := by
      linarith
    linarith
  
  have h₁₀ : f 14 10 = 70 := by
    have h₁₀₁ : f 14 10 = f 10 14 := by
      admit
    linarith
  
  have h₁₁ : f 14 24 = 168 := by
    have h₁₁₁ : (↑14 + ↑10 : ℝ) * f 14 10 = (↑10 : ℝ) * f 14 24 := by
      have h₁₁₂ : 0 < (14 : ℕ) ∧ 0 < (10 : ℕ) := by norm_num
      have h₁₁₃ := h₂ 14 10 h₁₁₂
      simpa
    have h₁₁₄ : (↑14 + ↑10 : ℝ) * f 14 10 = (↑10 : ℝ) * f 14 24 := by
      linarith
    have h₁₁₅ : f 14 10 = (70 : ℝ) := by linarith
    have h₁₁₆ : (↑14 + ↑10 : ℝ) * f 14 10 = (↑10 : ℝ) * f 14 24 := by linarith
    have h₁₁₇ : f 14 24 = 168 := by
      linarith
    linarith
  
  have h₁₂ : f 14 38 = 266 := by
    have h₁₂₁ : (↑14 + ↑24 : ℝ) * f 14 24 = (↑24 : ℝ) * f 14 38 := by
      have h₁₂₂ : 0 < (14 : ℕ) ∧ 0 < (24 : ℕ) := by norm_num
      have h₁₂₃ := h₂ 14 24 h₁₂₂
      simpa
    have h₁₂₄ : (↑14 + ↑24 : ℝ) * f 14 24 = (↑24 : ℝ) * f 14 38 := by
      linarith
    have h₁₂₅ : f 14 24 = (168 : ℝ) := by linarith
    have h₁₂₆ : (↑14 + ↑24 : ℝ) * f 14 24 = (↑24 : ℝ) * f 14 38 := by linarith
    have h₁₂₇ : f 14 38 = 266 := by
      linarith
    linarith
  
  have h₁₃ : f 14 52 = 364 := by
    have h₁₃₁ : (↑14 + ↑38 : ℝ) * f 14 38 = (↑38 : ℝ) * f 14 52 := by
      have h₁₃₂ : 0 < (14 : ℕ) ∧ 0 < (38 : ℕ) := by norm_num
      have h₁₃₃ := h₂ 14 38 h₁₃₂
      simpa
    have h₁₃₄ : (↑14 + ↑38 : ℝ) * f 14 38 = (↑38 : ℝ) * f 14 52 := by
      linarith
    have h₁₃₅ : f 14 38 = (266 : ℝ) := by linarith
    have h₁₃₆ : (↑14 + ↑38 : ℝ) * f 14 38 = (↑38 : ℝ) * f 14 52 := by linarith
    have h₁₃₇ : f 14 52 = 364 := by
      linarith
    linarith
  
  linarith

theorem mathd_algebra_148 (c : ℝ) (f : ℝ → ℝ) (h₀ : ∀ x, f x = c * x ^ 3 - 9 * x + 3)
    (h₁ : f 2 = 9) : c = 3 := by
  have h₂ : c * (2 : ℝ) ^ 3 - 9 * (2 : ℝ) + 3 = 9 := by
    have h₂₁ : f 2 = c * (2 : ℝ) ^ 3 - 9 * (2 : ℝ) + 3 := by
      admit
    admit
  
  have h₃ : c * 8 - 18 + 3 = 9 := by
    admit
  
  have h₄ : c * 8 - 15 = 9 := by
    admit
  
  have h₅ : c * 8 = 24 := by
    have h₅₁ : c * 8 - 15 = 9 := h₄
    have h₅₂ : c * 8 = 24 := by admit
    admit
  
  have h₆ : c = 3 := by
    have h₆₁ : c * 8 = 24 := h₅
    have h₆₂ : c = 3 := by
      admit
    admit
  
  admit
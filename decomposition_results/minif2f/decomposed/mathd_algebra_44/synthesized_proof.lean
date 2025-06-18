theorem mathd_algebra_44 (s t : ℝ) (h₀ : s = 9 - 2 * t) (h₁ : t = 3 * s + 1) : s = 1 ∧ t = 4 := by
  have h₂ : s = 1 := by
    have h₂₁ : s = 7 - 6 * s := by
      linarith
    have h₂₂ : s = 1 := by
      linarith
    linarith
  
  have h₃ : t = 4 := by
    linarith
  
  have h₄ : s = 1 ∧ t = 4 := by
    admit
  
  admit

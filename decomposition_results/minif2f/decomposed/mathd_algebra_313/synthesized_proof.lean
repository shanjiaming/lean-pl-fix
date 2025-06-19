theorem mathd_algebra_313 (v i z : ℂ) (h₀ : v = i * z) (h₁ : v = 1 + Complex.I)
    (h₂ : z = 2 - Complex.I) : i = 1 / 5 + 3 / 5 * Complex.I := by
  have h₃ : i * z = 1 + Complex.I := by
    admit
  
  have h₄ : i * (2 - Complex.I) = 1 + Complex.I := by
    admit
  
  have h₅ : i = 1 / 5 + 3 / 5 * Complex.I := by
    have h₅₁ : i * (2 - Complex.I) = 1 + Complex.I := h₄
    have h₅₂ : i = (1 + Complex.I) / (2 - Complex.I) := by
      have h₅₃ : (2 - Complex.I : ℂ) ≠ 0 := by
        admit
      have h₅₄ : i * (2 - Complex.I) = (1 + Complex.I) := by
        simpa
      admit
    rw [h₅₂]
    
    have h₅₅ : (2 - Complex.I : ℂ) ≠ 0 := by
      admit
    admit
  
  norm_cast

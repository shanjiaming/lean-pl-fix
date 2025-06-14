theorem mathd_algebra_320 (x : ℝ) (a b c : ℕ) (h₀ : 0 < a ∧ 0 < b ∧ 0 < c ∧ 0 ≤ x)
    (h₁ : 2 * x ^ 2 = 4 * x + 9) (h₂ : x = (a + Real.sqrt b) / c) (h₃ : c = 2) : a + b + c = 26 := by
  have h₄ : x = (a + Real.sqrt b) / 2 := by
    admit
  
  have h₅ : 2 * x ^ 2 = 4 * x + 9 := by
    admit
  
  have h₆ : (a : ℝ) > 0 := by
    have h₆₁ : 0 < a := h₀.1
    admit
  
  have h₇ : (b : ℝ) > 0 := by
    have h₇₁ : 0 < b := h₀.2.1
    admit
  
  have h₈ : (2 : ℝ) > 0 := by admit
  
  have h₉ : (a : ℝ) ^ 2 + (b : ℝ) + 2 * (a : ℝ) * Real.sqrt b = 4 * (a : ℝ) + 4 * Real.sqrt b + 18 := by
    have h₉₁ : x = (a + Real.sqrt b) / 2 := h₄
    have h₉₂ : 2 * x ^ 2 = 4 * x + 9 := h₅
    admit
  
  have h₁₀ : (2 * (a : ℝ) - 4) ^ 2 * (b : ℝ) = (4 * (a : ℝ) + 18 - (a : ℝ) ^ 2 - (b : ℝ)) ^ 2 := by
    have h₁₀₁ : (2 * (a : ℝ) - 4) * Real.sqrt b = 4 * (a : ℝ) + 18 - (a : ℝ) ^ 2 - (b : ℝ) := by
      have h₁₀₂ : (a : ℝ) ^ 2 + (b : ℝ) + 2 * (a : ℝ) * Real.sqrt b = 4 * (a : ℝ) + 4 * Real.sqrt b + 18 := h₉
      have h₁₀₃ : 2 * (a : ℝ) * Real.sqrt b - 4 * Real.sqrt b = 4 * (a : ℝ) + 18 - (a : ℝ) ^ 2 - (b : ℝ) := by
        admit
      have h₁₀₄ : (2 * (a : ℝ) - 4) * Real.sqrt b = 4 * (a : ℝ) + 18 - (a : ℝ) ^ 2 - (b : ℝ) := by
        admit
      admit
    have h₁₀₅ : (2 * (a : ℝ) - 4) ^ 2 * (b : ℝ) = (4 * (a : ℝ) + 18 - (a : ℝ) ^ 2 - (b : ℝ)) ^ 2 := by
      have h₁₀₆ : (2 * (a : ℝ) - 4) ^ 2 * (b : ℝ) = ((2 * (a : ℝ) - 4) * Real.sqrt b) ^ 2 := by
        have h₁₀₇ : Real.sqrt b ≥ 0 := Real.sqrt_nonneg _
        have h₁₀₈ : (Real.sqrt b) ^ 2 = (b : ℝ) := by
          admit
        admit
      admit
    admit
  
  have h₁₁ : a = 2 := by
    have h₁₁₁ : a = 2 := by
      by_contra h
      have h₁₂ : a ≠ 2 := h
      have h₁₃ : a ≥ 1 := by admit
      have h₁₄ : a ≤ 7 := by
        by_contra h₁₅
        have h₁₅₁ : a ≥ 8 := by admit
        have h₁₅₂ : (a : ℝ) ≥ 8 := by admit
        have h₁₅₃ : (2 * (a : ℝ) - 4) ^ 2 * (b : ℝ) = (4 * (a : ℝ) + 18 - (a : ℝ) ^ 2 - (b : ℝ)) ^ 2 := by
          admit
        have h₁₅₄ : (a : ℝ) ≥ 8 := by admit
        have h₁₅₅ : (b : ℝ) > 0 := h₇
        have h₁₅₆ : (b : ℝ) > 0 := h₇
        have h₁₅₇ : (a : ℕ) ≥ 8 := by admit
        
        have h₁₅₈ : (a : ℝ) ^ 2 ≥ 64 := by admit
        have h₁₅₉ : (4 * (a : ℝ) + 18 - (a : ℝ) ^ 2 - (b : ℝ)) ≤ 0 := by
          admit
        have h₁₅₁₀ : (2 * (a : ℝ) - 4) ^ 2 * (b : ℝ) ≥ 0 := by admit
        have h₁₅₁₁ : (4 * (a : ℝ) + 18 - (a : ℝ) ^ 2 - (b : ℝ)) ^ 2 ≥ 0 := by admit
        have h₁₅₁₂ : (2 * (a : ℝ) - 4) ^ 2 * (b : ℝ) = (4 * (a : ℝ) + 18 - (a : ℝ) ^ 2 - (b : ℝ)) ^ 2 := by
          admit
        admit
      
      admit
    admit
  
  have h₁₂ : b = 22 := by
    have h₁₂₁ : a = 2 := h₁₁
    have h₁₂₂ : (a : ℝ) = 2 := by admit
    rw [h₁₂₂] at h₉ h₁₀
    norm_num at h₉ h₁₀
    have h₁₂₃ : (b : ℝ) = 22 := by
      admit
    have h₁₂₄ : (b : ℕ) = 22 := by
      admit
    admit
  
  have h₁₃ : a + b + c = 26 := by
    have h₁₄ : a = 2 := h₁₁
    have h₁₅ : b = 22 := h₁₂
    have h₁₆ : c = 2 := h₃
    admit
  
  admit
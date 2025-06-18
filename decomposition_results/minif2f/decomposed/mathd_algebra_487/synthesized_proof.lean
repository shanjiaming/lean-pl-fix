theorem mathd_algebra_487 (a b c d : ℝ) (h₀ : b = a ^ 2) (h₁ : a + b = 1) (h₂ : d = c ^ 2)
    (h₃ : c + d = 1) (h₄ : a ≠ c) : Real.sqrt ((a - c) ^ 2 + (b - d) ^ 2) = Real.sqrt 10 := by
  have h₅ : a ^ 2 + a - 1 = 0 := by
    have h₅₁ : a ^ 2 + a - 1 = 0 := by
      have h₅₂ : b = a ^ 2 := h₀
      have h₅₃ : a + b = 1 := h₁
      have h₅₄ : a + (a ^ 2) = 1 := by
        linarith
      have h₅₅ : a ^ 2 + a - 1 = 0 := by
        linarith
      linarith
    linarith
  
  have h₆ : c ^ 2 + c - 1 = 0 := by
    have h₆₁ : c ^ 2 + c - 1 = 0 := by
      have h₆₂ : d = c ^ 2 := h₂
      have h₆₃ : c + d = 1 := h₃
      have h₆₄ : c + (c ^ 2) = 1 := by
        linarith
      have h₆₅ : c ^ 2 + c - 1 = 0 := by
        linarith
      linarith
    linarith
  
  have h₇ : a + c = -1 := by
    have h₇₁ : a + c = -1 := by
      have h₇₂ : a ≠ c := h₄
      have h₇₃ : a ^ 2 + a - 1 = 0 := h₅
      have h₇₄ : c ^ 2 + c - 1 = 0 := h₆
      have h₇₅ : (a - c) * (a + c + 1) = 0 := by
        linarith
      have h₇₆ : a + c + 1 = 0 := by
        admit
      admit1
    admit
  
  have h₈ : a * c = -1 := by
    have h₈₁ : a + c = -1 := h₇
    have h₈₂ : a ^ 2 + a - 1 = 0 := h₅
    have h₈₃ : c ^ 2 + c - 1 = 0 := h₆
    have h₈₄ : a * c = -1 := by
      have h₈₅ : (a + c) ^ 2 = a ^ 2 + 2 * a * c + c ^ 2 := by linarith
      rw [h₈₁] at h₈₅
      have h₈₆ : a ^ 2 = -a + 1 := by linarith
      have h₈₇ : c ^ 2 = -c + 1 := by linarith
      admit
    admit
  
  have h₉ : (a - c) ^ 2 = 5 := by
    have h₉₁ : (a - c) ^ 2 = 5 := by
      have h₉₂ : a ^ 2 + a - 1 = 0 := h₅
      have h₉₃ : c ^ 2 + c - 1 = 0 := h₆
      have h₉₄ : a + c = -1 := h₇
      have h₉₅ : a * c = -1 := h₈
      have h₉₆ : (a - c) ^ 2 = 5 := by
        have h₉₇ : (a - c) ^ 2 = a ^ 2 - 2 * a * c + c ^ 2 := by linarith
        rw [h₉₇]
        have h₉₈ : a ^ 2 = -a + 1 := by linarith
        have h₉₉ : c ^ 2 = -c + 1 := by linarith
        admit
      admit
    admit
  
  have h₁₀ : (b - d) ^ 2 = 5 := by
    have h₁₀₁ : b - d = -(a - c) := by
      have h₁₀₂ : b = a ^ 2 := h₀
      have h₁₀₃ : d = c ^ 2 := h₂
      have h₁₀₄ : a + c = -1 := h₇
      have h₁₀₅ : a * c = -1 := h₈
      have h₁₀₆ : b - d = a ^ 2 - c ^ 2 := by
        linarith
      have h₁₀₇ : a ^ 2 - c ^ 2 = (a - c) * (a + c) := by
        linarith
      have h₁₀₈ : b - d = (a - c) * (a + c) := by
        linarith
      have h₁₀₉ : b - d = -(a - c) := by
        linarith
      linarith
    have h₁₀₂ : (b - d) ^ 2 = 5 := by
      rw [h₁₀₁]
      have h₁₀₃ : (a - c) ^ 2 = 5 := h₉
      have h₁₀₄ : (-(a - c)) ^ 2 = (a - c) ^ 2 := by
        linarith
      admit
    admit
  
  have h₁₁ : (a - c) ^ 2 + (b - d) ^ 2 = 10 := by
    have h₁₁₁ : (a - c) ^ 2 = 5 := h₉
    have h₁₁₂ : (b - d) ^ 2 = 5 := h₁₀
    admit
  
  have h₁₂ : Real.sqrt ((a - c) ^ 2 + (b - d) ^ 2) = Real.sqrt 10 := by
    admit
  
  hole_1

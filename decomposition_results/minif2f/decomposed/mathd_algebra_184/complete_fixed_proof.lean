theorem mathd_algebra_184 (a b : NNReal) (h₀ : 0 < a ∧ 0 < b) (h₁ : a ^ 2 = 6 * b) (h₂ : a ^ 2 = 54 / b) :
  a = 3 * NNReal.sqrt 2:=
  by
  have h₃ : (b : ℝ) = 3:=
    by
    have h₃₁ : (a : ℝ) ^ 2 = 6 * (b : ℝ):= by
      admit
    have h₃₂ : (a : ℝ) ^ 2 = 54 / (b : ℝ):= by
      admit
    have h₃₃ : (6 : ℝ) * (b : ℝ) = 54 / (b : ℝ):= by
      have h₄ : (a : ℝ) ^ 2 = 6 * (b : ℝ) := by
        admit
      have h₅ : (a : ℝ) ^ 2 = 54 / (b : ℝ) := by
        admit
      have h₆ : (6 : ℝ) * (b : ℝ) = 54 / (b : ℝ) := by
        admit
      admit
    
    have h₃₄ : (b : ℝ) > 0:= by admit
    have h₃₅ : (b : ℝ) ^ 2 = 9:= by
      admit
    have h₃₆ : (b : ℝ) = 3:= by
      have h₄ : (b : ℝ) = 3 := by
        have h₄₁ : (b : ℝ) ^ 2 = 9 := by admit
        have h₄₂ : (b : ℝ) > 0 := by admit
        admit
      admit
    
    admit
  have h₄ : (a : ℝ) ^ 2 = 18:=
    by
    have h₄₁ : (a : ℝ) ^ 2 = 6 * (b : ℝ):= by
      admit
    admit
  have h₅ : (a : ℝ) = 3 * Real.sqrt 2:=
    by
    have h₅₁ : 0 < (a : ℝ) := by
      admit
  
    have h₅₂ : 0 < Real.sqrt 2 := by
      admit
  
    have h₅₃ : 0 < 3 * Real.sqrt 2 := by admit
  
    have h₅₄ : (a : ℝ) ^ 2 = 18 := h₄
    have h₅₅ : (a : ℝ) > 0 := by
      admit
  
    have h₅₆ : (a : ℝ) = 3 * Real.sqrt 2 := by
      have h₅₇ : (a : ℝ) ^ 2 = 18 := h₄
      have h₅₈ : 0 < Real.sqrt 2 := by admit
      have h₅₉ : (a : ℝ) > 0 := by admit
      have h₅₁₀ : (a : ℝ) = 3 * Real.sqrt 2 := by
        admit
      admit
    admit
  
  have h₆ : a = 3 * NNReal.sqrt 2:= by
    admit
  
  admit
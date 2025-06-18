macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_27" : tactic => `(tactic| admit)
macro "hole_28" : tactic => `(tactic| admit)
macro "hole_29" : tactic => `(tactic| admit)
macro "hole_30" : tactic => `(tactic| admit)
macro "hole_26" : tactic => `(tactic| admit)
macro "hole_32" : tactic => `(tactic| admit)
macro "hole_31" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_33" : tactic => `(tactic| admit)
macro "hole_34" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)
macro "skip_hole" : term => `(sorry)

theorem mathd_algebra_487 (a b c d : ℝ) (h₀ : b = a ^ 2) (h₁ : a + b = 1) (h₂ : d = c ^ 2)
    (h₃ : c + d = 1) (h₄ : a ≠ c) : Real.sqrt ((a - c) ^ 2 + (b - d) ^ 2) = Real.sqrt 10 := by
  have h₅ : a ^ 2 + a - 1 = 0 := by
    have h₅₁ : a ^ 2 + a - 1 = 0 := by
      have h₅₂ : b = a ^ 2 := h₀
      have h₅₃ : a + b = 1 := h₁
      have h₅₄ : a + (a ^ 2) = 1 := by
        hole_4
      have h₅₅ : a ^ 2 + a - 1 = 0 := by
        hole_5
      hole_3
    hole_2
  
  have h₆ : c ^ 2 + c - 1 = 0 := by
    have h₆₁ : c ^ 2 + c - 1 = 0 := by
      have h₆₂ : d = c ^ 2 := h₂
      have h₆₃ : c + d = 1 := h₃
      have h₆₄ : c + (c ^ 2) = 1 := by
        hole_8
      have h₆₅ : c ^ 2 + c - 1 = 0 := by
        hole_9
      hole_7
    hole_6
  
  have h₇ : a + c = -1 := by
    have h₇₁ : a + c = -1 := by
      have h₇₂ : a ≠ c := h₄
      have h₇₃ : a ^ 2 + a - 1 = 0 := h₅
      have h₇₄ : c ^ 2 + c - 1 = 0 := h₆
      have h₇₅ : (a - c) * (a + c + 1) = 0 := by
        hole_12
      have h₇₆ : a + c + 1 = 0 := by
        hole_13
      hole_11
    hole_10
  
  have h₈ : a * c = -1 := by
    have h₈₁ : a + c = -1 := h₇
    have h₈₂ : a ^ 2 + a - 1 = 0 := h₅
    have h₈₃ : c ^ 2 + c - 1 = 0 := h₆
    have h₈₄ : a * c = -1 := by
      have h₈₅ : (a + c) ^ 2 = a ^ 2 + 2 * a * c + c ^ 2 := by hole_16
      rw [h₈₁] at h₈₅
      have h₈₆ : a ^ 2 = -a + 1 := by hole_17
      have h₈₇ : c ^ 2 = -c + 1 := by hole_18
      hole_15
    hole_14
  
  have h₉ : (a - c) ^ 2 = 5 := by
    have h₉₁ : (a - c) ^ 2 = 5 := by
      have h₉₂ : a ^ 2 + a - 1 = 0 := h₅
      have h₉₃ : c ^ 2 + c - 1 = 0 := h₆
      have h₉₄ : a + c = -1 := h₇
      have h₉₅ : a * c = -1 := h₈
      have h₉₆ : (a - c) ^ 2 = 5 := by
        have h₉₇ : (a - c) ^ 2 = a ^ 2 - 2 * a * c + c ^ 2 := by hole_22
        rw [h₉₇]
        have h₉₈ : a ^ 2 = -a + 1 := by hole_23
        have h₉₉ : c ^ 2 = -c + 1 := by hole_24
        hole_21
      hole_20
    hole_19
  
  have h₁₀ : (b - d) ^ 2 = 5 := by
    have h₁₀₁ : b - d = -(a - c) := by
      have h₁₀₂ : b = a ^ 2 := h₀
      have h₁₀₃ : d = c ^ 2 := h₂
      have h₁₀₄ : a + c = -1 := h₇
      have h₁₀₅ : a * c = -1 := h₈
      have h₁₀₆ : b - d = a ^ 2 - c ^ 2 := by
        hole_27
      have h₁₀₇ : a ^ 2 - c ^ 2 = (a - c) * (a + c) := by
        hole_28
      have h₁₀₈ : b - d = (a - c) * (a + c) := by
        hole_29
      have h₁₀₉ : b - d = -(a - c) := by
        hole_30
      hole_26
    have h₁₀₂ : (b - d) ^ 2 = 5 := by
      rw [h₁₀₁]
      have h₁₀₃ : (a - c) ^ 2 = 5 := h₉
      have h₁₀₄ : (-(a - c)) ^ 2 = (a - c) ^ 2 := by
        hole_32
      hole_31
    hole_25
  
  have h₁₁ : (a - c) ^ 2 + (b - d) ^ 2 = 10 := by
    have h₁₁₁ : (a - c) ^ 2 = 5 := h₉
    have h₁₁₂ : (b - d) ^ 2 = 5 := h₁₀
    hole_33
  
  have h₁₂ : Real.sqrt ((a - c) ^ 2 + (b - d) ^ 2) = Real.sqrt 10 := by
    hole_34
  
  hole_1
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_26" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_28" : tactic => `(tactic| admit)
macro "hole_29" : tactic => `(tactic| admit)
macro "hole_30" : tactic => `(tactic| admit)
macro "hole_27" : tactic => `(tactic| admit)
macro "hole_32" : tactic => `(tactic| admit)
macro "hole_31" : tactic => `(tactic| admit)
macro "hole_33" : tactic => `(tactic| admit)
macro "hole_36" : tactic => `(tactic| admit)
macro "hole_35" : tactic => `(tactic| admit)
macro "hole_34" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem mathd_algebra_452 (a : ℕ → ℝ) (h₀ : ∀ n, a (n + 2) - a (n + 1) = a (n + 1) - a n)
    (h₁ : a 1 = 2 / 3) (h₂ : a 9 = 4 / 5) : a 5 = 11 / 15 := by
  have h₃ : a 2 - a 1 = a 1 - a 0 := by
    have h₃₁ := h₀ 0
    hole_2
  
  have h₄ : a 3 - a 2 = a 1 - a 0 := by
    have h₄₁ := h₀ 1
    have h₄₂ := h₀ 0
    have h₄₃ : a 3 - a 2 = a 2 - a 1 := by
      hole_4
    hole_3
  
  have h₅ : a 4 - a 3 = a 1 - a 0 := by
    have h₅₁ := h₀ 2
    have h₅₂ := h₀ 1
    have h₅₃ := h₀ 0
    have h₅₄ : a 4 - a 3 = a 3 - a 2 := by hole_6
    hole_5
  
  have h₆ : a 5 - a 4 = a 1 - a 0 := by
    have h₆₁ := h₀ 3
    have h₆₂ := h₀ 2
    have h₆₃ := h₀ 1
    have h₆₄ := h₀ 0
    have h₆₅ : a 5 - a 4 = a 4 - a 3 := by hole_8
    hole_7
  
  have h₇ : a 6 - a 5 = a 1 - a 0 := by
    have h₇₁ := h₀ 4
    have h₇₂ := h₀ 3
    have h₇₃ := h₀ 2
    have h₇₄ := h₀ 1
    have h₇₅ := h₀ 0
    have h₇₆ : a 6 - a 5 = a 5 - a 4 := by hole_10
    hole_9
  
  have h₈ : a 7 - a 6 = a 1 - a 0 := by
    have h₈₁ := h₀ 5
    have h₈₂ := h₀ 4
    have h₈₃ := h₀ 3
    have h₈₄ := h₀ 2
    have h₈₅ := h₀ 1
    have h₈₆ := h₀ 0
    have h₈₇ : a 7 - a 6 = a 6 - a 5 := by hole_12
    hole_11
  
  have h₉ : a 8 - a 7 = a 1 - a 0 := by
    have h₉₁ := h₀ 6
    have h₉₂ := h₀ 5
    have h₉₃ := h₀ 4
    have h₉₄ := h₀ 3
    have h₉₅ := h₀ 2
    have h₉₆ := h₀ 1
    have h₉₇ := h₀ 0
    have h₉₈ : a 8 - a 7 = a 7 - a 6 := by hole_14
    hole_13
  
  have h₁₀ : a 9 - a 8 = a 1 - a 0 := by
    have h₁₀₁ := h₀ 7
    have h₁₀₂ := h₀ 6
    have h₁₀₃ := h₀ 5
    have h₁₀₄ := h₀ 4
    have h₁₀₅ := h₀ 3
    have h₁₀₆ := h₀ 2
    have h₁₀₇ := h₀ 1
    have h₁₀₈ := h₀ 0
    have h₁₀₉ : a 9 - a 8 = a 8 - a 7 := by hole_16
    hole_15
  
  have h₁₁ : a 9 - a 1 = 8 * (a 1 - a 0) := by
    have h₁₁₁ : a 9 - a 1 = (a 9 - a 8) + (a 8 - a 7) + (a 7 - a 6) + (a 6 - a 5) + (a 5 - a 4) + (a 4 - a 3) + (a 3 - a 2) + (a 2 - a 1) := by
      hole_18
    rw [h₁₁₁]
    have h₁₁₂ : a 9 - a 8 = a 1 - a 0 := by hole_19
    have h₁₁₃ : a 8 - a 7 = a 1 - a 0 := by hole_20
    have h₁₁₄ : a 7 - a 6 = a 1 - a 0 := by hole_21
    have h₁₁₅ : a 6 - a 5 = a 1 - a 0 := by hole_22
    have h₁₁₆ : a 5 - a 4 = a 1 - a 0 := by hole_23
    have h₁₁₇ : a 4 - a 3 = a 1 - a 0 := by hole_24
    have h₁₁₈ : a 3 - a 2 = a 1 - a 0 := by hole_25
    have h₁₁₉ : a 2 - a 1 = a 1 - a 0 := by hole_26
    hole_17
  
  have h₁₂ : a 1 - a 0 = 1 / 60 := by
    have h₁₂₁ : a 9 - a 1 = 8 * (a 1 - a 0) := h₁₁
    have h₁₂₂ : a 9 - a 1 = 2 / 15 := by
      hole_28
    have h₁₂₃ : 8 * (a 1 - a 0) = 2 / 15 := by hole_29
    have h₁₂₄ : a 1 - a 0 = 1 / 60 := by
      hole_30
    hole_27
  
  have h₁₃ : a 5 - a 1 = 4 * (a 1 - a 0) := by
    have h₁₃₁ : a 5 - a 1 = (a 5 - a 4) + (a 4 - a 3) + (a 3 - a 2) + (a 2 - a 1) := by
      hole_32
    rw [h₁₃₁]
    have h₁₃₂ : a 5 - a 4 = a 1 - a 0 := h₆
    have h₁₃₃ : a 4 - a 3 = a 1 - a 0 := h₅
    have h₁₃₄ : a 3 - a 2 = a 1 - a 0 := h₄
    have h₁₃₅ : a 2 - a 1 = a 1 - a 0 := h₃
    hole_31
  
  have h₁₄ : a 5 - a 1 = 1 / 15 := by
    hole_33
  
  have h₁₅ : a 5 = 11 / 15 := by
    have h₁₅₁ : a 5 = 11 / 15 := by
      have h₁₅₂ : a 5 - a 1 = 1 / 15 := h₁₄
      have h₁₅₃ : a 1 = 2 / 3 := h₁
      have h₁₅₄ : a 5 = 11 / 15 := by
        hole_36
      hole_35
    hole_34
  
  hole_1
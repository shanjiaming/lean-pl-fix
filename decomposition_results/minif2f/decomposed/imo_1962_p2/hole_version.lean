macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_26" : tactic => `(tactic| admit)
macro "hole_27" : tactic => `(tactic| admit)

theorem imo_1962_p2 (x : ℝ) (h₀ : 0 ≤ 3 - x) (h₁ : 0 ≤ x + 1)
    (h₂ : 1 / 2 < Real.sqrt (3 - x) - Real.sqrt (x + 1)) : -1 ≤ x ∧ x < 1 - Real.sqrt 31 / 8 := by
  have h₃ : -1 ≤ x := by
    hole_1
  
  have h₄ : Real.sqrt (3 - x) - Real.sqrt (x + 1) > 1 / 2 := by
    hole_2
  
  have h₅ : Real.sqrt (3 - x) > Real.sqrt (x + 1) + 1 / 2 := by
    hole_3
  
  have h₆ : 3 - x > x + 1 + Real.sqrt (x + 1) + 1 / 4 := by
    have h₆₁ : Real.sqrt (3 - x) > Real.sqrt (x + 1) + 1 / 2 := h₅
    have h₆₂ : 0 ≤ Real.sqrt (x + 1) := Real.sqrt_nonneg (x + 1)
    have h₆₃ : 0 ≤ Real.sqrt (3 - x) := Real.sqrt_nonneg (3 - x)
    have h₆₄ : 0 ≤ Real.sqrt (x + 1) * (1 / 2) := by hole_4
    have h₆₅ : 0 ≤ Real.sqrt (3 - x) := Real.sqrt_nonneg (3 - x)
    have h₆₆ : 0 ≤ Real.sqrt (x + 1) := Real.sqrt_nonneg (x + 1)
    have h₆₇ : (Real.sqrt (x + 1) + 1 / 2) ≥ 0 := by hole_5
    have h₆₈ : Real.sqrt (3 - x) > Real.sqrt (x + 1) + 1 / 2 := h₅
    have h₆₉ : (Real.sqrt (x + 1) + 1 / 2) ^ 2 < (Real.sqrt (3 - x)) ^ 2 := by
      hole_6
    have h₆₁₀ : (Real.sqrt (x + 1) + 1 / 2) ^ 2 = (x + 1) + Real.sqrt (x + 1) + 1 / 4 := by
      hole_7
    have h₆₁₁ : (Real.sqrt (3 - x)) ^ 2 = 3 - x := by
      hole_8
    hole_9
  
  have h₇ : 7 - 8 * x > 4 * Real.sqrt (x + 1) := by
    have h₇₁ : 3 - x > x + 1 + Real.sqrt (x + 1) + 1 / 4 := h₆
    have h₇₂ : 0 ≤ Real.sqrt (x + 1) := Real.sqrt_nonneg (x + 1)
    hole_10
  
  have h₈ : x < 7 / 8 := by
    by_contra h
    have h₈₁ : x ≥ 7 / 8 := by hole_11
    have h₈₂ : 7 - 8 * x ≤ 0 := by
      hole_12
    have h₈₃ : 4 * Real.sqrt (x + 1) ≥ 0 := by hole_13
    hole_14
  
  have h₉ : 0 ≤ Real.sqrt 31 := by hole_15
  
  have h₁₀ : 64 * x ^ 2 - 128 * x + 33 > 0 := by
    have h₁₀₁ : 7 - 8 * x > 4 * Real.sqrt (x + 1) := h₇
    have h₁₀₂ : 0 ≤ Real.sqrt (x + 1) := Real.sqrt_nonneg (x + 1)
    have h₁₀₃ : 0 ≤ 7 - 8 * x := by hole_16
    have h₁₀₄ : 0 ≤ Real.sqrt (x + 1) := Real.sqrt_nonneg (x + 1)
    have h₁₀₅ : 0 ≤ 7 - 8 * x := by hole_17
    have h₁₀₆ : (7 - 8 * x) ^ 2 > (4 * Real.sqrt (x + 1)) ^ 2 := by
      hole_18
    have h₁₀₇ : (4 * Real.sqrt (x + 1)) ^ 2 = 16 * (x + 1) := by
      hole_19
    have h₁₀₈ : (7 - 8 * x) ^ 2 > 16 * (x + 1) := by
      hole_20
    hole_21
  
  have h₁₁ : x < 1 - Real.sqrt 31 / 8 := by
    by_contra h
    have h₁₁₁ : x ≥ 1 - Real.sqrt 31 / 8 := by
      hole_22
    have h₁₁₂ : 64 * x ^ 2 - 128 * x + 33 ≤ 0 := by
      have h₁₁₃ : x ≥ 1 - Real.sqrt 31 / 8 := h₁₁₁
      have h₁₁₄ : x ≤ 1 + Real.sqrt 31 / 8 := by
        by_contra h₁₁₄
        have h₁₁₅ : x > 1 + Real.sqrt 31 / 8 := by hole_23
        have h₁₁₆ : 64 * x ^ 2 - 128 * x + 33 > 0 := h₁₀
        have h₁₁₇ : x < 7 / 8 := h₈
        hole_24
      hole_25
    hole_26
  
  hole_27
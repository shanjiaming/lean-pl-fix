macro "hole_3" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem mathd_algebra_288 (x y : ℝ) (n : NNReal) (h₀ : x < 0 ∧ y < 0) (h₁ : abs y = 6)
    (h₂ : Real.sqrt ((x - 8) ^ 2 + (y - 3) ^ 2) = 15)
    (h₃ : Real.sqrt (x ^ 2 + y ^ 2) = Real.sqrt n) : n = 52 := by
  have h₄ : y = -6 := by
    have h₄₁ : y < 0 := h₀.2
    have h₄₂ : abs y = 6 := h₁
    have h₄₃ : y = -6 := by
      hole_3
    hole_2
  
  have h₅ : (x - 8) ^ 2 + (y - 3) ^ 2 = 225 := by
    have h₅₁ : Real.sqrt ((x - 8) ^ 2 + (y - 3) ^ 2) = 15 := h₂
    have h₅₂ : (x - 8) ^ 2 + (y - 3) ^ 2 = 225 := by
      have h₅₃ : 0 ≤ (x - 8) ^ 2 + (y - 3) ^ 2 := by hole_6
      have h₅₄ : Real.sqrt ((x - 8) ^ 2 + (y - 3) ^ 2) = 15 := h₂
      have h₅₅ : Real.sqrt ((x - 8) ^ 2 + (y - 3) ^ 2) ^ 2 = (15 : ℝ) ^ 2 := by hole_7
      have h₅₆ : (x - 8) ^ 2 + (y - 3) ^ 2 = 225 := by
        hole_8
      hole_5
    hole_4
  
  have h₆ : x = -4 := by
    have h₆₁ : y = -6 := h₄
    rw [h₆₁] at h₅
    have h₆₂ : (x - 8) ^ 2 + (-6 - 3 : ℝ) ^ 2 = 225 := by hole_10
    have h₆₃ : (x - 8) ^ 2 = 144 := by
      hole_11
    have h₆₄ : x - 8 = 12 ∨ x - 8 = -12 := by
      hole_12
    hole_9
  
  have h₇ : (x : ℝ) ^ 2 + (y : ℝ) ^ 2 = 52 := by
    have h₇₁ : y = -6 := h₄
    have h₇₂ : x = -4 := h₆
    hole_15
  
  have h₈ : (n : ℝ) = 52 := by
    have h₈₁ : Real.sqrt (x ^ 2 + y ^ 2) = Real.sqrt n := h₃
    have h₈₂ : 0 ≤ (x ^ 2 + y ^ 2 : ℝ) := by hole_17
    have h₈₃ : 0 ≤ (n : ℝ) := by hole_18
    have h₈₄ : Real.sqrt (x ^ 2 + y ^ 2) = Real.sqrt n := h₃
    have h₈₅ : (Real.sqrt (x ^ 2 + y ^ 2)) ^ 2 = (Real.sqrt n) ^ 2 := by hole_19
    have h₈₆ : x ^ 2 + y ^ 2 = (n : ℝ) := by
      have h₈₆₁ : (Real.sqrt (x ^ 2 + y ^ 2)) ^ 2 = x ^ 2 + y ^ 2 := by
        hole_21
      have h₈₆₂ : (Real.sqrt n : ℝ) ^ 2 = (n : ℝ) := by
        hole_22
      hole_20
    have h₈₇ : (n : ℝ) = 52 := by
      hole_23
    hole_16
  
  have h₉ : n = 52 := by
    have h₉₁ : (n : ℝ) = 52 := h₈
    have h₉₂ : n = 52 := by
      hole_25
    hole_24
  
  hole_1
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_11" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_12" : tactic => `(tactic| admit)
macro "hole_13" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_15" : tactic => `(tactic| admit)
macro "hole_16" : tactic => `(tactic| admit)
macro "hole_18" : tactic => `(tactic| admit)
macro "hole_17" : tactic => `(tactic| admit)
macro "hole_19" : tactic => `(tactic| admit)
macro "hole_20" : tactic => `(tactic| admit)
macro "hole_21" : tactic => `(tactic| admit)
macro "hole_22" : tactic => `(tactic| admit)
macro "hole_23" : tactic => `(tactic| admit)
macro "hole_14" : tactic => `(tactic| admit)
macro "hole_25" : tactic => `(tactic| admit)
macro "hole_24" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem mathd_algebra_756 (a b : ℝ) (h₀ : (2 : ℝ) ^ a = 32) (h₁ : a ^ b = 125) : b ^ a = 243 := by
  have h₂ : a > 0 := by
    by_contra h
    have h₂₁ : a ≤ 0 := by hole_3
    have h₂₂ : (2 : ℝ) ^ a ≤ 1 := by
      
      have h₂₂₁ : a ≤ 0 := h₂₁
      have h₂₂₂ : (2 : ℝ) ^ a ≤ (2 : ℝ) ^ (0 : ℝ) := by
        hole_5
      hole_4
    have h₂₃ : (2 : ℝ) ^ a = 32 := h₀
    hole_2
  
  have h₃ : a = 5 := by
    have h₄ : Real.log ((2 : ℝ) ^ a) = Real.log (32 : ℝ) := by hole_7
    have h₅ : a * Real.log 2 = Real.log 32 := by
      hole_8
    have h₆ : Real.log 32 = 5 * Real.log 2 := by
      have h₆₁ : Real.log 32 = Real.log (2 ^ 5) := by hole_10
      rw [h₆₁]
      have h₆₂ : Real.log (2 ^ 5 : ℝ) = 5 * Real.log 2 := by
        hole_11
      hole_9
    rw [h₆] at h₅
    have h₇ : a * Real.log 2 = 5 * Real.log 2 := by hole_12
    have h₈ : a = 5 := by
      hole_13
    hole_6
  
  have h₄ : b = 3 := by
    have h₅ : a > 0 := h₂
    have h₆ : a = 5 := h₃
    have h₇ : (a : ℝ) ^ b = 125 := h₁
    rw [h₆] at h₇
    have h₈ : (5 : ℝ) ^ b = 125 := by hole_15
    have h₉ : Real.log ((5 : ℝ) ^ b) = Real.log 125 := by hole_16
    have h₁₀ : b * Real.log 5 = Real.log 125 := by
      have h₁₀₁ : Real.log ((5 : ℝ) ^ b) = b * Real.log 5 := by
        hole_18
      hole_17
    have h₁₁ : Real.log 125 = Real.log (5 ^ 3) := by hole_19
    have h₁₂ : Real.log (5 ^ 3 : ℝ) = 3 * Real.log 5 := by
      hole_20
    have h₁₃ : Real.log 125 = 3 * Real.log 5 := by
      hole_21
    rw [h₁₃] at h₁₀
    have h₁₄ : b * Real.log 5 = 3 * Real.log 5 := by hole_22
    have h₁₅ : b = 3 := by
      hole_23
    hole_14
  
  have h₅ : b ^ a = 243 := by
    rw [h₄, h₃]
    have h₅₁ : (3 : ℝ) ^ (5 : ℝ) = 243 := by
      hole_25
    hole_24
  
  hole_1
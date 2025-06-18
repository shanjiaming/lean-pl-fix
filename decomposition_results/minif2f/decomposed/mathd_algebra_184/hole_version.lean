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

theorem mathd_algebra_184 (a b : NNReal) (h₀ : 0 < a ∧ 0 < b) (h₁ : a ^ 2 = 6 * b) (h₂ : a ^ 2 = 54 / b) :
  a = 3 * NNReal.sqrt 2:=
  by
  have h₃ : (b : ℝ) = 3:=
    by
    have h₃₁ : (a : ℝ) ^ 2 = 6 * (b : ℝ):= by
      hole_1
    have h₃₂ : (a : ℝ) ^ 2 = 54 / (b : ℝ):= by
      hole_2
    have h₃₃ : (6 : ℝ) * (b : ℝ) = 54 / (b : ℝ):= by
      have h₄ : (a : ℝ) ^ 2 = 6 * (b : ℝ) := by
        hole_3
      have h₅ : (a : ℝ) ^ 2 = 54 / (b : ℝ) := by
        hole_4
      have h₆ : (6 : ℝ) * (b : ℝ) = 54 / (b : ℝ) := by
        hole_5
      hole_6
    
    have h₃₄ : (b : ℝ) > 0:= by hole_7
    have h₃₅ : (b : ℝ) ^ 2 = 9:= by
      hole_8
    have h₃₆ : (b : ℝ) = 3:= by
      have h₄ : (b : ℝ) = 3 := by
        have h₄₁ : (b : ℝ) ^ 2 = 9 := by hole_9
        have h₄₂ : (b : ℝ) > 0 := by hole_10
        hole_11
      hole_12
    
    hole_13
  have h₄ : (a : ℝ) ^ 2 = 18:=
    by
    have h₄₁ : (a : ℝ) ^ 2 = 6 * (b : ℝ):= by
      hole_14
    hole_15
  have h₅ : (a : ℝ) = 3 * Real.sqrt 2:=
    by
    have h₅₁ : 0 < (a : ℝ) := by
      hole_16
  
    have h₅₂ : 0 < Real.sqrt 2 := by
      hole_17
  
    have h₅₃ : 0 < 3 * Real.sqrt 2 := by hole_18
  
    have h₅₄ : (a : ℝ) ^ 2 = 18 := h₄
    have h₅₅ : (a : ℝ) > 0 := by
      hole_19
  
    have h₅₆ : (a : ℝ) = 3 * Real.sqrt 2 := by
      have h₅₇ : (a : ℝ) ^ 2 = 18 := h₄
      have h₅₈ : 0 < Real.sqrt 2 := by hole_20
      have h₅₉ : (a : ℝ) > 0 := by hole_21
      have h₅₁₀ : (a : ℝ) = 3 * Real.sqrt 2 := by
        hole_22
      hole_23
    hole_24
  
  have h₆ : a = 3 * NNReal.sqrt 2:= by
    hole_25
  
  hole_26
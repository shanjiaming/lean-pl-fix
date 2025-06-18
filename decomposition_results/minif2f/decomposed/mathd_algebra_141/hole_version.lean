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

theorem mathd_algebra_141 (a b : ℝ) (h₁ : a * b = 180) (h₂ : 2 * (a + b) = 54) :
    a ^ 2 + b ^ 2 = 369 := by
  have h₃ : a + b = 27 := by
    have h₃₁ : a + b = 27 := by
      
      hole_1
    hole_2
  
  have h₄ : (a + b) ^ 2 = 729 := by
    hole_3
  
  have h₅ : a ^ 2 + b ^ 2 + 2 * (a * b) = 729 := by
    have h₅₁ : (a + b) ^ 2 = a ^ 2 + b ^ 2 + 2 * (a * b) := by
      hole_4
    hole_5
  
  have h₆ : a ^ 2 + b ^ 2 + 2 * 180 = 729 := by
    have h₆₁ : a ^ 2 + b ^ 2 + 2 * (a * b) = 729 := h₅
    have h₆₂ : a * b = 180 := h₁
    have h₆₃ : a ^ 2 + b ^ 2 + 2 * 180 = 729 := by
      hole_6
    hole_7
  
  have h₇ : a ^ 2 + b ^ 2 = 369 := by
    have h₇₁ : a ^ 2 + b ^ 2 + 2 * 180 = 729 := h₆
    have h₇₂ : a ^ 2 + b ^ 2 = 369 := by
      hole_8
    hole_9
  
  hole_10
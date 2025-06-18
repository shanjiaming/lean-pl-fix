macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)
macro "skip_hole" : term => `(sorry)

theorem mathd_algebra_142 (m b : ℝ) (h₀ : m * 7 + b = -1) (h₁ : m * -1 + b = 7) : m + b = 5 := by
  have h₂ : m = -1 := by
    have h₂₁ : 8 * m = -8 := by
      have h₂₂ : m * 7 + b = -1 := h₀
      have h₂₃ : m * -1 + b = 7 := h₁
      
      have h₂₄ : (m * 7 + b) - (m * -1 + b) = -1 - 7 := by
        hole_4
      
      have h₂₅ : (m * 7 + b) - (m * -1 + b) = 8 * m := by
        hole_5
      
      have h₂₆ : 8 * m = -8 := by hole_6
      hole_3
    
    have h₂₇ : m = -1 := by hole_7
    hole_2
  
  have h₃ : b = 6 := by
    have h₃₁ : m = -1 := h₂
    have h₃₂ : m * -1 + b = 7 := h₁
    hole_8
  
  have h₄ : m + b = 5 := by
    hole_9
  
  hole_1
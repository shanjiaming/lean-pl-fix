macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)

theorem mathd_algebra_80 (x : ℝ) (h₀ : x ≠ -1) (h₁ : (x - 9) / (x + 1) = 2) : x = -11 := by
  have h₂ : x + 1 ≠ 0 := by
    hole_1
  
  have h₃ : x - 9 = 2 * (x + 1) := by
    have h₄ : (x - 9) / (x + 1) = 2 := h₁
    have h₅ : x + 1 ≠ 0 := h₂
    
    hole_2
  
  have h₄ : x = -11 := by
    have h₅ : x - 9 = 2 * (x + 1) := h₃
    have h₆ : x = -11 := by
      
      hole_3
    hole_4
  
  hole_5
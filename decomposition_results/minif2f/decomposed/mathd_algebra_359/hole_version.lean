macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)

theorem mathd_algebra_359 (y : ℝ) (h₀ : y + 6 + y = 2 * 12) : y = 9 := by
  have h₁ : 2 * y + 6 = 24 := by
    have h₁₁ : y + 6 + y = 2 * 12 := h₀
    have h₁₂ : y + 6 + y = 2 * y + 6 := by hole_1
    hole_2
  
  have h₂ : 2 * y = 18 := by
    have h₂₁ : 2 * y + 6 = 24 := h₁
    have h₂₂ : 2 * y = 18 := by hole_3
    hole_4
  
  have h₃ : y = 9 := by
    have h₃₁ : 2 * y = 18 := h₂
    have h₃₂ : y = 9 := by hole_5
    hole_6
  
  hole_7
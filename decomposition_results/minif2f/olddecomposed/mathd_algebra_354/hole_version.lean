macro "hole_3" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem mathd_algebra_354 (a d : ℝ) (h₀ : a + 6 * d = 30) (h₁ : a + 10 * d = 60) :
    a + 20 * d = 135 := by
  have h₂ : 4 * d = 30 := by
    have h₂₁ : 4 * d = 30 := by
      
      hole_3
    hole_2
  
  have h₃ : 14 * d = 105 := by
    have h₃₁ : 14 * d = (7 / 2 : ℝ) * (4 * d) := by
      hole_5
    have h₃₂ : (7 / 2 : ℝ) * (4 * d) = (7 / 2 : ℝ) * 30 := by
      hole_6
    have h₃₃ : (7 / 2 : ℝ) * 30 = 105 := by hole_7
    hole_4
  
  have h₄ : a + 20 * d = 135 := by
    have h₄₁ : a + 20 * d = (a + 6 * d) + 14 * d := by
      hole_9
    rw [h₄₁]
    
    have h₄₂ : a + 6 * d = 30 := h₀
    have h₄₃ : 14 * d = 105 := h₃
    
    hole_8
  
  hole_1
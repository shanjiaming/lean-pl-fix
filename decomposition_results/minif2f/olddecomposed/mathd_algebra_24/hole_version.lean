macro "hole_4" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem mathd_algebra_24 (x : ℝ) (h₀ : x / 50 = 40) : x = 2000 := by
  have h₁ : x = 2000 := by
    have h₁ : x = 40 * 50 := by
      
      have h₁ : x / 50 = 40 := h₀
      have h₂ : x = 40 * 50 := by
        
        hole_4
      hole_3
    
    have h₂ : x = 2000 := by
      hole_5
    hole_2
  hole_1
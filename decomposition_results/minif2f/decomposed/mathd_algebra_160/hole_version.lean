macro "hole_3" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem mathd_algebra_160 (n x : ℝ) (h₀ : n + x = 97) (h₁ : n + 5 * x = 265) : n + 2 * x = 139 := by
  have h₂ : x = 42 := by
    have h₂₁ : 4 * x = 168 := by
      
      hole_3
    
    hole_2
  
  have h₃ : n = 55 := by
    
    have h₃₁ : n = 55 := by
      
      hole_5
    
    hole_4
  
  have h₄ : n + 2 * x = 139 := by
    hole_6
  
  hole_1
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem critical_points : f_deriv x = 0 ↔ x = 2 ∨ x = 4 := by
  have h_main : f_deriv x = 0 ↔ x = 2 ∨ x = 4 := by
    constructor
    · 
      intro h
      have h₁ : 3 * x ^ 2 - 18 * x + 24 = 0 := by
        
        hole_3
      have h₂ : x = 2 ∨ x = 4 := by
        
        have h₃ : x ^ 2 - 6 * x + 8 = 0 := by
          
          hole_5
        have h₄ : (x - 2) * (x - 4) = 0 := by
          
          hole_6
        
        have h₅ : x - 2 = 0 ∨ x - 4 = 0 := by
          hole_7
        hole_4
      hole_2
  hole_1
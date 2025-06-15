macro "hole_2" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem positivity_of_square_plus_one (x : ℝ) : 0 < x^2 + 1 := by
  have h₁ : 0 ≤ x^2 := by
    
    hole_2
  
  have h₂ : 0 < x^2 + 1 := by
    
    have h₂₁ : 0 ≤ x^2 := h₁
    have h₂₂ : 0 < x^2 + 1 := by
      
      hole_4
    hole_3
  
  hole_1
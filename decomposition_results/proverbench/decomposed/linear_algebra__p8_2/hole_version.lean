macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem verify_solution : (4, -4, -2) ∈ {x : ℚ × ℚ × ℚ |
-19 * x.1 + 8 * x.2.1 = -108 ∧
-71 * x.1 + 30 * x.2.1 = -404 ∧
-2 * x.1 + x.2.1 = -12 ∧
4 * x.1 + x.2.2 = 14} := by
  have h₁ : -19 * (4 : ℚ) + 8 * (-4 : ℚ) = -108 := by
    hole_2
  
  have h₂ : -71 * (4 : ℚ) + 30 * (-4 : ℚ) = -404 := by
    hole_3
  
  have h₃ : -2 * (4 : ℚ) + (-4 : ℚ) = -12 := by
    hole_4
  
  have h₄ : 4 * (4 : ℚ) + (-2 : ℚ) = 14 := by
    hole_5
  
  have h_main : (4, -4, -2) ∈ {x : ℚ × ℚ × ℚ | -19 * x.1 + 8 * x.2.1 = -108 ∧ -71 * x.1 + 30 * x.2.1 = -404 ∧ -2 * x.1 + x.2.1 = -12 ∧ 4 * x.1 + x.2.2 = 14} := by
    
    
    hole_6
  
  hole_1
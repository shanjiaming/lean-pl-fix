macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem heightAtTwo : heightFunction 2 = 16 := by
  have h₁ : heightFunction 2 = 40 * (2 : ℝ) - 16 * (2 : ℝ) ^ 2 := by
    hole_2
  
  have h₂ : heightFunction 2 = 16 := by
    hole_3
  
  hole_1
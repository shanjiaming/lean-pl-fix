macro "hole_2" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem function_evaluation_example : f 7 1 = 56 := by
  have h₁ : f 7 1 = 56 := by
    hole_2
  
  hole_1
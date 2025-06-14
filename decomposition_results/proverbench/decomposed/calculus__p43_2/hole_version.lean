macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem heightAtTwoPointFive : heightFunction 2.5 = 0 := by
  have h₁ : heightFunction 2.5 = 40 * (2.5 : ℝ) - 16 * (2.5 : ℝ)^2 := by
    hole_2
  
  have h₂ : 40 * (2.5 : ℝ) - 16 * (2.5 : ℝ)^2 = 0 := by
    hole_3
  
  have h₃ : heightFunction 2.5 = 0 := by
    hole_4
  
  hole_1
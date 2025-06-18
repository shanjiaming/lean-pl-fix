macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem mathd_numbertheory_517 : 121 * 122 * 123 % 4 = 2 := by
  have h₁ : 121 % 4 = 1 := by
    hole_2
  
  have h₂ : 122 % 4 = 2 := by
    hole_3
  
  have h₃ : 123 % 4 = 3 := by
    hole_4
  
  have h₄ : 121 * 122 * 123 % 4 = 2 := by
    hole_5
  
  hole_1
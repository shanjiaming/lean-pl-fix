macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem verify_inverse : A * A_inv = 1 ∧ A_inv * A = 1 := by
  have h1 : A * A_inv = 1 := by
    hole_2
  
  have h2 : A_inv * A = 1 := by
    hole_3
  
  have h3 : A * A_inv = 1 ∧ A_inv * A = 1 := by
    hole_4
  
  hole_1
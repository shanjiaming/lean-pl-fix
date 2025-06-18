macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)

theorem mathd_numbertheory_343 : (∏ k in Finset.range 6, (2 * k + 1)) % 10 = 5 := by
  have h₁ : (∏ k in Finset.range 6, (2 * k + 1)) = 1 * 3 * 5 * 7 * 9 * 11 := by
    hole_1
  
  have h₂ : (∏ k in Finset.range 6, (2 * k + 1)) % 10 = 5 := by
    hole_2
  
  hole_3
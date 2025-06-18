macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)

theorem mathd_numbertheory_299 : 1 * 3 * 5 * 7 * 9 * 11 * 13 % 10 = 5 := by
  have h₀ : (1 * 3 * 5 * 7 * 9 * 11 * 13 : ℕ) % 10 = 5 := by
    hole_1
  
  hole_2
macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)

theorem mathd_numbertheory_212 : 16 ^ 17 * 17 ^ 18 * 18 ^ 19 % 10 = 8 := by
  have h1 : 16 ^ 17 % 10 = 6 := by
    hole_1
  
  have h2 : 17 ^ 18 % 10 = 9 := by
    hole_2
  
  have h3 : 18 ^ 19 % 10 = 2 := by
    hole_3
  
  have h4 : (16 ^ 17 * 17 ^ 18 * 18 ^ 19) % 10 = 8 := by
    have h5 : (16 ^ 17 * 17 ^ 18 * 18 ^ 19) % 10 = ((16 ^ 17 % 10) * (17 ^ 18 % 10) * (18 ^ 19 % 10)) % 10 := by
      hole_4
    hole_5
  
  hole_6
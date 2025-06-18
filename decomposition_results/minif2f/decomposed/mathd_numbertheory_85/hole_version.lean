macro "hole_1" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)

theorem mathd_numbertheory_85 : 1 * 3 ^ 3 + 2 * 3 ^ 2 + 2 * 3 + 2 = 53 := by
  have h1 : 3 ^ 3 = 27 := by hole_1
  have h2 : 3 ^ 2 = 9 := by hole_2
  have h3 : 1 * 3 ^ 3 = 27 := by hole_3
  have h4 : 2 * 3 ^ 2 = 18 := by hole_4
  have h5 : 2 * 3 = 6 := by hole_5
  have h6 : 1 * 3 ^ 3 + 2 * 3 ^ 2 = 45 := by hole_6
  have h7 : 1 * 3 ^ 3 + 2 * 3 ^ 2 + 2 * 3 = 51 := by hole_7
  have h8 : 1 * 3 ^ 3 + 2 * 3 ^ 2 + 2 * 3 + 2 = 53 := by hole_8
  hole_9
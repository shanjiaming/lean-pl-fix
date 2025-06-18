macro "hole_2" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)
macro "skip_hole" : term => `(sorry)

theorem mathd_numbertheory_127 : (∑ k in Finset.range 101, 2 ^ k) % 7 = 3 := by
  have h_sum_mod : (∑ k in Finset.range 101, 2 ^ k) % 7 = 3 := by
    hole_2
  hole_1
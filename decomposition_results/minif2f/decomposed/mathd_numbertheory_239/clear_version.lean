macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)
macro "skip_hole" : term => `(sorry)

theorem mathd_numbertheory_239 : (∑ k in Finset.Icc 1 12, k) % 4 = 2 := by
  have h_sum : (∑ k in Finset.Icc 1 12, k) = 78 := by
    hole_2
  
  have h_final : (∑ k in Finset.Icc 1 12, k) % 4 = 2 := by
    hole_3
  
  hole_1
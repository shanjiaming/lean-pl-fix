macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)
macro "skip_hole" : term => `(sorry)

theorem mathd_numbertheory_237 : (∑ k in Finset.range 101, k) % 6 = 4 := by
  have h : (∑ k in Finset.range 101, k) = 5050 := by
    hole_2
  
  have h₁ : (∑ k in Finset.range 101, k) % 6 = 4 := by
    hole_3
  
  hole_1
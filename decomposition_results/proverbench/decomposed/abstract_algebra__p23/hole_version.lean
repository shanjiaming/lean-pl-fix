macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_6" : tactic => `(tactic| admit)
macro "hole_9" : tactic => `(tactic| admit)
macro "hole_8" : tactic => `(tactic| admit)
macro "hole_10" : tactic => `(tactic| admit)
macro "hole_7" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem zeros_of_f_in_Z5 : {x : ZMod 5 | eval x f = 0} = {0, 4} := by
  have h0 : (0 : ZMod 5) ∈ {x : ZMod 5 | eval x f = 0} := by
    hole_2
  
  have h1 : (1 : ZMod 5) ∉ {x : ZMod 5 | eval x f = 0} := by
    hole_3
  
  have h2 : (2 : ZMod 5) ∉ {x : ZMod 5 | eval x f = 0} := by
    hole_4
  
  have h3 : (3 : ZMod 5) ∉ {x : ZMod 5 | eval x f = 0} := by
    hole_5
  
  have h4 : (4 : ZMod 5) ∈ {x : ZMod 5 | eval x f = 0} := by
    hole_6
  
  have h_main : {x : ZMod 5 | eval x f = 0} = {0, 4} := by
    apply Set.Subset.antisymm
    · 
      intro x hx
      have h : eval x f = 0 := hx
      have h5 : x = 0 ∨ x = 4 := by
        have h6 : x = 0 ∨ x = 1 ∨ x = 2 ∨ x = 3 ∨ x = 4 := by
          hole_9
        hole_8
      cases h5 with
      | inl h5 =>
        simp [h5]
      | inr h5 =>
        simp [h5]
    · 
      intro x hx
      have h5 : x = 0 ∨ x = 4 := by hole_10
      hole_7
  
  hole_1
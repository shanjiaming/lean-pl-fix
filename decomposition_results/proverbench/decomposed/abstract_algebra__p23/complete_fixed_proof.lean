theorem zeros_of_f_in_Z5 : {x : ZMod 5 | eval x f = 0} = {0, 4} := by
  have h0 : (0 : ZMod 5) ∈ {x : ZMod 5 | eval x f = 0} := by
    admit
  
  have h1 : (1 : ZMod 5) ∉ {x : ZMod 5 | eval x f = 0} := by
    admit
  
  have h2 : (2 : ZMod 5) ∉ {x : ZMod 5 | eval x f = 0} := by
    admit
  
  have h3 : (3 : ZMod 5) ∉ {x : ZMod 5 | eval x f = 0} := by
    admit
  
  have h4 : (4 : ZMod 5) ∈ {x : ZMod 5 | eval x f = 0} := by
    admit
  
  have h_main : {x : ZMod 5 | eval x f = 0} = {0, 4} := by
    apply Set.Subset.antisymm
    · 
      intro x hx
      have h : eval x f = 0 := hx
      have h5 : x = 0 ∨ x = 4 := by
        have h6 : x = 0 ∨ x = 1 ∨ x = 2 ∨ x = 3 ∨ x = 4 := by
          admit
        admit
      cases h5 with
      | inl h5 =>
        simp [h5]
      | inr h5 =>
        simp [h5]
    · 
      intro x hx
      have h5 : x = 0 ∨ x = 4 := by admit
      admit
  
  admit
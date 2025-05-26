theorem zeros_of_f_in_Z5  : {x | sorry = 0} = {0, 4} :=
  by
  have h0 : (0 : ZMod 5) ∈ {x : ZMod 5 | eval x f = 0} := by sorry
  have h1 : (1 : ZMod 5) ∉ {x : ZMod 5 | eval x f = 0} := by sorry
  have h2 : (2 : ZMod 5) ∉ {x : ZMod 5 | eval x f = 0} := by sorry
  have h3 : (3 : ZMod 5) ∉ {x : ZMod 5 | eval x f = 0} := by sorry
  have h4 : (4 : ZMod 5) ∈ {x : ZMod 5 | eval x f = 0} := by sorry
  have h_main : {x : ZMod 5 | eval x f = 0} = {0, 4} := by sorry
  --  exact h_main
  hole
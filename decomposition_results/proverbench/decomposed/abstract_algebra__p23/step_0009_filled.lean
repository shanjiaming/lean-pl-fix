theorem h6 (h0 : 0 ∈ {x | eval x f = 0}) (h1 : 1 ∉ {x | eval x f = 0}) (h2 : 2 ∉ {x | eval x f = 0}) (h3 : 3 ∉ {x | eval x f = 0}) (h4 : 4 ∈ {x | eval x f = 0}) (x : ZMod 5) (hx : x ∈ {x | eval x f = 0}) (h : eval x f = 0) : x = 0 ∨ x = 1 ∨ x = 2 ∨ x = 3 ∨ x = 4 := by
  --  revert x
  --  decide
  hole
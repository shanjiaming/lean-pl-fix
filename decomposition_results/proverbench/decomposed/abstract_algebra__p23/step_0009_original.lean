theorem h6 (h0 : 0 ∈ {x | sorry = 0}) (h1 : 1 ∉ {x | sorry = 0}) (h2 : 2 ∉ {x | sorry = 0}) (h3 : 3 ∉ {x | sorry = 0}) (h4 : 4 ∈ {x | sorry = 0}) (x : ZMod 5) (hx : x ∈ {x | sorry = 0}) (h : sorry = 0) : x = 0 ∨ x = 1 ∨ x = 2 ∨ x = 3 ∨ x = 4 := by
  revert x
  decide
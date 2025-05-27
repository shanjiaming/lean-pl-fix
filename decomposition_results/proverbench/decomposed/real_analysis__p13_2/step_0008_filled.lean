theorem h_main (x : ℝ) (hx : x > 0) (h_imp : 2 ≤ log x → rexp 2 ≤ x) (h_conv : rexp 2 ≤ x → 2 ≤ log x) : 2 ≤ log x ↔ rexp 2 ≤ x := by
  --  constructor
  --  · intro h
  --    exact h_imp h
  --  · intro h
  --    exact h_conv h
  hole
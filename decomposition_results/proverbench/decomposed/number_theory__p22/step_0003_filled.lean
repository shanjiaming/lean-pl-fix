theorem h₂ (p q : ℤ) (h : ∃ r, cos (↑p * π / ↑q) = ↑r) (hq : q = 0) : ↑q = 0 := by -- exact_mod_cast hq
  linarith
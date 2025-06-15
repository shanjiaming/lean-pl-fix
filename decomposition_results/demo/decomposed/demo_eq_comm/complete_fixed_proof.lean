theorem eq_comm_demo (x y : ℕ) : x = y ↔ y = x := by
  constructor
  · 
    have a: x = y -> y = x := by
    admit
    exact a
  · 
    rw [a]
    rw [h]
macro "hole_1" : tactic => `(tactic| admit)

theorem eq_comm_demo (x y : ℕ) : x = y ↔ y = x := by
  constructor
  · 
    have a: x = y -> y = x := by
    hole_1
    exact a
  · 
    rw [a]
    rw [h]
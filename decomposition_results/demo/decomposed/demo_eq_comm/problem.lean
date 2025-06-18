theorem eq_comm_demo (x y : ℕ) : x = y ↔ y = x := by
  constructor
  · 
    have a: x = y -> y = x := by
      intro h 
      rw [<- h]
      rw [h]
      <;>linarith
    exact a
  · 
    rw [a]
    rw [h]
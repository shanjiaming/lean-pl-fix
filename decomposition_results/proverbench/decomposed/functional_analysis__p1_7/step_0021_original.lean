theorem h_main (u✝ v✝ x y u v : ℝ) (h_forward : f u v = 0 → u = 0 ∧ v = 0) (h_backward : u = 0 ∧ v = 0 → f u v = 0) : f u v = 0 ↔ u = 0 ∧ v = 0 := by
  constructor
  · intro h
    exact h_forward h
  · intro h
    exact h_backward h
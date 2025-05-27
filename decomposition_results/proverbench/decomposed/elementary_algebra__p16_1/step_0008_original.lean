theorem h_main (r : ℝ) (h_forward : given_equation r → r = 7) (h_backward : r = 7 → given_equation r) : given_equation r ↔ r = 7 := by
  constructor
  · intro h
    apply h_forward
    exact h
  · intro h
    apply h_backward
    exact h
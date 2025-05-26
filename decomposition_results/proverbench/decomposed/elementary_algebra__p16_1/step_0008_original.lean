theorem h_main (h_forward : sorry → sorry = 7) (h_backward : sorry = 7 → sorry) : sorry ↔ sorry = 7 := by
  constructor
  · intro h
    apply h_forward
    exact h
  · intro h
    apply h_backward
    exact h
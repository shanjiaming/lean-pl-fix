theorem h_main (b : ℤ) (h_forward : b ∈ B → ∃ k, b = -44 + 5 * k) (h_backward : (∃ k, b = -44 + 5 * k) → b ∈ B) : b ∈ B ↔ ∃ k, b = -44 + 5 * k := by
  constructor
  · intro h
    exact h_forward h
  · intro h
    exact h_backward h
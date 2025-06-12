theorem h4 (x y : ℕ) (h : x = y) (h_le h3 : x ≤ y) : y ≤ x := by
  rw [← h]
  omega
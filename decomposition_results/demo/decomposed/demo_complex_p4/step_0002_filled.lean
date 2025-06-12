theorem h2 (x y : ℕ) (h : x = y) (h_le : x ≤ y) : x = y := by
  have h3 : x ≤ y := h_le
  have h4 : y ≤ x := by sorry
  --  omega
  admit
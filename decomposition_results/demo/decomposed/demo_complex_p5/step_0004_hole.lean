theorem h8 (a b c : ℕ) (h1 : a ≤ b) (h2 : b ≤ c) (h : ¬a = c) (h3 : a ≤ c) (h7 : a ≠ c) : a < c := by
  have h9 : a ≤ c := h3
  have h10 : a ≠ c := h7
  --  exact Nat.lt_of_le_of_ne h9 h10
  hole
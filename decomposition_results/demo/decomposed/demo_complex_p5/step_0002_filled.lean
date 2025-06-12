theorem h_main (a b c : ℕ) (h1 : a ≤ b) (h2 : b ≤ c) (h : ¬a = c) : a < c :=
  by
  have h3 : a ≤ c := by sorry
  have h7 : a ≠ c := h
  have h8 : a < c := by sorry
  --  exact h8
  admit
theorem h3 (a b c : ℕ) (h1 : a ≤ b) (h2 : b ≤ c) (h : ¬a = c) : a ≤ c := by
  have h4 : a ≤ b := h1
  have h5 : b ≤ c := h2
  have h6 : a ≤ c := le_trans h4 h5
  --  exact h6
  admit
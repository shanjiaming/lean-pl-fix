theorem h_final (a b c : ℕ) (h1 : a ≤ b) (h2 : b ≤ c) (h : ¬a = c) (h_main : a < c) : a ≤ c := by
  have h11 : a < c := h_main
  have h12 : a ≤ c := le_of_lt h11
  --  exact h12
  admit
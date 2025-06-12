theorem multi_level_decomposition (a b c : ℕ) (h1 : a ≤ b) (h2 : b ≤ c) : a ≤ c := by
  by_cases h : a = c
  · -- case a = c
    simp [h]
  · -- case a ≠ c
    have h_main : a < c := by
      have h3 : a ≤ c := by
        have h4 : a ≤ b := h1
        have h5 : b ≤ c := h2
        have h6 : a ≤ c := le_trans h4 h5
        exact h6
      have h7 : a ≠ c := h
      have h8 : a < c := by
        have h9 : a ≤ c := h3
        have h10 : a ≠ c := h7
        exact Nat.lt_of_le_of_ne h9 h10
      exact h8
    have h_final : a ≤ c := by
      have h11 : a < c := h_main
      have h12 : a ≤ c := le_of_lt h11
      exact h12
    exact h_final
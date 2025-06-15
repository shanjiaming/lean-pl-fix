macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_2" : tactic => `(tactic| admit)
macro "hole_5" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem multi_level_decomposition (a b c : ℕ) (h1 : a ≤ b) (h2 : b ≤ c) : a ≤ c := by
  by_cases h : a = c
  · 
    simp [h]
  · 
    have h_main : a < c := by
      have h3 : a ≤ c := by
        have h4 : a ≤ b := h1
        have h5 : b ≤ c := h2
        have h6 : a ≤ c := le_trans h4 h5
        hole_3
      have h7 : a ≠ c := h
      have h8 : a < c := by
        have h9 : a ≤ c := h3
        have h10 : a ≠ c := h7
        hole_4
      hole_2
    have h_final : a ≤ c := by
      have h11 : a < c := h_main
      have h12 : a ≤ c := le_of_lt h11
      hole_5
    hole_1
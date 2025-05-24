theorem h1 (a b : ℕ) (h_eq : a + b = 5) (h_gt : a > b) : a ≤ 5 := by
  have h1_1 : a + b = 5 := h_eq
  have h1_2 : b ≥ 0 := by sorry
  have h1_3 : a = 5 - b := by sorry
  have h1_4 : a ≤ 5 := by sorry
  exact h1_4
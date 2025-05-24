theorem h1_3 (a b : ℕ) (h_eq : a + b = 5) (h_gt : a > b) (h1_1 : a + b = 5) (h1_2 : b ≥ 0) : a = 5 - b := by
  have h1_3_1 : a + b = 5 := h1_1
  have h1_3_2 : a = 5 - b := by sorry
  exact h1_3_2
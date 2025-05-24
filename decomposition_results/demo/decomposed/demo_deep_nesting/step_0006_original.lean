theorem h1_4 (a b : ℕ) (h_eq : a + b = 5) (h_gt : a > b) (h1_1 : a + b = 5) (h1_2 : b ≥ 0) (h1_3 : a = 5 - b) : a ≤ 5 := by
  rw [h1_3]
  have h1_4_1 : b ≥ 0 := h1_2
  have h1_4_2 : 5 - b ≤ 5 := by sorry
  exact h1_4_2
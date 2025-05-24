theorem h2_2 (a b : ℕ) (h_eq : a + b = 5) (h_gt : a > b) (h1 : a ≤ 5) (h2_1 : a + b = 5) : a ≥ 0 := by
  have h2_2_1 : a ≥ 0 := Nat.zero_le a
  --  exact h2_2_1
  hole
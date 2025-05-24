theorem h1_2 (a b : ℕ) (h_eq : a + b = 5) (h_gt : a > b) (h1_1 : a + b = 5) : b ≥ 0 := by
  have h1_2_1 : b ≥ 0 := Nat.zero_le b
  --  exact h1_2_1
  hole
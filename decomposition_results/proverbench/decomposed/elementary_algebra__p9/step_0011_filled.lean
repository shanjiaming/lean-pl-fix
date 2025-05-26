theorem h_final (n : ℕ) (hn : 0 < n) (h_main : (5 ^ n > sorry → n ≤ 11) ∧ (n ≤ 11 → 5 ^ n > sorry)) : 5 ^ n > sorry ↔ n ≤ 11 := by
  --  constructor
  --  · intro h
  --    exact h_main.1 h
  --  · intro h
  --    exact h_main.2 h
  hole
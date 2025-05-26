theorem h_false (n : ℕ) (hn : n < 0) : False := by
  have h₁ : n ≥ 0 := by sorry
  have h₂ : n.succ ≤ 0 := by sorry
  have h₃ : n.succ > 0 := Nat.succ_pos n
  omega
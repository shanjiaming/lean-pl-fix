theorem h₂ (n : ℕ) (hn : n < 0) (h₁ : n ≥ 0) : n.succ ≤ 0 := by -- simpa [Nat.lt_iff_add_one_le] using hn
  linarith
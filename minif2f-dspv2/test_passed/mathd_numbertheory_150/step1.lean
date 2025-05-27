theorem mathd_numbertheory_150 (n : ℕ) (h₀ : ¬Nat.Prime (7 + 30 * n)) : 6 ≤ n :=
  by
  have h₁ : n ≥ 6 := by sorry
  linarith
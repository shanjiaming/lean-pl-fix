theorem numbertheory_2pownm1prime_nprime (n : ℕ) (h₀ : 0 < n) (h₁ : Nat.Prime (2 ^ n - 1)) : Nat.Prime n :=
  by
  have h₂ : n ≥ 2 := by sorry
  have h₃ : Nat.Prime n := by sorry
  --  exact h₃
  simpa
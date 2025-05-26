theorem h₅ (p m n : ℕ) (hp : Nat.Prime p) (hmgen : m ≥ n) (h₂ : p > 0) : (0 + p * m).choose (0 + p * n) ≡ choose 0 0 * m.choose n [MOD p] :=
  by
  apply Nat.ModEq.symm
  apply Nat.ModEq.symm
  have h₆ : choose (0 + p * m) (0 + p * n) % p = (choose 0 0 * choose m n) % p := by sorry
  exact h₆
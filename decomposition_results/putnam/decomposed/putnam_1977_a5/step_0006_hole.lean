theorem h₆ (p m n : ℕ) (hp : Nat.Prime p) (hmgen : m ≥ n) (h₂ : p > 0) : (0 + p * m).choose (0 + p * n) % p = choose 0 0 * m.choose n % p :=
  by
  have h₇ : p ≠ 0 := by sorry
  have h₈ : choose (0 + p * m) (0 + p * n) % p = (choose 0 0 * choose m n) % p := by sorry
  --  exact h₈
  hole
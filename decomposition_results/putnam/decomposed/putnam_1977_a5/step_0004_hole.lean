theorem h₄ (p m n : ℕ) (hp : Nat.Prime p) (hmgen : m ≥ n) (h₂ : p > 0) : (0 + p * m).choose (0 + p * n) ≡ choose 0 0 * m.choose n [MOD p] :=
  by
  have h₅ : choose (0 + p * m) (0 + p * n) ≡ choose 0 0 * choose m n [MOD p] := by sorry
  --  exact h₅
  hole
theorem putnam_1977_a5 (p m n : ℕ) (hp : Nat.Prime p) (hmgen : m ≥ n) : (p * m).choose (p * n) ≡ m.choose n [MOD p] :=
  by
  have h₁ : choose (p * m) (p * n) ≡ choose m n [MOD p] := by sorry
  --  exact h₁
  simpa
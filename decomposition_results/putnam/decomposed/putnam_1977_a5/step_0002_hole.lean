theorem h₁ (p m n : ℕ) (hp : Nat.Prime p) (hmgen : m ≥ n) : (p * m).choose (p * n) ≡ m.choose n [MOD p] :=
  by
  have h₂ : p > 0 := Nat.Prime.pos hp
  have h₃ : choose (p * m) (p * n) ≡ choose m n [MOD p] := by sorry
  --  exact h₃
  hole
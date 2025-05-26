theorem h₃ (p m n : ℕ) (hp : Nat.Prime p) (hmgen : m ≥ n) (h₂ : p > 0) : (p * m).choose (p * n) ≡ m.choose n [MOD p] :=
  by
  have h₄ : choose (0 + p * m) (0 + p * n) ≡ choose 0 0 * choose m n [MOD p] := by sorry
  have h₅ : choose 0 0 = 1 := by sorry
  have h₆ : choose (0 + p * m) (0 + p * n) = choose (p * m) (p * n) := by sorry
  have h₇ : choose 0 0 * choose m n = choose m n := by sorry
  rw [h₆] at h₄
  rw [h₇] at h₄
  exact h₄
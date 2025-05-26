theorem h₃ (p : ℕ) (hp : Nat.Prime p) (h : ∃ x y, x ^ 2 - (↑p : ℤ) * y ^ 2 = -1) (h₂ : ¬(p = 2 ∨ p % 4 = 1)) : p ≠ 2 := by -- tauto
  hole
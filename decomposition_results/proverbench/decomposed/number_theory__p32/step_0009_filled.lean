theorem h_backward (p : ℕ) (hp : Nat.Prime p) (h_forward : (∃ x y, x ^ 2 - (↑p : ℤ) * y ^ 2 = -1) → p = 2 ∨ p % 4 = 1) : p = 2 ∨ p % 4 = 1 → ∃ x y, x ^ 2 - (↑p : ℤ) * y ^ 2 = -1 :=
  by
  --  intro h
  have h₁ : ∃ (x y : ℤ), x ^ 2 - p * y ^ 2 = -1 := by sorry
  --  exact h₁
  hole
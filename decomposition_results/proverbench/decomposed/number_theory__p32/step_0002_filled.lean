theorem h_forward (p✝ : ℕ) (hp✝ : Nat.Prime p✝) (p : ℕ) (hp : Nat.Prime p) : (∃ x y, x ^ 2 - ↑p * y ^ 2 = -1) → p = 2 ∨ p % 4 = 1 :=
  by
  intro h
  have h₁ : p = 2 ∨ p % 4 = 1 := by sorry
  exact h₁
  hole
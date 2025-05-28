theorem h₅₂ (p q : ℕ) (h₀ : Nat.Prime p ∧ Nat.Prime q) (h₁ : 4 ≤ p ∧ p ≤ 18) (h₂ : 4 ≤ q ∧ q ≤ 18) (h₃ : p = 5 ∨ p = 7 ∨ p = 11 ∨ p = 13 ∨ p = 17) (h₄ : q = 5 ∨ q = 7 ∨ q = 11 ∨ q = 13 ∨ q = 17) (h₅₁ : p ≥ 5) : q ≥ 5 := by
  have h₅₃ := h₀.2.two_le
  have h₅₄ := h₂.1
  have h₅₅ : q ≥ 4 := by sorry
  have h₅₆ : q ≠ 4 := by sorry
  --  omega
  omega
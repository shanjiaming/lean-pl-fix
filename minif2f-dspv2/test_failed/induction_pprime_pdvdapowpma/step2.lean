theorem h₂ (p a : ℕ) (h₀ : 0 < a) (h₁ : Nat.Prime p) : a ≤ a ^ p := by
  have h₃ : p ≠ 0 := Nat.Prime.ne_zero h₁
  have h₄ : a ≠ 0 := by sorry
  have h₅ : a ≤ a ^ p := by sorry
  exact h₅
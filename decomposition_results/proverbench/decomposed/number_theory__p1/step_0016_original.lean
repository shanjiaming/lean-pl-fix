theorem h₄ (n p : ℕ) (hp : Nat.Prime p) (hdiv : p ∣ polynomial n) (h₁ : p ≠ 3) (h₂ : ¬p ∣ n) (this : Fact (Nat.Prime p)) : ↑n ≠ 0 := by
  intro h₄
  have h₅ : (p : ℕ) ∣ n := by sorry
  exact h₂ h₅
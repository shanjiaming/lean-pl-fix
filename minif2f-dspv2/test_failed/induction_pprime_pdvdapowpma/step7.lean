theorem h₄ (p a : ℕ) (h₀ : 0 < a) (h₁ : Nat.Prime p) (h₂ : a ≤ a ^ p) (h₃ : (↑a : ZMod p) ^ p = (↑a : ZMod p)) : p ∣ a ^ p - a := by
  haveI : Fact p.Prime := ⟨h₁⟩
  have h₅ : (p : ℕ) ∣ a ^ p - a := by sorry
  exact h₅
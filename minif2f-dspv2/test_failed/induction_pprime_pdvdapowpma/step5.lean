theorem h₃ (p a : ℕ) (h₀ : 0 < a) (h₁ : Nat.Prime p) (h₂ : a ≤ a ^ p) : (↑a : ZMod p) ^ p = (↑a : ZMod p) := by
  haveI : Fact p.Prime := ⟨h₁⟩
  have h₄ : (a : ZMod p) ^ p = a := by sorry
  exact h₄
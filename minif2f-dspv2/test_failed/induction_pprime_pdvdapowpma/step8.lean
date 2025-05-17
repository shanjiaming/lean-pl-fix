theorem h₅ (p a : ℕ) (h₀ : 0 < a) (h₁ : Nat.Prime p) (h₂ : a ≤ a ^ p) (h₃ : (↑a : ZMod p) ^ p = (↑a : ZMod p)) (this : Fact (Nat.Prime p)) : p ∣ a ^ p - a :=
  by
  have h₆ : (a ^ p : ZMod p) = a := by sorry
  have h₇ : (p : ℕ) ∣ a ^ p - a := by sorry
  exact h₇
theorem h₅ (p : ℕ) (podd : Odd p) (pprime : Prime p) (h₁ : p > 2) (h₃ h₄ : p ≥ 3) : ({z | ∃ x, z = x ^ 2} ∩ {z | ∃ y, z = y ^ 2 + 1}).encard = ↑⌈↑p / 4⌉₊ :=
  by
  have h₆ :
    ({z : ZMod p | ∃ x : ZMod p, z = x ^ 2} ∩ {z : ZMod p | ∃ y : ZMod p, z = y ^ 2 + 1}).encard =
      Nat.ceil ((p : ℝ) / 4) := by sorry
  exact h₆
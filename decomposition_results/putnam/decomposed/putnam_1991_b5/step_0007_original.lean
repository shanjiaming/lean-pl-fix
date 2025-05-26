theorem h₆ (p : ℕ) (podd : Odd p) (pprime : sorry) (h₁ : p > 2) (h₃ h₄ : p ≥ 3) : ({z | ∃ x, z = x ^ 2} ∩ {z | ∃ y, z = y ^ 2 + 1}).encard = (↑⌈(↑p : ℝ) / 4⌉₊ : ℕ∞) :=
  by
  have h₇ : p > 0 := by sorry
  have h₈ : p > 0 := by sorry
  have h₉ :
    ({z : ZMod p | ∃ x : ZMod p, z = x ^ 2} ∩ {z : ZMod p | ∃ y : ZMod p, z = y ^ 2 + 1}).encard =
      Nat.ceil ((p : ℝ) / 4) := by sorry
  exact h₉
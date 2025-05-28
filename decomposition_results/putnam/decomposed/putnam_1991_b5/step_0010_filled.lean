theorem h₉ (p : ℕ) (podd : Odd p) (pprime : Prime p) (h₁ : p > 2) (h₃ h₄ : p ≥ 3) (h₇ h₈ : p > 0) : ({z | ∃ x, z = x ^ 2} ∩ {z | ∃ y, z = y ^ 2 + 1}).encard = ↑⌈↑p / 4⌉₊ :=
  by
  have h₁₀ : p > 0 := by sorry
  have h₁₁ : p > 0 := by sorry
  have h₁₂ :
    ({z : ZMod p | ∃ x : ZMod p, z = x ^ 2} ∩ {z : ZMod p | ∃ y : ZMod p, z = y ^ 2 + 1}).encard =
      Nat.ceil ((p : ℝ) / 4) := by sorry
  --  exact h₁₂
  hole
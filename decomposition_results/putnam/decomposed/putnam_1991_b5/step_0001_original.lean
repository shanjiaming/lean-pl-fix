theorem putnam_1991_b5 (p : ℕ) (podd : Odd p) (pprime : sorry) : ({z | ∃ x, z = x ^ 2} ∩ {z | ∃ y, z = y ^ 2 + 1}).encard = (↑((fun p => ⌈(↑p : ℝ) / 4⌉₊) p) : ℕ∞) :=
  by
  have h₁ : p > 2 := by sorry
  have h₂ :
    ({z : ZMod p | ∃ x : ZMod p, z = x ^ 2} ∩ {z : ZMod p | ∃ y : ZMod p, z = y ^ 2 + 1}).encard =
      Nat.ceil ((p : ℝ) / 4) := by sorry
  simpa using h₂
theorem putnam_1991_b5 (p : ℕ) (podd : Odd p) (pprime : Prime p) :
  ({z : ZMod p | ∃ x : ZMod p, z = x ^ 2} ∩ {z : ZMod p | ∃ y : ZMod p, z = y ^ 2 + 1}).encard =
    ((fun p : ℕ => Nat.ceil ((p : ℝ) / 4)) : ℕ → ℕ) p:=
  by
  have h₁ : p > 2:= by
    have h₁₁ := pprime.two_le
    have h₁₂ := podd
    cases' h₁₂ with k hk
    have h₁₃ := Nat.Prime.ne_zero pprime
    have h₁₄ : p ≠ 2 := by
      by_contra h
      rw [h] at hk
      norm_num at hk <;> omega
    omega
    hole
  have h₂ :
    ({z : ZMod p | ∃ x : ZMod p, z = x ^ 2} ∩ {z : ZMod p | ∃ y : ZMod p, z = y ^ 2 + 1}).encard =
      Nat.ceil ((p : ℝ) / 4) := by sorry
  --  simpa using h₂
  hole
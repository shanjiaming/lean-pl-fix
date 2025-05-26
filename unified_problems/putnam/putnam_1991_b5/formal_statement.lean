theorem putnam_1991_b5
(p : ℕ)
(podd : Odd p)
(pprime : Prime p)
: ({z : ZMod p | ∃ x : ZMod p, z = x ^ 2} ∩ {z : ZMod p | ∃ y : ZMod p, z = y ^ 2 + 1}).encard = ((fun p : ℕ => Nat.ceil ((p : ℝ) / 4)) : ℕ → ℕ ) p := by
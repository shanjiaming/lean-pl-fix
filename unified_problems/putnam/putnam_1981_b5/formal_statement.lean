theorem putnam_1981_b5
(sumbits : List ℕ → ℤ)
(B : ℕ → ℤ)
(hsumbits : ∀ bits : List ℕ, sumbits bits = ∑ i : Fin bits.length, (bits[i] : ℤ))
(hB : ∀ n > 0, B n = sumbits (Nat.digits 2 n))
: (∃ q : ℚ, Real.exp (∑' n : Set.Ici 1, B n / ((n : ℝ) * ((n : ℝ) + 1))) = q) ↔ ((True) : Prop ) := by
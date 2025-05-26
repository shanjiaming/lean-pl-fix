theorem putnam_1996_b5
    (n : ℕ)
    (Δ : (Fin n → ℤˣ) → Fin n → Fin n → ℤ)
    (balanced : (Fin n → ℤˣ) → Prop)
    (hΔ : ∀ S, ∀ a b, a ≤ b → Δ S a b = ∑ i in Finset.Icc a b, (S i : ℤ))
    (hbalanced : ∀ S, balanced S ↔ ∀ a b, a ≤ b → |Δ S a b| ≤ 2) :
    {S : Fin n → ℤˣ | balanced S}.ncard = ((fun n : ℕ ↦ 2 ^ ⌊(n + 2) / 2⌋₊ + 2 ^ ⌊(n + 1) / 2⌋₊ - 2) : ℕ → ℕ ) n :=
  by
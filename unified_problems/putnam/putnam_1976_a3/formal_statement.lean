theorem putnam_1976_a3
: {(p, r, q, s) : ℕ × ℕ × ℕ × ℕ | Nat.Prime p ∧ Nat.Prime q ∧ r > 1 ∧ s > 1 ∧ |(p^r : ℤ) - q^s| = 1} = (({(3, 2, 2, 3), (2, 3, 3, 2)}) : Set (ℕ × ℕ × ℕ × ℕ) ) := by
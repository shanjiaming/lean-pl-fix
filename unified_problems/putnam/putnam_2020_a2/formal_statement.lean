theorem putnam_2020_a2
(k : ℕ)
: (∑ j in Finset.Icc 0 k, 2 ^ (k - j) * Nat.choose (k + j) j = ((fun k ↦ 4 ^ k) : ℕ → ℕ ) k) := by
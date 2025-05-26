theorem putnam_1974_a4
    (n : ℕ)
    (hn : 0 < n) :
    (1 : ℚ) / (2 ^ (n - 1)) * ∑ k in Finset.Icc 0 ⌊n / 2⌋₊, (n - 2 * k) * (n.choose k) =
    ((fun n ↦ (1 : ℚ) / (2 ^ (n - 1)) * (n * (n - 1).choose ⌊n / 2⌋₊)) : ℕ → ℚ ) n :=
  by
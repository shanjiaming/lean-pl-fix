theorem putnam_1962_a5
: ∀ n ≥ 2, ((fun n : ℕ => n * (n + 1) * 2^(n - 2)) : ℕ → ℕ ) n = ∑ k in Finset.Icc 1 n, Nat.choose n k * k^2 := by
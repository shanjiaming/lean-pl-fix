theorem putnam_1965_a5
: ∀ n > 0, {p ∈ permsOfFinset (Finset.Icc 1 n) | ∀ m ∈ Finset.Icc 2 n, ∃ k ∈ Finset.Ico 1 m, p m = p k + 1 ∨ p m = p k - 1}.card = ((fun n => 2^(n - 1)) : ℕ → ℕ ) n := by
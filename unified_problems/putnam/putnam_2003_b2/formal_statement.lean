theorem putnam_2003_b2
  (n : ℕ)
  (hn : n > 0)
  (seq : ℕ → ℕ → ℚ)
  (hinit : ∀ j ∈ Icc 1 n, seq 0 j = 1 / j)
  (havg : ∀ᵉ (k ∈ Icc 1 (n - 1)) (j ∈ Icc 1 (n - k)),
    seq k j = (seq (k - 1) j + seq (k - 1) (j + 1)) / 2) :
  (seq (n - 1) 1 < 2 / n) := by
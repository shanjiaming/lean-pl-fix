theorem h1 (a : ℕ → ℕ) (ha1 : a 1 = 3) (ha : ∀ i ≥ 1, a (i + 1) = 3 ^ a i) (h_a2 : a 2 = 27) : a 3 = 3 ^ a 2 := by
  have h2 := ha 2 (by norm_num)
  simpa using h2
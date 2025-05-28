theorem h1 (a : ℕ → ℕ) (ha1 : a 1 = 3) (ha : ∀ i ≥ 1, a (i + 1) = 3 ^ a i) : a 2 = 3 ^ a 1 := by
  have h2 := ha 1 (by norm_num)
  --  simpa using h2
  hole
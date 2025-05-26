theorem h4 (f : Polynomial ℤ) (hf : ∀ (n : ℕ), f.coeff n ≥ 0) (hfnconst : ∃ n > 0, f.coeff n > 0) (n : ℤ) (hn : n > 0) (h1 : Polynomial.eval 1 f > 0) (h2 : n ≥ 1) (hn1 : n ≠ 1) : n ≥ 2 := by
  --  by_contra h
  have h5 : n ≤ 1 := by sorry
  have h6 : n = 1 := by sorry
  --  contradiction
  omega
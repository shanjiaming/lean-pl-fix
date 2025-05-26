theorem h18 (f : Polynomial ℤ) (hf : ∀ (n : ℕ), f.coeff n ≥ 0) (hfnconst : ∃ n > 0, f.coeff n > 0) (n : ℤ) (hn : n > 0) (h1 : Polynomial.eval 1 f > 0) (h2 : n ≥ 1) (hn1 : n ≠ 1) (h4 h5 : n ≥ 2) (m : ℕ) (hm1 : m > 0) (hm2 : f.coeff m > 0) (h8 : m > 0) (h10 : Polynomial.eval n f = Polynomial.eval n f) (h11 : Polynomial.eval 1 f = Polynomial.eval 1 f) (h13 : Polynomial.eval n f - Polynomial.eval 1 f = Polynomial.eval n f - Polynomial.eval 1 f) (h15 : 0 < n) (h16 : ∀ (k : ℕ), f.coeff k ≥ 0) (h17 : Polynomial.eval n f - Polynomial.eval 1 f = ∑ k ∈ f.support, f.coeff k * (n ^ k - 1)) : ∑ k ∈ f.support, f.coeff k * (n ^ k - 1) > 0 :=
  by
  have h19 : (m : ℕ) ∈ f.support := by sorry
  have h20 : (f.coeff m : ℤ) * (n ^ m - 1 : ℤ) > 0 := by sorry
  have h21 : ∑ k in f.support, (f.coeff k : ℤ) * (n ^ k - 1 : ℤ) > 0 := by sorry
  --  exact h21
  hole
theorem h3 (f : Polynomial ℤ) (hf : ∀ (n : ℕ), f.coeff n ≥ 0) (hfnconst : ∃ n > 0, f.coeff n > 0) (n : ℤ) (hn : n > 0) (h1 : Polynomial.eval 1 f > 0) (h2 : n ≥ 1) : n ≠ 1 → Polynomial.eval n f > Polynomial.eval 1 f :=
  by
  --  intro hn1
  have h4 : n ≥ 2 := by sorry
  have h5 : (n : ℤ) ≥ 2 := by sorry
  have h6 : Polynomial.eval n f > Polynomial.eval 1 f := by sorry
  --  exact h6 <;> omega
  hole
theorem putnam_2004_b1 (n : ℕ) (P : Polynomial ℤ) (r : ℚ) (Pdeg : P.degree = n) (Preq0 : Polynomial.aeval r P = 0) :
  ∀ i ∈ Finset.range n, ∃ m : ℤ, (m : ℚ) = ∑ j in Finset.range (i + 1), ((P.coeff (n - j) : ℚ) * r ^ (i + 1 - j)):=
  by
  have h_main :
    ∀ i ∈ Finset.range n, ∃ m : ℤ, (m : ℚ) = ∑ j in Finset.range (i + 1), ((P.coeff (n - j) : ℚ) * r ^ (i + 1 - j)) := by sorry
  --  exact h_main
  norm_num
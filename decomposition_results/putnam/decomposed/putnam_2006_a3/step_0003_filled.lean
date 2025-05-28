theorem h2 (x : ℤ → ℤ) (hxlo : ∀ (k : ℤ), 0 ≤ k ∧ k ≤ 2006 → x k = k) (hxhi : ∀ k ≥ 2006, x (k + 1) = x k + x (k - 2005)) (h1 : False) : ∃ i > 0, ∀ (j : { x // x ∈ Finset.range 2005 }), 2006 ∣ x (↑i + ↑↑j) :=
  by
  --  exfalso
  --  exact h1
  norm_cast
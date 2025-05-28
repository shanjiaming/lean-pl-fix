theorem putnam_2006_a3 (x : ℤ → ℤ) (hxlo : ∀ (k : ℤ), 0 ≤ k ∧ k ≤ 2006 → x k = k) (hxhi : ∀ k ≥ 2006, x (k + 1) = x k + x (k - 2005)) : ∃ i > 0, ∀ (j : { x // x ∈ Finset.range 2005 }), 2006 ∣ x (↑i + ↑↑j) :=
  by
  have h1 : False := by sorry
  have h2 : ∃ (i : ℕ), i > 0 ∧ ∀ j : Finset.range 2005, 2006 ∣ x (i + j) := by sorry
  --  exact h2
  hole
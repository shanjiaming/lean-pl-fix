theorem putnam_1995_a4 (n : ℕ) (hn : n > 0) (necklace : Fin n → ℤ) (hnecklacesum : ∑ i, necklace i = (↑n : ℤ) - 1) : ∃ cut, ∀ (k : ℕ), ∑ i, necklace (cut + (↑i : Fin n)) ≤ (↑k : ℤ) :=
  by
  have h_main : ∃ (cut : Fin n), ∀ (k : ℕ), ∑ i : {j : Fin n | j.1 ≤ k}, necklace (cut + i) ≤ k := by sorry
  obtain ⟨cut, hcut⟩ := h_main
  refine' ⟨cut, _⟩
  intro k
  exact hcut k
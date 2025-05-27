theorem putnam_1995_a4
(n : ℕ)
(hn : n > 0)
(necklace : Fin n → ℤ)
(hnecklacesum : ∑ i : Fin n, necklace i = n - 1)
: ∃ cut, ∀ k, ∑ i : {j : Fin n | j.1 ≤ k}, necklace (cut + i) ≤ k := by
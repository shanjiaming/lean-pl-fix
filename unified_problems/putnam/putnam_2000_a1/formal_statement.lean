theorem putnam_2000_a1
(A : ℝ)
(Apos : A > 0)
: {S : ℝ |
    ∃ x : ℕ → ℝ,
      (∀ j : ℕ, x j > 0) ∧
      (∑' j : ℕ, x j) = A ∧
      (∑' j : ℕ, (x j) ^ 2) = S}
  = ((fun A : ℝ => Set.Ioo 0 (A ^ 2)) : ℝ → Set ℝ ) A := by
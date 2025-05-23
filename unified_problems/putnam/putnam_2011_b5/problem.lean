theorem putnam_2011_b5
  (a : ℕ → ℝ)
  (h : ∃ A : ℝ, ∀ n : ℕ, ∫ x : ℝ, ((∑ i in Finset.range n, (1 : ℝ) / (1 + (x - a i) ^ 2)) ^ 2) ≤ A * n) :
  ∃ B : ℝ, B > 0 ∧
    ∀ n : ℕ, ∑ i in Finset.range n, ∑ j in Finset.range n, (1 + (a i - a j) ^ 2) ≥ B * n ^ 2 := by
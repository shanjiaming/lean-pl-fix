theorem h₅₂ (c : ℝ) (s : ℕ → ℝ) (h₀ : s 0 = 0) (h₁ : StrictMono s) (n : ℕ) (h₂ : s n = 1) (h₃ : ∑ i ∈ Finset.range n, (s (i + 1) ^ 3 - s i * s (i + 1) ^ 2) = c) (h₄ : c > 1 / 3) (h₅₁ : ∀ i ∈ Finset.range n, s (i + 1) ^ 3 - s i * s (i + 1) ^ 2 ≤ s (i + 1) ^ 3 - s i ^ 3) : ∑ i ∈ Finset.range n, (s (i + 1) ^ 3 - s i * s (i + 1) ^ 2) ≤ ∑ i ∈ Finset.range n, (s (i + 1) ^ 3 - s i ^ 3) :=
  by
  apply Finset.sum_le_sum
  intro i hi
  exact h₅₁ i hi
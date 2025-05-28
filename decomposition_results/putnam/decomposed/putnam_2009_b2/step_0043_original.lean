theorem h₅₃₁ (c : ℝ) (s : ℕ → ℝ) (h₀ : s 0 = 0) (h₁ : StrictMono s) (n : ℕ) (h₂ : s n = 1) (h₃ : ∑ i ∈ Finset.range n, (s (i + 1) ^ 3 - s i * s (i + 1) ^ 2) = c) (h₄ : c > 1 / 3) (h₅₁ : ∀ i ∈ Finset.range n, s (i + 1) ^ 3 - s i * s (i + 1) ^ 2 ≤ s (i + 1) ^ 3 - s i ^ 3) (h₅₂ : ∑ i ∈ Finset.range n, (s (i + 1) ^ 3 - s i * s (i + 1) ^ 2) ≤ ∑ i ∈ Finset.range n, (s (i + 1) ^ 3 - s i ^ 3)) : ∀ (k : ℕ), ∑ i ∈ Finset.range k, (s (i + 1) ^ 3 - s i ^ 3) = s k ^ 3 :=
  by
  intro k
  induction k with
  | zero => simp [h₀] <;> norm_num
  | succ k ih => rw [Finset.sum_range_succ, ih] <;> ring_nf <;> linarith [h₁.lt_iff_lt.mpr (by simp : (k : ℕ) < k + 1)]
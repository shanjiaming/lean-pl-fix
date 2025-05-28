theorem h₄₁ (c : ℝ) (s : ℕ → ℝ) (h₀ : s 0 = 0) (h₁ : StrictMono s) (n : ℕ) (h₂ : s n = 1) (h₃ : ∑ i ∈ Finset.range n, (s (i + 1) ^ 3 - s i * s (i + 1) ^ 2) = c) : ∀ i ∈ Finset.range n, s (i + 1) ^ 3 - s i * s (i + 1) ^ 2 > s (i + 1) ^ 3 / 3 - s i ^ 3 / 3 :=
  by
  --  intro i hi
  have h₄₂ : s i < s (i + 1) := h₁.lt_iff_lt.mpr (by simp)
  have h₄₃ : 0 ≤ s i := by sorry
  have h₄₅ : 0 ≤ s (i + 1) := by sorry
  --  nlinarith [sq_nonneg (s (i + 1) - s i), sq_nonneg (s (i + 1) + s i), mul_nonneg h₄₃ (sq_nonneg (s (i + 1) - s i)),
  --    mul_nonneg h₄₃ (sq_nonneg (s (i + 1) + s i))]
  hole
theorem h₅₁ (c : ℝ) (s : ℕ → ℝ) (h₀ : s 0 = 0) (h₁ : StrictMono s) (n : ℕ) (h₂ : s n = 1) (h₃ : ∑ i ∈ Finset.range n, (s (i + 1) ^ 3 - s i * s (i + 1) ^ 2) = c) (h₄ : c > 1 / 3) : ∀ i ∈ Finset.range n, s (i + 1) ^ 3 - s i * s (i + 1) ^ 2 ≤ s (i + 1) ^ 3 - s i ^ 3 :=
  by
  intro i hi
  have h₅₂ : s i < s (i + 1) := h₁.lt_iff_lt.mpr (by simp)
  have h₅₃ : 0 ≤ s i := by sorry
  have h₅₄ : 0 ≤ s (i + 1) := by sorry
  have h₅₅ : s i * (s (i + 1)) ^ 2 ≥ s i ^ 3 := by sorry
  nlinarith
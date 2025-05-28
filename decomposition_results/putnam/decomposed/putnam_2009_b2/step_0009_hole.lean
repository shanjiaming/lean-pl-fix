theorem h₄₆ (c : ℝ) (s : ℕ → ℝ) (h₀ : s 0 = 0) (h₁ : StrictMono s) (n : ℕ) (h₂ : s n = 1) (h₃ : ∑ i ∈ Finset.range n, (s (i + 1) ^ 3 - s i * s (i + 1) ^ 2) = c) (i : ℕ) (hi : i ∈ Finset.range n) (h₄₂ : s i < s (i + 1)) (h : ¬0 ≤ s i) (h₄₄ : s i < 0) (h₄₅ : s 0 > s i) : s 0 < s (i + 1) := by
  have h₄₆₁ : s i < s (i + 1) := h₁.lt_iff_lt.mpr (by simp)
  --  linarith
  hole
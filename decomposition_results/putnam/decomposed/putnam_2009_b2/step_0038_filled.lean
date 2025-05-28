theorem h₅₄₅ (c : ℝ) (s : ℕ → ℝ) (h₀ : s 0 = 0) (h₁ : StrictMono s) (n : ℕ) (h₂ : s n = 1) (h₃ : ∑ i ∈ Finset.range n, (s (i + 1) ^ 3 - s i * s (i + 1) ^ 2) = c) (h₄ : c > 1 / 3) (i : ℕ) (hi : i ∈ Finset.range n) (h₅₂ : s i < s (i + 1)) (h₅₃ : 0 ≤ s i) (h₅₄₁ : s (i + 1) < 0) (h₅₄₂ : s 0 > s (i + 1)) : s 0 < s (i + 1 + 1) :=
  by
  have h₅₄₅₁ : s (i + 1) < s (i + 1 + 1) := h₁.lt_iff_lt.mpr (by simp)
  --  linarith
  linarith
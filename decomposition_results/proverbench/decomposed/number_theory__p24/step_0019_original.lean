theorem h₅₁₃ (a : ℕ) (d : optParam ℤ (↑a ^ 2 - 1)) (x y : ℤ) (m : optParam ℤ (x ^ 2 - d * y ^ 2)) (h₀ : |m| < 2 * ↑a + 2) (h₁ : a = 0 ∨ a ≥ 1) (h₂ : a = 0 → ∃ k, k ^ 2 = |m|) (h₃ h₄ : a ≥ 1) (h₅ : |m| < 2 * ↑a + 2) (h₅₂ : |m| ≠ 0) (h₅₃ : |m| < 2 * ↑a + 2) (h₅₄ : a ≥ 1) (h₅₅ : m ≠ 0) (h₅₈ : sorry > 0) (h₅₉ : a ≥ 1) (h₅₁₀ : sorry < 2 * a + 2) (h₅₁₁ : a ≥ 1) (h₅₁₂ : sorry < 2 * a + 2) : False := by
  have h₅₁₄ : (a : ℕ) ≥ 1 := h₄
  have h₅₁₅ : (|m| : ℕ) < 2 * a + 2 := h₅₁₀
  have h₅₁₆ : (a : ℕ) ≥ 1 := h₄
  have h₅₁₇ : (|m| : ℕ) < 2 * a + 2 := h₅₁₀
  simp_all [Nat.lt_succ_iff] <;> ring_nf at * <;> omega
theorem h₁₃ (x : ℝ) (a b c : ℕ) (h₀ : 0 < a ∧ 0 < b ∧ 0 < c ∧ 0 ≤ x) (h₁ : 2 * x ^ 2 = 4 * x + 9) (h₂ : x = (↑a + √↑b) / ↑c) (h₃ : c = 2) (h₄ : x = (↑a + √↑b) / 2) (h₅ : 2 * x ^ 2 = 4 * x + 9) (h₆ : ↑a > 0) (h₇ : ↑b > 0) (h₈ : 2 > 0) (h₉ : ↑a ^ 2 + ↑b + 2 * ↑a * √↑b = 4 * ↑a + 4 * √↑b + 18) (h₁₀ : (2 * ↑a - 4) ^ 2 * ↑b = (4 * ↑a + 18 - ↑a ^ 2 - ↑b) ^ 2) (h₁₁ : a = 2) (h₁₂ : b = 22) : a + b + c = 26 := by
  have h₁₄ : a = 2 := h₁₁
  have h₁₅ : b = 22 := h₁₂
  have h₁₆ : c = 2 := h₃
  --  rw [h₁₄, h₁₅, h₁₆] <;> norm_num <;> (try omega) <;> (try nlinarith)
  linarith
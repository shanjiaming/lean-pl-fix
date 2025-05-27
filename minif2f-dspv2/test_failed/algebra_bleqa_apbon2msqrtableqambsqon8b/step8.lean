theorem h₁₀₄ (a b : ℝ) (h₀ : 0 < a ∧ 0 < b) (h₁ : b ≤ a) (h₂ : 0 < a) (h₃ : 0 < b) (x : ℝ := √a) (h₄ : 0 < x) (y : ℝ := √b) (h₅ : 0 < y) (h₆ : y ≤ x) (h₇ : x ≥ y) (h₈ : 0 < y) (h₉ : 0 < x) (h₁₀₁ : a = x ^ 2) (h₁₀₂ : b = y ^ 2) (h₁₀₃ : √(x ^ 2 * y ^ 2) = x * y) : (x ^ 2 + y ^ 2) / 2 - √(x ^ 2 * y ^ 2) = (x - y) ^ 2 / 2 :=
  by
  rw [h₁₀₃]
  ring_nf <;> field_simp <;> ring_nf <;> nlinarith [sq_nonneg (x - y)]
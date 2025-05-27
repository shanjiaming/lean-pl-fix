theorem h₅₁₀ (a b c : ℝ) (h₀ : 0 < a ∧ 0 < b ∧ 0 < c) (h₁ : 3 ≤ a * b + b * c + c * a) (h₂ : a + b + c ≥ 3) (h₃ : ∀ (x y : ℝ), 0 < x → 0 < y → √(x + y) ≤ (x + y + 2) / (2 * √2)) (h₄ : a / √(a + b) ≥ 2 * √2 * a / (a + b + 2)) (h₅₁ : 0 < b) (h₅₂ : 0 < c) (h₅₃ : 0 < b + c) (h₅₄ : 0 < √(b + c)) (h₅₅ : √(b + c) ≤ (b + c + 2) / (2 * √2)) (h₅₇ : 0 < (b + c + 2) / (2 * √2)) (h₅₈ : 0 < √(b + c)) (h₅₉ : √(b + c) ≤ (b + c + 2) / (2 * √2)) : b / √(b + c) ≥ b / ((b + c + 2) / (2 * √2)) :=
  by
  apply (div_le_div_iff (by positivity) (by positivity)).mpr
  nlinarith [Real.sqrt_nonneg (b + c), Real.sq_sqrt (show 0 ≤ b + c by positivity), Real.sqrt_nonneg 2,
    Real.sq_sqrt (show 0 ≤ 2 by norm_num)]
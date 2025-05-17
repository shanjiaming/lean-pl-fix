theorem h₆₁₀ (a b c : ℝ) (h₀ : 0 < a ∧ 0 < b ∧ 0 < c) (h₁ : 3 ≤ a * b + b * c + c * a) (h₂ : a + b + c ≥ 3) (h₃ : ∀ (x y : ℝ), 0 < x → 0 < y → √(x + y) ≤ (x + y + 2) / (2 * √2)) (h₄ : a / √(a + b) ≥ 2 * √2 * a / (a + b + 2)) (h₅ : b / √(b + c) ≥ 2 * √2 * b / (b + c + 2)) (h₆₁ : 0 < c) (h₆₂ : 0 < a) (h₆₃ : 0 < c + a) (h₆₄ : 0 < √(c + a)) (h₆₅ : √(c + a) ≤ (c + a + 2) / (2 * √2)) (h₆₇ : 0 < (c + a + 2) / (2 * √2)) (h₆₈ : 0 < √(c + a)) (h₆₉ : √(c + a) ≤ (c + a + 2) / (2 * √2)) : c / √(c + a) ≥ c / ((c + a + 2) / (2 * √2)) :=
  by
  apply (div_le_div_iff (by positivity) (by positivity)).mpr
  nlinarith [Real.sqrt_nonneg (c + a), Real.sq_sqrt (show 0 ≤ c + a by positivity), Real.sqrt_nonneg 2,
    Real.sq_sqrt (show 0 ≤ 2 by norm_num)]
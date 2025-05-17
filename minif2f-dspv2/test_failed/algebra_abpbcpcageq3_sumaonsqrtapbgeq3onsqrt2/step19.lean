theorem h₄₁₀ (a b c : ℝ) (h₀ : 0 < a ∧ 0 < b ∧ 0 < c) (h₁ : 3 ≤ a * b + b * c + c * a) (h₂ : a + b + c ≥ 3) (h₃ : ∀ (x y : ℝ), 0 < x → 0 < y → √(x + y) ≤ (x + y + 2) / (2 * √2)) (h₄₁ : 0 < a) (h₄₂ : 0 < b) (h₄₃ : 0 < a + b) (h₄₄ : 0 < √(a + b)) (h₄₅ : √(a + b) ≤ (a + b + 2) / (2 * √2)) (h₄₇ : 0 < (a + b + 2) / (2 * √2)) (h₄₈ : 0 < √(a + b)) (h₄₉ : √(a + b) ≤ (a + b + 2) / (2 * √2)) : a / √(a + b) ≥ a / ((a + b + 2) / (2 * √2)) :=
  by
  apply (div_le_div_iff (by positivity) (by positivity)).mpr
  nlinarith [Real.sqrt_nonneg (a + b), Real.sq_sqrt (show 0 ≤ a + b by positivity), Real.sqrt_nonneg 2,
    Real.sq_sqrt (show 0 ≤ 2 by norm_num)]
theorem h₁₀ (a b : ℝ) (h₁ : |a + b| ≤ |a| + |b|) (x y : ℝ) (hx : 0 ≤ x) (hxy : x ≤ y) (h₃ : 0 ≤ x) (h₄ : x ≤ y) (h₅ : 0 ≤ y) (h₆ : 0 ≤ 1 + x) (h₇ : 0 ≤ 1 + y) (h₈ : 0 < 1 + x) (h₉ : 0 < 1 + y) : x / (1 + x) ≤ y / (1 + y) :=
  by
  rw [div_le_div_iff (by positivity) (by positivity)]
  nlinarith [mul_nonneg h₃ (sub_nonneg.mpr h₄), mul_nonneg h₅ h₃, mul_nonneg h₅ (sub_nonneg.mpr h₄)]
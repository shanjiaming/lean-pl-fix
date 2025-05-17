theorem h₁₀ (a b : ℝ) (h₀ : 0 < a ∧ 0 < b) (h₁ : a ≠ b) (h₂ : a - 1 / a = 1) (h₃ : |b - 1 / b| = 1) (h₄ : a ≥ 1) (h₅ : a - 1 / a ≥ 0) (h₆ : |a - 1 / a| = a - 1 / a) (h₇ : a - 1 / a = 1) (h₈ : a > 0) (h₉ : a ≠ 0) : a ^ 2 - a - 1 = 0 := by
  field_simp [h₉] at h₇
  nlinarith
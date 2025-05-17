theorem h₈₇ (a b : ℝ) (h₀ : 0 < a ∧ 0 < b) (h₁ : a ≠ b) (h₂ : |a - 1 / a| = 1) (h₃ : |b - 1 / b| = 1) (h₄ : a ≥ 1 → a = (1 + √5) / 2) (h₅ : a < 1 → a = (-1 + √5) / 2) (h₆ : b ≥ 1 → b = (1 + √5) / 2) (h₇ h₈₁ : b < 1) (h₈₂ : 0 < b) (h₈₅ : b < 1) (h₈₆ : 0 < b) : 1 / b > 1 := by
  rw [gt_iff_lt]
  rw [lt_div_iff h₈₆]
  nlinarith
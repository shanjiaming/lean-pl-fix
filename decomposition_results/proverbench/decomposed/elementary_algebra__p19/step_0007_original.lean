theorem h₂₃ (a b c s : ℝ) (h₁ : a ^ 2 * (s - a) + b ^ 2 * (s - b) + c ^ 2 * (s - c) = s * (a ^ 2 + b ^ 2 + c ^ 2) - (a ^ 3 + b ^ 3 + c ^ 3)) (h₂₁ : a = 0) (h₂₂ : b = 0) : c = 0 := by
  by_contra h₂₃
  by_contra h₂₄
  by_contra h₂₅
  have h₂₆ := h₁
  have h₂₇ : c ≠ 0 := h₂₃
  have h₂₈ : a ≠ 0 := by
    by_contra h₂₈
    simp_all <;> nlinarith
  have h₂₉ : b ≠ 0 := by
    by_contra h₂₉
    simp_all <;> nlinarith
  have h₃₀ := h₁
  have h₃₁ : a ^ 2 * (s - a) + b ^ 2 * (s - b) + c ^ 2 * (s - c) ≤ (3 / 2) * a * b * c := by
    nlinarith [sq_pos_of_ne_zero h₂₈, sq_pos_of_ne_zero h₂₉, sq_pos_of_ne_zero h₂₇, sq_nonneg (a - b),
      sq_nonneg (b - c), sq_nonneg (c - a)]
  nlinarith [sq_pos_of_ne_zero h₂₈, sq_pos_of_ne_zero h₂₉, sq_pos_of_ne_zero h₂₇, sq_nonneg (a - b), sq_nonneg (b - c),
    sq_nonneg (c - a)]
theorem h₂₂ (a b c s : ℝ) (h₁ : a ^ 2 * (s - a) + b ^ 2 * (s - b) + c ^ 2 * (s - c) = s * (a ^ 2 + b ^ 2 + c ^ 2) - (a ^ 3 + b ^ 3 + c ^ 3)) (h₂₁ : a = 0) : b = 0 := by
  --  by_contra h₂₂
  --  by_contra h₂₃
  --  by_contra h₂₄
  have h₂₅ := h₁
  have h₂₆ : b ≠ 0 := h₂₂
  have h₂₇ : a ≠ 0 := by
    by_contra h₂₇
    simp_all <;> nlinarith
  have h₂₈ : c ≠ 0 := h₂₃
  have h₂₉ := h₁
  have h₃₀ : a ^ 2 * (s - a) + b ^ 2 * (s - b) + c ^ 2 * (s - c) ≤ (3 / 2) * a * b * c := by
    nlinarith [sq_pos_of_ne_zero h₂₇, sq_pos_of_ne_zero h₂₆, sq_pos_of_ne_zero h₂₈, sq_nonneg (a - b),
      sq_nonneg (b - c), sq_nonneg (c - a)]
  --  nlinarith [sq_pos_of_ne_zero h₂₇, sq_pos_of_ne_zero h₂₆, sq_pos_of_ne_zero h₂₈, sq_nonneg (a - b), sq_nonneg (b - c),
  --    sq_nonneg (c - a)]
  hole
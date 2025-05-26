theorem h₂₁ (a b c s : ℝ) (h₁ : a ^ 2 * (s - a) + b ^ 2 * (s - b) + c ^ 2 * (s - c) = s * (a ^ 2 + b ^ 2 + c ^ 2) - (a ^ 3 + b ^ 3 + c ^ 3)) : a = 0 := by
  --  by_contra h₂₁
  --  by_contra h₂₂
  --  by_contra h₂₃
  have h₂₄ := h₁
  have h₂₅ : a ≠ 0 := h₂₁
  have h₂₆ : b ≠ 0 := h₂₂
  have h₂₇ : c ≠ 0 := h₂₃
  have h₂₈ := h₁
  have h₂₉ := h₁
  have h₃₀ : a ^ 2 * (s - a) + b ^ 2 * (s - b) + c ^ 2 * (s - c) ≤ (3 / 2) * a * b * c := by sorry
  --  nlinarith [sq_pos_of_ne_zero h₂₅, sq_pos_of_ne_zero h₂₆, sq_pos_of_ne_zero h₂₇, sq_nonneg (a - b), sq_nonneg (b - c),
  --    sq_nonneg (c - a)]
  hole
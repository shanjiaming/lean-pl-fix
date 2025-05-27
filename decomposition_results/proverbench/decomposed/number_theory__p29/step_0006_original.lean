theorem h₉ (d : ℤ) (x y : ℚ) (h : x ≠ 1) (h₁ : x ^ 2 - ↑d * y ^ 2 = 1) (h₂ : x ≠ 1) (h₄ : y = 0) (h₅ : x ^ 2 - ↑d * y ^ 2 = 1) (h₆ h₈ : x ^ 2 = 1) : x = 1 ∨ x = -1 := by
  apply or_iff_not_imp_left.mpr
  intro h₁₀
  apply eq_of_sub_eq_zero
  apply mul_left_cancel₀ (sub_ne_zero.mpr h₁₀)
  nlinarith
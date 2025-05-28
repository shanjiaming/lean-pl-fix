theorem mathd_algebra_388 (x y z : ℝ) (h₀ : 3 * x + 4 * y - 12 * z = 10) (h₁ : -2 * x - 3 * y + 9 * z = -4) : x = 14 :=
  by
  have h₂ : 9 * x + 12 * y - 36 * z = 30 := by sorry
  have h₃ : -8 * x - 12 * y + 36 * z = -16 := by sorry
  have h₄ : x = 14 := by sorry
  --  exact h₄
  linarith
theorem amc12a_2020_p15 (a b : ℂ) (h₀ : a ^ 3 - 8 = 0) (h₁ : b ^ 3 - 8 * b ^ 2 - 8 * b + 64 = 0) : (a - b).abs ≤ 2 * √21 :=
  by
  have h₂ : Complex.abs a = 2 := by sorry
  have h₃ : b = 8 ∨ b ^ 2 = 8 := by sorry
  have h₄ : Complex.abs (a - b) ≤ 2 * Real.sqrt 21 := by sorry
  exact h₄
theorem h₄₁ (z : ℂ) (h₀ : 12 * Complex.normSq z = 2 * Complex.normSq (z + 2) + Complex.normSq (z ^ 2 + 1) + 31) (h₁ : z.re = -1) (h₂ : z.re * z.re + z.im * z.im = 6) (h₃ : z ≠ 0) : z.im = √5 ∨ z.im = -√5 :=
  by
  have h₄₂ : z.im * z.im = 5 := by sorry
  have h₄₃ : z.im = Real.sqrt 5 ∨ z.im = -Real.sqrt 5 := by sorry
  --  exact h₄₃
  simpa
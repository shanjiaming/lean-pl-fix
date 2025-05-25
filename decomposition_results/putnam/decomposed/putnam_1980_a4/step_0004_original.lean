theorem h₂ (abcvals : ℤ → ℤ → ℤ → Prop) (habcvals : ∀ (a b c : ℤ), abcvals a b c ↔ (a = 0 ∧ b = 0 ∧ c = 0) ∧ |a| < 1000000 ∧ |b| < 1000000 ∧ |c| < 1000000) (h₁ : abcvals 0 0 0) : |0 + 0 * √2 + 0 * √3| < 10 ^ (-11) :=
  by
  have h₃ : (10 : ℝ) ^ (-(11 : ℝ)) > 0 := by sorry
  have h₄ : |(0 : ℝ) + (0 : ℝ) * Real.sqrt 2 + (0 : ℝ) * Real.sqrt 3| = 0 := by sorry
  rw [h₄]
  linarith
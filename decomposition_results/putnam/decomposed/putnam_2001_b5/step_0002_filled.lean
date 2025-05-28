theorem h₁ (a b : ℝ) (g : ℝ → ℝ) (abint : 0 < a ∧ a < 1 / 2 ∧ 0 < b ∧ b < 1 / 2) (gcont : Continuous g) (hg : ∀ (x : ℝ), g (g x) = a * g x + b * x) : 0 < a := by -- linarith
  linarith
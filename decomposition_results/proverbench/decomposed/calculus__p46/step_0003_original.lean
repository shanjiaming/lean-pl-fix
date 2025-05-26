theorem h₂ (x : ℝ) (h₁ : False) : ∫ (x : ℝ), √(x - 5) = 2 / 3 * (x - 5) ^ (3 / 2) + sorry :=
  by
  exfalso
  exact h₁
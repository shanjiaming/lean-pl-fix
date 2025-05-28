theorem h₅ (a b : ℝ) (h₁ : |a + b| ≤ |a| + |b|) (h₂ : ∀ (x y : ℝ), 0 ≤ x → x ≤ y → x / (1 + x) ≤ y / (1 + y)) (h₄ : 0 ≤ |a + b|) : 0 ≤ |a| + |b| := by -- positivity
  linarith
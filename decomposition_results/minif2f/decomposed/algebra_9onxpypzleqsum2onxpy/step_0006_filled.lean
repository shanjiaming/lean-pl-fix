theorem h₅ (x y z : ℝ) (h₀ : 0 < x ∧ 0 < y ∧ 0 < z) (h₁ : 0 < x + y) (h₂ : 0 < y + z) (h₃ : 0 < z + x) (h₄ : 0 < x + y + z) : 0 < (x + y) * (y + z) * (z + x) := by -- positivity
  positivity
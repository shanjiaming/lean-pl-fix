theorem h₀ (p : ℝ) (hp : p ≠ -1) : ∫ (x : ℝ) in 0 ..1, x ^ p = (1 ^ (p + 1) - 0 ^ (p + 1)) / (p + 1) :=
  by
  have h₁ : (∫ x in (0 : ℝ)..1, (x : ℝ) ^ p) = (1 ^ (p + 1) - 0 ^ (p + 1)) / (p + 1) := by sorry
  exact h₁
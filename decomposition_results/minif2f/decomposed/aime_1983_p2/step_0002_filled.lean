theorem h₃ (x p : ℝ) (f : ℝ → ℝ) (h₀ : 0 < p ∧ p < 15) (h₁ : p ≤ x ∧ x ≤ 15) (h₂ : f x = |x - p| + |x - 15| + |x - p - 15|) : x - p ≥ 0 := by
  have h₃₁ : p ≤ x := h₁.1
  --  linarith
  linarith
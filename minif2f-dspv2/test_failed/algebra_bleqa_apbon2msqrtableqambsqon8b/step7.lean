theorem h₁₀₃ (a b : ℝ) (h₀ : 0 < a ∧ 0 < b) (h₁ : b ≤ a) (h₂ : 0 < a) (h₃ : 0 < b) (x : ℝ := √a) (h₄ : 0 < x) (y : ℝ := √b) (h₅ : 0 < y) (h₆ : y ≤ x) (h₇ : x ≥ y) (h₈ : 0 < y) (h₉ : 0 < x) (h₁₀₁ : a = x ^ 2) (h₁₀₂ : b = y ^ 2) : √(x ^ 2 * y ^ 2) = x * y :=
  by
  rw [Real.sqrt_eq_iff_sq_eq (by positivity) (by positivity)]
  nlinarith
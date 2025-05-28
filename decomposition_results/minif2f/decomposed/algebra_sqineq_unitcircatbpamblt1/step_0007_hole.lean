theorem h₆ (a b : ℝ) (h₀ : a ^ 2 + b ^ 2 = 1) (h₁ : a ^ 2 ≤ 1) (h₂ : b ^ 2 ≤ 1) (h₃ : 1 - a ≥ 0) (h₄ : 1 + b ≥ 0) (h₅ : (1 - a) * (1 + b) ≥ 0) : a * b + (a - b) ≤ 1 :=
  by
  have h₇ : (1 - a) * (1 + b) = 1 - a + b - a * b := by sorry
  have h₈ : 1 - a + b - a * b ≥ 0 := by sorry
  --  nlinarith [h₈]
  hole
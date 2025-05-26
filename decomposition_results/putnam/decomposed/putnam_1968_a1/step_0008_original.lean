theorem h₅₁ (x : ℝ) (hx : x ∈ Set.uIcc 0 1) (h₂ : x ∈ Set.Icc 0 1) (h₃ : 0 ≤ x) (h₄ : x ≤ 1) : x ^ 4 * (1 - x) ^ 4 = x ^ 8 - 4 * x ^ 7 + 6 * x ^ 6 - 4 * x ^ 5 + x ^ 4 := by
  ring_nf <;> nlinarith
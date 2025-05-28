theorem h₃₁₃ (x y : ℕ) (h₀ : x + y = 17402) (h₁ : 10 ∣ x) (h₂ : x / 10 = y) (h₃₁₁ : 10 ∣ x) : x = 10 * (x / 10) :=
  by
  have h₃₁₄ : x / 10 * 10 = x := by sorry
  --  omega
  linarith
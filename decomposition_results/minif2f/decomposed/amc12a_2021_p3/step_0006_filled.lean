theorem h₃₁₄ (x y : ℕ) (h₀ : x + y = 17402) (h₁ : 10 ∣ x) (h₂ : x / 10 = y) (h₃₁₁ : 10 ∣ x) : x / 10 * 10 = x := by -- apply Nat.div_mul_cancel h₁
  omega
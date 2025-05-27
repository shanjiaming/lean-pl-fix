theorem h₃ (b : ℤ) (hb : b ∈ B) (hneg : b < 0) (h_main : ∃ k, b = -44 + 5 * k) (k : ℤ) (hk h₁ : b = -44 + 5 * k) (h₂ : b < 0) : -44 + 5 * k < 0 := by -- linarith
  linarith
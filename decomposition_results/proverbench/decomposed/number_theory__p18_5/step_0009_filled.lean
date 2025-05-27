theorem h₆ (b : ℤ) (hb : b ∈ B) (hneg : b < 0) (h_main : ∃ k, b = -44 + 5 * k) (k : ℤ) (hk h₁ : b = -44 + 5 * k) (h₂ : b < 0) (h₃ : -44 + 5 * k < 0) (h₄ : 5 * k < 44) (h : ¬k ≤ 8) : k ≥ 9 := by
  --  by_contra h₆
  have h₇ : k ≤ 8 := by sorry
  --  omega
  linarith
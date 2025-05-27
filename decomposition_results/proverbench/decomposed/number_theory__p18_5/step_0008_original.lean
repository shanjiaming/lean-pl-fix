theorem h₅ (b : ℤ) (hb : b ∈ B) (hneg : b < 0) (h_main : ∃ k, b = -44 + 5 * k) (k : ℤ) (hk h₁ : b = -44 + 5 * k) (h₂ : b < 0) (h₃ : -44 + 5 * k < 0) (h₄ : 5 * k < 44) : k ≤ 8 := by
  by_contra h
  have h₆ : k ≥ 9 := by sorry
  have h₇ : 5 * k ≥ 45 := by sorry
  have h₈ : -44 + 5 * k ≥ 1 := by sorry
  linarith
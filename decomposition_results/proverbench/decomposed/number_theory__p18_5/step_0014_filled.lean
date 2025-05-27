theorem h₄ (b : ℤ) (hb : b ∈ B) (hneg : b < 0) (h_main : ∃ k, b = -44 + 5 * k) (h_k_le_8 : ∀ (k : ℤ), b = -44 + 5 * k → k ≤ 8) (k : ℤ) (hk : b = -44 + 5 * k) (h₂ : k ≤ 8) (h₃ : b = -44 + 5 * k) : b ≤ -4 := by
  have h₅ : k ≤ 8 := h₂
  have h₆ : 5 * k ≤ 40 := by sorry
  have h₇ : -44 + 5 * k ≤ -4 := by sorry
  --  linarith
  linarith
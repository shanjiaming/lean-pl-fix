theorem h_final (b : ℤ) (hb : b ∈ B) (hneg : b < 0) (h_main : ∃ k, b = -44 + 5 * k) (h_k_le_8 : ∀ (k : ℤ), b = -44 + 5 * k → k ≤ 8) : b ≤ -4 := by
  have h₁ : ∃ (k : Int), b = -44 + 5 * k := h_main
  obtain ⟨k, hk⟩ := h₁
  have h₂ : k ≤ 8 := h_k_le_8 k hk
  have h₃ : b = -44 + 5 * k := hk
  have h₄ : b ≤ -4 := by sorry
  exact h₄
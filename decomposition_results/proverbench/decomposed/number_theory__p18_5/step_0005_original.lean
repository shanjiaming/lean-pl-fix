theorem h_k_le_8 (b : ℤ) (hb : b ∈ B) (hneg : b < 0) (h_main : ∃ k, b = -44 + 5 * k) : ∀ (k : ℤ), b = -44 + 5 * k → k ≤ 8 :=
  by
  intro k hk
  have h₁ : b = -44 + 5 * k := hk
  have h₂ : b < 0 := hneg
  have h₃ : -44 + 5 * k < 0 := by sorry
  have h₄ : 5 * k < 44 := by sorry
  have h₅ : k ≤ 8 := by sorry
  exact h₅
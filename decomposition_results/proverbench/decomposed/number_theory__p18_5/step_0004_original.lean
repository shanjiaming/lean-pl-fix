theorem h₃ (b : ℤ) (hb : b ∈ B) (hneg : b < 0) (h₁ : b ∈ B) (h₂ : b ∈ B ↔ ∃ k, b = -44 + 5 * k) : ∃ k, b = -44 + 5 * k := by
  rw [h₂] at h₁
  exact h₁
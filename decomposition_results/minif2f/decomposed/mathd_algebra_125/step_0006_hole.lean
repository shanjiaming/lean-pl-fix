theorem h₄ (x y : ℕ) (h₀ : 0 < x ∧ 0 < y) (h₁ : 5 * x = y) (h₂ : ↑x - 3 + (↑y - 3) = 30) (h₃ : ↑x + ↑y = 36) : x + y = 36 := by -- norm_cast at h₃ ⊢ <;> omega
  hole
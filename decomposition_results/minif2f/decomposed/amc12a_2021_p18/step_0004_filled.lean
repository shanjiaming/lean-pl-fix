theorem h₂₃ (f : ℚ → ℝ) (h₀ : ∀ x > 0, ∀ y > 0, f (x * y) = f x + f y) (h₁ : ∀ (p : ℕ), Nat.Prime p → f ↑p = ↑p) (h₂₁ h₂₂ : f (1 * 1) = f 1 + f 1) : f (1 * 1) = f 1 := by -- norm_num
  norm_num
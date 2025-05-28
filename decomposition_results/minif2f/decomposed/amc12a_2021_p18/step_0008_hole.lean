theorem h₃₁ (f : ℚ → ℝ) (h₀ : ∀ x > 0, ∀ y > 0, f (x * y) = f x + f y) (h₁ : ∀ (p : ℕ), Nat.Prime p → f ↑p = ↑p) (h₂ : f 1 = 0) : Nat.Prime 5 := by -- decide
  hole
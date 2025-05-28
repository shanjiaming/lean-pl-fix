theorem h₃ (f : ℚ → ℝ) (h₀ : ∀ x > 0, ∀ y > 0, f (x * y) = f x + f y) (h₁ : ∀ (p : ℕ), Nat.Prime p → f ↑p = ↑p) (h₂ : f 1 = 0) : f 5 = 5 := by
  have h₃₁ : Nat.Prime 5 := by sorry
  have h₃₂ : f (5 : ℚ) = (5 : ℝ) := by sorry
  --  exact h₃₂
  hole
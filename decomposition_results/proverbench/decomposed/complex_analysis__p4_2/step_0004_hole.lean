theorem h₂ (n : ℕ) (h₀ : I ^ 4 = 1) (h₁ : ∀ (k : ℕ), I ^ (4 * k) = 1) : I ^ n = I ^ (n % 4) :=
  by
  have h₃ : I ^ n = I ^ (n % 4) := by sorry
  --  exact h₃
  hole
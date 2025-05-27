theorem i_pow_mod_4 (n : ℕ) : I ^ n = I ^ (n % 4) :=
  by
  have h₀ : I ^ 4 = 1 := by sorry
  have h₁ : ∀ (k : ℕ), I ^ (4 * k) = 1 := by sorry
  have h₂ : I ^ n = I ^ (n % 4) := by sorry
  exact h₂
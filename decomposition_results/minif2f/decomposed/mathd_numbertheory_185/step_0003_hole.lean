theorem h₂ (n : ℕ) (h₀ : n % 5 = 3) (h₁ : 2 * n % 5 = 2 * (n % 5) % 5) : 2 * n % 5 = 2 * 3 % 5 := by -- -- rw [h₁] <;> rw [h₀] <;> norm_num <;> rfl
  hole
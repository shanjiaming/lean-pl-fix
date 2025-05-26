theorem h₂ (a : ℕ → ℝ) (a0 : a 0 = 5 / 2) (ak : ∀ k ≥ 1, a k = a (k - 1) ^ 2 - 2) (h₁ : a 1 = a 0 ^ 2 - 2) : a 1 = (5 / 2) ^ 2 - 2 := by -- rw [h₁, a0] <;> norm_num
  hole
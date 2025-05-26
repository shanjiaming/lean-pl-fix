theorem h₁ (a : ℕ → ℝ) (a0 : a 0 = 5 / 2) (ak : ∀ k ≥ 1, a k = a (k - 1) ^ 2 - 2) : a 1 = a 0 ^ 2 - 2 := by
  have h₂ := ak 1 (by norm_num)
  --  simpa using h₂
  hole
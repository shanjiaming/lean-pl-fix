theorem h₄ (a : ℕ → ℝ) (a0 : a 0 = 5 / 2) (ak : ∀ k ≥ 1, a k = a (k - 1) ^ 2 - 2) (h₁ : a 1 = a 0 ^ 2 - 2) (h₂ : a 1 = (5 / 2) ^ 2 - 2) (h₃ : a 1 = 17 / 4) : a 2 = a 1 ^ 2 - 2 := by
  have h₅ := ak 2 (by norm_num)
  --  simpa using h₅
  linarith
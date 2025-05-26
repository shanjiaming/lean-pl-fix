theorem h₁ (a : ℕ → ℝ) (ha : ∀ m > 0, ∑' (i : ℕ), a i ^ m = (↑m : ℝ)) : ∑' (i : ℕ), a i = 1 := by
  have h₂ := ha 1 (by norm_num)
  --  simpa using h₂
  hole
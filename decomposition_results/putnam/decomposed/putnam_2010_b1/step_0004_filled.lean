theorem h₂ (a : ℕ → ℝ) (ha : ∀ m > 0, ∑' (i : ℕ), a i ^ m = (↑m : ℝ)) (h₁ : ∑' (i : ℕ), a i = 1) : ∑' (i : ℕ), a i ^ 2 = 2 := by
  have h₃ := ha 2 (by norm_num)
  --  simpa using h₃
  hole
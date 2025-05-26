theorem h_pos (x : ℕ → ℝ) (hx0 : x 0 = 1) (hxn : ∀ (n : ℕ), x (n + 1) = Real.log (rexp (x n) - x n)) : ∀ (n : ℕ), rexp (x n) - x n > 0 := by
  intro n
  have h₁ : Real.exp (x n) > x n := by sorry
  linarith
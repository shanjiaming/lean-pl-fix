theorem h_pos (a : ℕ → ℚ) (ha : a 0 = 1 ∧ ∀ (n : ℕ), a (2 * n + 1) = a n ∧ a (2 * n + 2) = a n + a (n + 1)) : ∀ (n : ℕ), a n > 0 := by
  intro n
  have h₁ : a n > 0 := by sorry
  exact h₁
theorem h₁ (a : ℕ → ℚ) (ha : a 0 = 1 ∧ ∀ (n : ℕ), a (2 * n + 1) = a n ∧ a (2 * n + 2) = a n + a (n + 1)) (n : ℕ) : a n > 0 :=
  by
  have h₂ : ∀ n, a n > 0 := by sorry
  exact h₂ n
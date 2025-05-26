theorem h₁ (u : ℕ → ℝ) (hubase : u 0 = 1 ∧ u 1 = 1 ∧ u 2 = 1) (hudet : ∀ (n : ℕ), (Matrix.det fun i j => u (n + (↑i : ℕ) * 2 + (↑j : ℕ))) = sorry) : ∀ (n : ℕ), u n ≥ 1 := by
  intro n
  have h₂ : ∀ n : ℕ, u n ≥ 1 := by sorry
  exact h₂ n
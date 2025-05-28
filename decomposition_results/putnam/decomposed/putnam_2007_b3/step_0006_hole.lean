theorem h2₁ (x : ℕ → ℝ) (hx0 : x 0 = 1) (hx : ∀ (n : ℕ), x (n + 1) = 3 * x n + ↑⌊x n * √5⌋) (h1 : x 1 = 5) : x 2 = 3 * x 1 + ↑⌊x 1 * √5⌋ := by -- rw [hx] <;> simp [h1]
  hole
theorem h₄ (a b : ℕ → ℝ) (h₀ : ∀ (n : ℕ), a (n + 1) = √3 * a n - b n) (h₁ : ∀ (n : ℕ), b (n + 1) = √3 * b n + a n) (h₂ : a 100 = 2) (h₃ : b 100 = 4) : ∀ (n : ℕ), a (n + 3) = -8 * b n := by
  --  intro n
  have h₄₁ : a (n + 3) = -8 * b n := by sorry
  --  exact h₄₁ <;> simp_all <;> linarith
  hole
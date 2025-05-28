theorem h₅ (a b : ℕ → ℝ) (h₀ : ∀ (n : ℕ), a (n + 1) = √3 * a n - b n) (h₁ : ∀ (n : ℕ), b (n + 1) = √3 * b n + a n) (h₂ : a 100 = 2) (h₃ : b 100 = 4) (h₄ : ∀ (n : ℕ), a (n + 3) = -8 * b n) : ∀ (n : ℕ), b (n + 3) = 8 * a n := by
  --  intro n
  have h₅₁ : b (n + 3) = 8 * a n := by sorry
  --  exact h₅₁ <;> simp_all <;> linarith
  hole
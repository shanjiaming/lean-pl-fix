theorem h₁ (G : ℝ → ℝ) (hGeq : ∀ (r : ℝ), ∃ m n, G r = |r - √((↑m : ℝ) ^ 2 + 2 * (↑n : ℝ) ^ 2)|) (hGlb : ∀ (r : ℝ) (m n : ℤ), G r ≤ |r - √((↑m : ℝ) ^ 2 + 2 * (↑n : ℝ) ^ 2)|) : sorry :=
  by
  have h₂ : ∀ r : ℝ, G r = 0 := by sorry
  have h₃ : ∀ r : ℝ, G r = 0 := h₂
  have h₄ : Tendsto G atTop (𝓝 0) := by sorry
  --  exact h₄
  hole
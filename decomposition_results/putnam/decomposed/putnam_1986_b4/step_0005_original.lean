theorem h₈ (G : ℝ → ℝ) (hGeq : ∀ (r : ℝ), ∃ m n, G r = |r - √(↑m ^ 2 + 2 * ↑n ^ 2)|) (hGlb : ∀ (r : ℝ) (m n : ℤ), G r ≤ |r - √(↑m ^ 2 + 2 * ↑n ^ 2)|) (r : ℝ) (m n : ℤ) (h₄ : G r = |r - √(↑m ^ 2 + 2 * ↑n ^ 2)|) (h₅ : G r ≤ |r - √(↑m ^ 2 + 2 * ↑n ^ 2)|) (h₆ : G r = |r - √(↑m ^ 2 + 2 * ↑n ^ 2)|) (h₇ : G r ≤ G r) : G r ≥ 0 := by
  rw [h₆]
  exact abs_nonneg _
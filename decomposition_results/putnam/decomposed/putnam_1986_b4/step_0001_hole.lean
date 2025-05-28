theorem putnam_1986_b4 (G : ℝ → ℝ) (hGeq : ∀ (r : ℝ), ∃ m n, G r = |r - √(↑m ^ 2 + 2 * ↑n ^ 2)|) (hGlb : ∀ (r : ℝ) (m n : ℤ), G r ≤ |r - √(↑m ^ 2 + 2 * ↑n ^ 2)|) : Tendsto G atTop (𝓝 0) ↔ True :=
  by
  have h₁ : Tendsto G atTop (𝓝 0) := by sorry
  have h₂ : (Tendsto G atTop (𝓝 0) ↔ ((True) : Prop)) := by sorry
  --  exact h₂
  hole
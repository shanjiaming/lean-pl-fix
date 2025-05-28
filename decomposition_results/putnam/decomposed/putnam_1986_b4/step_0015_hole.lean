theorem h₂ (G : ℝ → ℝ) (hGeq : ∀ (r : ℝ), ∃ m n, G r = |r - √(↑m ^ 2 + 2 * ↑n ^ 2)|) (hGlb : ∀ (r : ℝ) (m n : ℤ), G r ≤ |r - √(↑m ^ 2 + 2 * ↑n ^ 2)|) (h₁ : Tendsto G atTop (𝓝 0)) : Tendsto G atTop (𝓝 0) ↔ True :=
  by
  --  constructor
  --  · intro h
  --    trivial
  --  · intro h
  --    exact h₁
  hole
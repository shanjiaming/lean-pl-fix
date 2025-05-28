theorem h₄ (G : ℝ → ℝ) (hGeq : ∀ (r : ℝ), ∃ m n, G r = |r - √(↑m ^ 2 + 2 * ↑n ^ 2)|) (hGlb : ∀ (r : ℝ) (m n : ℤ), G r ≤ |r - √(↑m ^ 2 + 2 * ↑n ^ 2)|) (h₂ h₃ : ∀ (r : ℝ), G r = 0) : Tendsto G atTop (𝓝 0) :=
  by
  have h₅ : G = fun _ => 0 := by sorry
  rw [h₅]
  simpa using tendsto_const_nhds
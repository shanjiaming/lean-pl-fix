theorem h₂ (x✝ x : ℕ → ℝ) (L : ℝ) (hL : Tendsto x atTop (𝓝 L)) : ∀ᶠ (n : ℕ) in atTop, |x n - L| < 1 :=
  by
  have h₃ : Tendsto x atTop (𝓝 L) := hL
  have h₄ : Tendsto (fun n => x n - L) atTop (𝓝 0) := by sorry
  have h₅ : ∀ᶠ n in atTop, |(x n - L) - 0| < 1 := by sorry
  have h₈ : ∀ᶠ n in atTop, |x n - L| < 1 := by sorry
  exact h₈
  hole
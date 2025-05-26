theorem h₃ (g : ℝ → ℝ) (hg : (x : ℕ) → x > 0 → sorry) (h₁ : sorry) (h₂ : ∀ x > 0, g x / x = (1 + 1 / x) ^ (x + 1)) : sorry :=
  by
  have h₄ : ∀ᶠ (x : ℝ) in atTop, g x / x = (1 + 1 / x : ℝ) ^ (x + 1) := by sorry
  have h₅ : Tendsto (fun x : ℝ => g x / x) atTop (𝓝 (Real.exp 1)) := by sorry
  --  exact h₅
  hole
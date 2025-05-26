theorem h_main (g : ℝ → ℝ) (hg : (x : ℕ) → x > 0 → sorry) : sorry :=
  by
  have h₁ : Tendsto (fun x : ℝ => (1 + 1 / x : ℝ) ^ (x + 1)) atTop (𝓝 (Real.exp 1)) := by sorry
  have h₂ : ∀ (x : ℝ), x > 0 → g x / x = (1 + 1 / x : ℝ) ^ (x + 1) := by sorry
  have h₃ : Tendsto (fun x : ℝ => g x / x) atTop (𝓝 (Real.exp 1)) := by sorry
  --  exact h₃
  hole
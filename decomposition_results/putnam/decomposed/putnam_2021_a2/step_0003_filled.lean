theorem h₁ (g : ℝ → ℝ) (hg : (x : ℕ) → x > 0 → sorry) : sorry :=
  by
  have h₂ : Tendsto (fun x : ℝ => (1 + 1 / x : ℝ) ^ x) atTop (𝓝 (Real.exp 1)) := by sorry
  have h₄ : Tendsto (fun x : ℝ => (1 + 1 / x : ℝ) ^ (x + 1)) atTop (𝓝 (Real.exp 1)) := by sorry
  --  exact h₄
  hole
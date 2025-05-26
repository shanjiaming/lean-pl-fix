theorem h₂ (g : ℝ → ℝ) (hg : (x : ℕ) → x > 0 → sorry) : sorry :=
  by
  have h₃ : Tendsto (fun x : ℝ => (1 + 1 / x : ℝ) ^ x) atTop (𝓝 (Real.exp 1)) := by sorry
  exact h₃
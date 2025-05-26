theorem h₄ (g : ℝ → ℝ) (hg : (x : ℕ) → x > 0 → sorry) (h₂ : sorry) : sorry :=
  by
  have h₅ : Tendsto (fun x : ℝ => (1 + 1 / x : ℝ) ^ (x + 1)) atTop (𝓝 (Real.exp 1)) := by sorry
  --  exact h₅
  hole
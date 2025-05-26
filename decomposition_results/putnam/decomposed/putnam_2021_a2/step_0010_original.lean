theorem h₄ (g : ℝ → ℝ) (hg : (x : ℕ) → x > 0 → sorry) (h₁ : sorry) (x : ℝ) (hx : x > 0) (h₃ : sorry) : g x = (x + 1) ^ (x + 1) / x ^ x :=
  by
  have h₅ : Tendsto (fun r : ℝ => ((x + 1) ^ (r + 1) - x ^ (r + 1)) ^ (1 / r)) (𝓝[>] 0) (𝓝 (g x)) := hg x hx
  have h₆ : g x = (x + 1) ^ (x + 1) / x ^ x := by sorry
  exact h₆
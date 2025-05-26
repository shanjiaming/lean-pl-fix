theorem h₂ (g : ℝ → ℝ) (hg : (x : ℕ) → x > 0 → sorry) (h₁ : sorry) : ∀ x > 0, g x / x = (1 + 1 / x) ^ (x + 1) :=
  by
  intro x hx
  have h₃ : Tendsto (fun r : ℝ => ((x + 1) ^ (r + 1) - x ^ (r + 1)) ^ (1 / r)) (𝓝[>] 0) (𝓝 (g x)) := hg x hx
  have h₄ : g x = (x + 1) ^ (x + 1) / x ^ x := by sorry
  have h₅ : g x / x = (1 + 1 / x : ℝ) ^ (x + 1) := by sorry
  exact h₅
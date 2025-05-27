theorem h₆ (h₁ : Tendsto (fun x => x + 3 * x ^ 3) atTop atTop) (h₃ : ∀ (x : ℝ), sin (2 * x + x ^ 3) / (x + 3 * x ^ 3) = sin (2 * x + x ^ 3) * (1 / (x + 3 * x ^ 3))) (h₄ : Tendsto (fun x => 1 / (x + 3 * x ^ 3)) atTop (𝓝 0)) : ∀ (x : ℝ), |sin (2 * x + x ^ 3)| ≤ 1 := by
  intro x
  exact abs_sin_le_one (2 * x + x ^ 3)
theorem h₅₄ (c : ℝ) (h : ∀ (x : ℝ), (rexp x + rexp (-x)) / 2 ≤ rexp (c * x ^ 2)) (h₁ : ¬c ≥ 1 / 2) (h₂ : c < 1 / 2) (h₄ : 0 < 1 / 2 - c) (h₅ h₅₂ : Filter.Tendsto (fun x => (rexp x + rexp (-x) - 2 * rexp (c * x ^ 2)) / x ^ 2) (𝓝[≠] 0) (𝓝 (1 - 2 * c))) (h₅₃ : 1 - 2 * c > 0) : ∀ᶠ (x : ℝ) in 𝓝[≠] 0, (rexp x + rexp (-x) - 2 * rexp (c * x ^ 2)) / x ^ 2 > 0 :=
  by
  filter_upwards [h₅₂.eventually (gt_mem_nhds h₅₃)] with x hx
  exact hx
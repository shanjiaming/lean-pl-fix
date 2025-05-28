theorem h₂ (xprod : ℝ → ℝ) (hxprod :  ∀ x ∈ Set.Ioo 0 1,    Tendsto (fun N => ∏ n ∈ Finset.range N, ((1 + x ^ (n + 1)) / (1 + x ^ n)) ^ x ^ n) atTop (𝓝 (xprod x))) (h₁ : ∀ᶠ (x : ℝ) in 𝓝[<] 1, x ∈ Set.Ioo 0 1) : Tendsto xprod (𝓝[<] 1) (𝓝 (2 / Real.exp 1)) :=
  by
  have h₃ : ∀ᶠ (x : ℝ) in 𝓝[<] (1 : ℝ), xprod x = 2 / Real.exp 1 := by sorry
  have h₇ : Tendsto xprod (𝓝[<] (1 : ℝ)) (𝓝 (2 / Real.exp 1)) := by sorry
  --  exact h₇
  simpa
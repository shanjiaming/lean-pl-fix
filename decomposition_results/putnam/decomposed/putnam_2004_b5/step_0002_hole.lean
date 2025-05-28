theorem h_target (xprod : ℝ → ℝ) (hxprod :  ∀ x ∈ Set.Ioo 0 1,    Tendsto (fun N => ∏ n ∈ Finset.range N, ((1 + x ^ (n + 1)) / (1 + x ^ n)) ^ x ^ n) atTop (𝓝 (xprod x))) : Tendsto xprod (𝓝[<] 1) (𝓝 (2 / Real.exp 1)) :=
  by
  have h₁ : ∀ᶠ (x : ℝ) in 𝓝[<] (1 : ℝ), x ∈ Set.Ioo 0 1 := by sorry
  have h₂ : Tendsto xprod (𝓝[<] (1 : ℝ)) (𝓝 (2 / Real.exp 1)) := by sorry
  --  exact h₂
  hole
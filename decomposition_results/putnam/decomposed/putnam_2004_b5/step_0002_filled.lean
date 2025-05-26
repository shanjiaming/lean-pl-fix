theorem h_target (xprod : ℝ → ℝ) (hxprod : (x : ℕ) → x ∈ Set.Ioo 0 1 → sorry) : sorry :=
  by
  have h₁ : ∀ᶠ (x : ℝ) in 𝓝[<] (1 : ℝ), x ∈ Set.Ioo 0 1 := by sorry
  have h₂ : Tendsto xprod (𝓝[<] (1 : ℝ)) (𝓝 (2 / Real.exp 1)) := by sorry
  --  exact h₂
  hole
theorem h₂ (xprod : ℝ → ℝ) (hxprod : (x : ℕ) → x ∈ Set.Ioo 0 1 → sorry) (h₁ : ∀ᶠ (x : ℝ) in 𝓝[<] 1, x ∈ Set.Ioo 0 1) : sorry :=
  by
  have h₃ : ∀ᶠ (x : ℝ) in 𝓝[<] (1 : ℝ), xprod x = 2 / Real.exp 1 := by sorry
  have h₇ : Tendsto xprod (𝓝[<] (1 : ℝ)) (𝓝 (2 / Real.exp 1)) := by sorry
  --  exact h₇
  hole
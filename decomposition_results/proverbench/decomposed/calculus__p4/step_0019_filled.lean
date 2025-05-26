theorem h₂₃ (h₀ : sorry) (h₁ : sorry) (h₂₁ : sorry) (h₂₂ : sorry) : (fun x => (cos (2 * x - 6) - 1) / (x ^ 3 - 6 * x ^ 2 + 9 * x)) =ᶠ[𝓝 3] fun x =>
    (cos (2 * x - 6) - 1) / (x - 3) ^ 2 * (1 / x) :=
  by
  have h₂₄ :
    ∀ᶠ (x : ℝ) in 𝓝 3,
      (Real.cos (2 * x - 6) - 1) / (x ^ 3 - 6 * x ^ 2 + 9 * x) =
        ((Real.cos (2 * x - 6) - 1) / (x - 3) ^ 2) * ((1 : ℝ) / x) := by sorry
  --  exact h₂₄
  hole
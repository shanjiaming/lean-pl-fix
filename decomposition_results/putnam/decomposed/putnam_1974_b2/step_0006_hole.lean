theorem h₅ (y : ℝ → ℝ) (ycontdiff : ContDiff ℝ 1 y) (limy h₂ : Tendsto (fun x => deriv y x ^ 2 + y x ^ 3) atTop (𝓝 0)) (ε : ℝ) (hε : 0 < ε) : ∀ᶠ (x : ℝ) in atTop, |deriv y x ^ 2 + y x ^ 3| < ε :=
  by
  have h₅₁ : Tendsto (fun x : ℝ => (deriv y x) ^ 2 + (y x) ^ 3) atTop (𝓝 0) := limy
  have h₅₂ : ∀ᶠ x in atTop, |(deriv y x) ^ 2 + (y x) ^ 3| < ε := by sorry
  --  exact h₅₂
  hole
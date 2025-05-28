theorem h_main  : Tendsto (fun t => ∫ (x : ℝ) in 0 ..t, (arctan (π * x) - arctan x) / x) atTop (𝓝 (π / 2 * log π)) :=
  by
  have h₁ :
    Tendsto (fun t : ℝ ↦ ∫ x in (0)..t, (arctan (Real.pi * x) - arctan x) / x) atTop
      (𝓝 ((Real.pi / 2) * Real.log Real.pi)) := by sorry
  exact h₁
  hole
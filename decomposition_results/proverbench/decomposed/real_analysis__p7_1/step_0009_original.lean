theorem h₄₁ (x : ℝ) (hx : x ∈ Set.Ioo 0 8) (h₁ : 0 < x) (h₂ : x < 8) (h₃ : 8 * x - x ^ 2 > 0) : HasDerivAt (fun x => 8 * x - x ^ 2) (8 - 2 * x) x :=
  by
  have h₄₂ : HasDerivAt (fun x : ℝ => (8 * x - x ^ 2 : ℝ)) (8 - 2 * x) x := by sorry
  exact h₄₂
theorem derivative_f (x : ℝ) : ∀ x ∈ Set.Ioo 0 8, HasDerivAt f (1 / 3 * (8 * x - x ^ 2) ^ (-2 / 3) * (8 - 2 * x)) x :=
  by
  --  intro x hx
  have h₁ : 0 < x := by sorry
  have h₂ : x < 8 := by sorry
  have h₃ : 8 * x - x ^ 2 > 0 := by sorry
  have h₄ : HasDerivAt (fun x : ℝ => (8 * x - x ^ 2 : ℝ)) (8 - 2 * x) x := by sorry
  have h₅ : HasDerivAt f ((1 / 3 : ℝ) * (8 * x - x ^ 2) ^ (-2 / 3 : ℝ) * (8 - 2 * x)) x := by sorry
  --  exact h₅
  hole
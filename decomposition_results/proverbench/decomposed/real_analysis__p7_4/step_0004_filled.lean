theorem h₂ (x : ℝ) (h₁ : 4 ∈ Set.Ioo 0 8) : HasDerivAt f 0 4 :=
  by
  have h₃ : HasDerivAt f ((1 / 3 : ℝ) * (8 * (4 : ℝ) - (4 : ℝ) ^ 2) ^ (-2 / 3 : ℝ) * (8 - 2 * (4 : ℝ))) (4 : ℝ) := by sorry
  have h₄ : (1 / 3 : ℝ) * (8 * (4 : ℝ) - (4 : ℝ) ^ 2) ^ (-2 / 3 : ℝ) * (8 - 2 * (4 : ℝ)) = 0 := by sorry
  have h₅ : HasDerivAt f 0 (4 : ℝ) := by sorry
  --  exact h₅
  simpa
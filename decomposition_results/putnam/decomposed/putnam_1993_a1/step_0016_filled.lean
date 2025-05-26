theorem h₃₂₁ (h₁ : 0 < 4 / 9) (h₂ : 4 / 9 < 4 * √2 / 9) (h₃₁ : ∫ (x : ℝ) in Set.Ioo 0 (√2 / 3), max (4 / 9 - (2 * x - 3 * x ^ 3)) 0 = 0) : ∀ x ∈ Set.Ioo 0 (√6 / 3), max (2 * x - 3 * x ^ 3 - 4 / 9) 0 = 0 :=
  by
  --  intro x hx
  have h₃₂₂ : 0 < x := by sorry
  have h₃₂₃ : x < (Real.sqrt 6) / 3 := by sorry
  have h₃₂₄ : (2 * x - 3 * x ^ 3) - ((4 / 9) : ℝ) ≤ 0 := by sorry
  have h₃₂₅ : (max ((2 * x - 3 * x ^ 3) - ((4 / 9) : ℝ)) 0 : ℝ) = 0 := by sorry
  --  exact h₃₂₅
  hole
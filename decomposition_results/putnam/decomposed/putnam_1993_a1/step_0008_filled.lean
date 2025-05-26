theorem h₃₁₁ (h₁ : 0 < 4 / 9) (h₂ : 4 / 9 < 4 * √2 / 9) : ∀ x ∈ Set.Ioo 0 (√2 / 3), max (4 / 9 - (2 * x - 3 * x ^ 3)) 0 = 0 :=
  by
  --  intro x hx
  have h₃₁₂ : 0 < x := by sorry
  have h₃₁₃ : x < (Real.sqrt 2) / 3 := by sorry
  have h₃₁₄ : (4 / 9 : ℝ) - (2 * x - 3 * x ^ 3) ≤ 0 := by sorry
  have h₃₁₅ : (max (((4 / 9) : ℝ) - (2 * x - 3 * x ^ 3)) 0 : ℝ) = 0 := by sorry
  --  exact h₃₁₅
  hole
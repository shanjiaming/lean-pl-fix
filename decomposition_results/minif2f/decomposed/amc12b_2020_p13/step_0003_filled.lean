theorem h₁₁  : Real.log 6 = Real.log 2 + Real.log 3 :=
  by
  have h₁₁₁ : Real.log 6 = Real.log (2 * 3) := by sorry
  --  rw [h₁₁₁]
  have h₁₁₂ : Real.log (2 * 3) = Real.log 2 + Real.log 3 := by sorry
  --  rw [h₁₁₂]
  linarith
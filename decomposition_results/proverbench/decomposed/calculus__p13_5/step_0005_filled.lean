theorem h₂ (h₁ : HasDerivAt f (8 * √3) (π / 3)) : f (π / 3) = 8 * √3 * (π / 3 - π / 3) + 4 :=
  by
  have h₃ : f (π / 3) = 4 := by sorry
  have h₄ : 8 * Real.sqrt 3 * (π / 3 - π / 3) + 4 = 4 := by sorry
  --  rw [h₃, h₄]
  linarith
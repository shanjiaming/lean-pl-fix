theorem h₃ (h₁ : (√5 * √13) ^ 2 = 65) (h₂ : √65 ^ 2 = 65) : √5 * √13 = √65 :=
  by
  have h₃₁ : 0 ≤ sqrt 5 * sqrt 13 := by sorry
  have h₃₂ : 0 ≤ sqrt 65 := by sorry
  have h₃₃ : (sqrt 5 * sqrt 13) ^ 2 = (sqrt 65) ^ 2 := by sorry
  have h₃₄ : sqrt 5 * sqrt 13 = sqrt 65 := by sorry
  --  exact h₃₄
  linarith
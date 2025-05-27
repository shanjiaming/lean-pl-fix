theorem h₂ (h₁ : (√5 * √13) ^ 2 = 65) : √65 ^ 2 = 65 := by
  have h₂₁ : 0 ≤ sqrt 65 := by sorry
  have h₂₂ : 0 ≤ sqrt 65 := by sorry
  --  calc
  --    (sqrt 65) ^ 2 = 65 := by rw [Real.sq_sqrt (show 0 ≤ 65 by norm_num)]
  --    _ = 65 := by rfl
  hole
theorem h₂ (h_sqrt : √1000000 = 1000) (h₁ : Real.log (1000000 ^ (1 / 3)) = Real.log 100) : 1000000 ^ (1 / 3) > 0 := by -- positivity
  norm_num
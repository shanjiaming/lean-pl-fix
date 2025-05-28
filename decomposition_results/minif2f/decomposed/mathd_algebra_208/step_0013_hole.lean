theorem h₅₁ (h_sqrt : √1000000 = 1000) (h₁ : Real.log (1000000 ^ (1 / 3)) = Real.log 100) (h₂ : 1000000 ^ (1 / 3) > 0) (h₃ : 100 > 0) (h₄ : Real.log (1000000 ^ (1 / 3)) = Real.log 100) : Real.log (1000000 ^ (1 / 3)) = Real.log 100 := by
  --  rw [show (1000000 : ℝ) ^ ((1 : ℝ) / 3) = (100 : ℝ) by norm_num]
  hole
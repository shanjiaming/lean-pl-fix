theorem h₂ (h_sqrt : √1000000 = 1000) : Real.log (1000000 ^ (1 / 3)) = 1 / 3 * Real.log 1000000 := by
  rw [Real.log_rpow (by norm_num : (1000000 : ℝ) > 0)] <;> ring_nf
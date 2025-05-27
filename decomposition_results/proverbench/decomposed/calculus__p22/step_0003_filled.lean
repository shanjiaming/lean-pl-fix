theorem h₂  : ∫ (x : ℝ) in Set.Icc 3 9, f x = ∫ (x : ℝ) in 3 ..9, f x := by
  simp [f, intervalIntegral.integral_of_le (by norm_num : (3 : ℝ) ≤ 9)] <;> rfl
  hole
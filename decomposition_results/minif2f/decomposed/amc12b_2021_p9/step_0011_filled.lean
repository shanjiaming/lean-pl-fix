theorem h₂₁ (h₀ : Real.log 80 = 4 * Real.log 2 + Real.log 5) (h₁ : Real.log 40 = 3 * Real.log 2 + Real.log 5) : Real.log 160 = Real.log (2 ^ 5 * 5) := by -- norm_num
  norm_num
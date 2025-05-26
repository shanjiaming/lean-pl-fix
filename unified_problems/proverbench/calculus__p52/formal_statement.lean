theorem sec_integral (x : ℝ) :
  ∫ t in Set.Icc 0 x, (1 / Real.cos t) = Real.log (abs (1 / Real.cos x + Real.sin x / Real.cos x)) + C :=
theorem h₆ (x : ℝ) (h₃ : HasDerivAt (fun x => x + 1) 1 x) (h₅ : HasDerivAt (fun x => 5 * x ^ 2 + 35) (10 * x) x) : HasDerivAt (fun x => √(5 * x ^ 2 + 35)) (10 * x / (2 * √(5 * x ^ 2 + 35))) x :=
  by
  --  apply HasDerivAt.sqrt h₅
  --  nlinarith [Real.sqrt_nonneg (5 * x ^ 2 + 35), Real.sq_sqrt (show 0 ≤ 5 * x ^ 2 + 35 by nlinarith)]
  hole
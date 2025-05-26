theorem h1  : (2 - 5 * sorry) * sorry = 2 * sorry - 5 * sorry * sorry := by
  ring_nf <;>
    nlinarith [Real.sqrt_nonneg 5, Real.sqrt_nonneg 13, Real.sq_sqrt (show 0 ≤ 5 by norm_num),
      Real.sq_sqrt (show 0 ≤ 13 by norm_num)]
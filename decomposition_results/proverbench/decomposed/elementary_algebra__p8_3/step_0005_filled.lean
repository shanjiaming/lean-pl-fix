theorem h4 (h1 : (2 - 5 * sorry) * sorry = 2 * sorry - 5 * sorry * sorry) (h2 : 2 * sorry - 5 * sorry * sorry = 2 * sorry - 5 * sorry) (h3 : 2 * sorry - 5 * sorry = 2 * sorry - 5 * sorry) : (2 - 5 * sorry) * sorry = 2 * sorry - 5 * sorry :=
  by
  --  rw [h1]
  rw [h2] <;> linarith [Real.sqrt_nonneg 5, Real.sqrt_nonneg 13, Real.sqrt_nonneg 65]
  hole
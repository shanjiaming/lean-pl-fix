theorem h4 (h1 : (2 - 5 * √5) * √13 = 2 * √13 - 5 * √5 * √13) (h2 : 2 * √13 - 5 * √5 * √13 = 2 * √13 - 5 * √65) (h3 : 2 * √13 - 5 * √65 = 2 * √13 - 5 * √65) : (2 - 5 * √5) * √13 = 2 * √13 - 5 * √65 :=
  by
  --  rw [h1]
  --  rw [h2] <;> linarith [Real.sqrt_nonneg 5, Real.sqrt_nonneg 13, Real.sqrt_nonneg 65]
  hole
theorem h₄ (h₁ : √65 = √5 * √13) (h₂ : RHS = (2 * √13 - 5 * (√5 * √13)) / 52) : 2 * √13 - 5 * (√5 * √13) = (2 - 5 * √5) * √13 := by
  --  ring_nf <;> linarith [Real.sqrt_nonneg 5, Real.sqrt_nonneg 13]
  hole
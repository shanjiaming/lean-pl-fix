theorem h₂ (h₀ : 2 ^ 2014 - 2 ^ 2012 > 0) : 2 ^ 2014 = 4 * 2 ^ 2012 := by -- ring_nf <;> norm_num [pow_add, pow_mul, mul_assoc] <;> linarith
  norm_num
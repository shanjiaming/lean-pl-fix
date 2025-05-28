theorem h₄ (h_sqrt : √1000000 = 1000) (h₁ : Real.log (1000000 ^ (1 / 3)) = Real.log 100) (h₂ : 1000000 ^ (1 / 3) > 0) (h₃ : 100 > 0) : Real.log (1000000 ^ (1 / 3)) = Real.log 100 := by
  simpa using h₁ <;>
    try
      simp_all [Real.log_rpow, Real.log_pow, Real.log_mul, Real.log_div, Real.log_one, Real.log_zero, Real.log_exp,
          Real.log_sqrt, Real.log_rpow] <;>
        try linarith <;> try nlinarith [Real.sqrt_nonneg 1000000] <;> try ring_nf at * <;> try nlinarith
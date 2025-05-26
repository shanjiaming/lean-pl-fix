theorem h₁  : HasDerivAt (fun x => 3 ^ x) (Real.log 3 * 3 ^ 0) 0 := by
  convert HasDerivAt.rpow (hasDerivAt_const (0 : ℝ) (3 : ℝ)) (hasDerivAt_id (0 : ℝ)) (by norm_num) using 1 <;>
              simp [Real.log_pow, Real.log_mul, Real.log_rpow, Real.log_exp, mul_comm] <;>
            ring_nf <;>
          norm_num <;>
        field_simp [Real.log_mul, Real.log_rpow, Real.log_exp, mul_comm] <;>
      ring_nf <;>
    norm_num
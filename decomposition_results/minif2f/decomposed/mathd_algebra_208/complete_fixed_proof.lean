theorem mathd_algebra_208 : Real.sqrt 1000000 - 1000000 ^ ((1 : ℝ) / 3) = 900:=
  by
  have h_sqrt : Real.sqrt 1000000 = 1000:= by
    --  rw [Real.sqrt_eq_iff_sq_eq (by positivity) (by positivity)] <;> norm_num <;> linarith
    norm_num
  have h_cbrt : (1000000 : ℝ) ^ ((1 : ℝ) / 3) = 100:=
    by
    have h₁ : Real.log ((1000000 : ℝ) ^ ((1 : ℝ) / 3)) = Real.log (100 : ℝ):=
      by
      have h₂ : Real.log ((1000000 : ℝ) ^ ((1 : ℝ) / 3)) = ((1 : ℝ) / 3) * Real.log (1000000 : ℝ):= by
        --  rw [Real.log_rpow (by norm_num : (1000000 : ℝ) > 0)] <;> ring_nf
        hole
      --  rw [h₂]
      have h₃ : Real.log (1000000 : ℝ) = Real.log ((100 : ℝ) ^ 3):= by -- norm_num
        norm_num
      rw [h₃]
      have h₄ : Real.log ((100 : ℝ) ^ 3) = 3 * Real.log (100 : ℝ):= by -- -- rw [Real.log_pow] <;> norm_num
        simp
      rw [h₄]
      ring_nf <;> field_simp [Real.log_mul, Real.log_pow] <;> ring_nf <;> norm_num
      hole
    have h₂ : (1000000 : ℝ) ^ ((1 : ℝ) / 3) > 0:= by -- positivity
      norm_num
    have h₃ : (100 : ℝ) > 0:= by -- norm_num
      norm_num
    have h₄ : Real.log ((1000000 : ℝ) ^ ((1 : ℝ) / 3)) = Real.log (100 : ℝ):= by
      --  simpa using h₁ <;>
        try
          simp_all [Real.log_rpow, Real.log_pow, Real.log_mul, Real.log_div, Real.log_one, Real.log_zero, Real.log_exp,
              Real.log_sqrt, Real.log_rpow] <;>
            try linarith <;> try nlinarith [Real.sqrt_nonneg 1000000] <;> try ring_nf at * <;> try nlinarith
      hole
    have h₅ : Real.log ((1000000 : ℝ) ^ ((1 : ℝ) / 3)) = Real.log (100 : ℝ):= by -- sorry
      linarith
    have h₆ : (1000000 : ℝ) ^ ((1 : ℝ) / 3) = 100:= by
      --  apply Real.log_injOn_pos (Set.mem_Ioi.mpr h₂) (Set.mem_Ioi.mpr (by norm_num [h₃])) <;>
              simp_all [Real.log_rpow, Real.log_pow] <;>
            ring_nf at * <;>
          norm_num at * <;>
        linarith
      hole
    --  rw [h₆] <;> norm_num
    hole
  have h_main : Real.sqrt 1000000 - (1000000 : ℝ) ^ ((1 : ℝ) / 3) = 900:= by
    --  --  rw [h_sqrt] <;> simpa using h_cbrt <;> norm_num <;> linarith [Real.sqrt_nonneg 1000000]
    omega
  --  rw [h_main] <;> norm_num
  hole
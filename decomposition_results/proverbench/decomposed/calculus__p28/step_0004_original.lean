theorem h₂ (h₀ : parabola_fun = fun x => x ^ 2 + 3) : ∫ (x : ℝ) in Icc 1 3, (fun x => x ^ 2 + 3) x = 44 / 3 := by
  norm_num [integral_Icc_eq_integral_Ioc, Real.integral_id, mul_comm] <;> ring_nf <;> norm_num <;> ring_nf <;>
      norm_num <;>
    linarith
theorem area_under_parabola_from_1_to_3 : (∫ x in Icc 1 3, parabola_fun x) = 44 / 3:=
  by
  have h₀ : parabola_fun = fun x ↦ x ^ 2 + 3:= by
    --  funext x
    --  --  dsimp [parabola_fun, parabola_poly, aeval_def, eval₂_add, eval₂_mul, eval₂_pow, eval₂_X, eval₂_C] <;> ring_nf <;>
    --          norm_num <;>
    --        simp_all <;>
        ring_nf <;>
      norm_num
    hole
  have h₁ : (∫ x in Icc 1 3, parabola_fun x) = 44 / 3:= by
    --  rw [h₀]
    have h₂ : (∫ x in Icc 1 3, (fun x ↦ (x : ℝ) ^ 2 + 3 : ℝ → ℝ) x) = 44 / 3:= by
      --  --  --  --  norm_num [integral_Icc_eq_integral_Ioc, Real.integral_id, mul_comm] <;> ring_nf <;> norm_num <;> ring_nf <;>
      --      norm_num <;>
      --    linarith
      hole
    --  simpa using h₂
    hole
  --  rw [h₁] <;> norm_num
  linarith
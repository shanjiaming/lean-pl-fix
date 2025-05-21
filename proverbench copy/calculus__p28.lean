theorem area_under_parabola_from_1_to_3 :
  (∫ x in Icc 1 3, parabola_fun x) = 44/3 := by
  have h₀ : parabola_fun = fun x ↦ x^2 + 3 := by
    funext x
    -- Expand the definition of `parabola_fun` to see the polynomial evaluation.
    dsimp [parabola_fun, parabola_poly, aeval_def, eval₂_add, eval₂_mul, eval₂_pow, eval₂_X, eval₂_C]
    -- Simplify the polynomial evaluation to get `x^2 + 3`.
    <;> ring_nf
    <;> norm_num
    <;> simp_all
    <;> ring_nf
    <;> norm_num
  
  have h₁ : (∫ x in Icc 1 3, parabola_fun x) = 44/3 := by
    rw [h₀]
    -- Use the fundamental theorem of calculus to evaluate the integral of `x^2 + 3` from 1 to 3.
    have h₂ : (∫ x in Icc 1 3, (fun x ↦ (x:ℝ)^2 + 3 : ℝ → ℝ) x) = 44/3 := by
      -- Use the `norm_num` tactic to compute the integral.
      norm_num [integral_Icc_eq_integral_Ioc, Real.integral_id, mul_comm]
      <;>
      ring_nf
      <;>
      norm_num
      <;>
      ring_nf
      <;>
      norm_num
      <;>
      linarith
    -- Using the previously computed result to conclude the proof.
    simpa using h₂
  
  rw [h₁]
  <;> norm_num
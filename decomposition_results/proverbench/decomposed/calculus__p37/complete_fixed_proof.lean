theorem sin_sqrt_x_over_sqrt_x_integral (x C : ℝ) : ∫ (x : ℝ), sin (sqrt x) / sqrt x = -2 * cos (sqrt x) + C:=
  by
  have h1 : False:=
    by
    have h2 : (0 : ℝ) > 0:=
      by
      have h3 : ¬Integrable (fun x : ℝ => sin (sqrt x) / sqrt x):=
        by
        --  intro h
        have h4 := h.1
        have h5 := h.2
        norm_num [Real.sqrt_eq_zero_of_nonpos, div_eq_mul_inv, mul_assoc] at h4 h5 <;> (try contradiction) <;>
              (try norm_num at h4 h5) <;>
            (try linarith) <;>
          (try {simp_all [Real.sqrt_eq_zero_of_nonpos, div_eq_mul_inv, mul_assoc] <;> norm_num at * <;> linarith
            })
        hole
      --  exact by
      --    have h4 : ¬Integrable (fun x : ℝ => sin (sqrt x) / sqrt x) := h3
      --    have h5 : ¬Integrable (fun x : ℝ => sin (sqrt x) / sqrt x) := h4
      --    simp_all [Real.sqrt_eq_zero_of_nonpos, div_eq_mul_inv, mul_assoc] <;> norm_num at * <;> linarith
      hole
    --  linarith
    linarith
  have h2 : ∫ (x : ℝ), sin (sqrt x) / sqrt x = -2 * cos (sqrt x) + C:=
    by
    --  exfalso
    --  exact h1
    hole
  --  exact h2
  linarith
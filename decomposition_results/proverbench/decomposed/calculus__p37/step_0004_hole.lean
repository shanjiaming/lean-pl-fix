theorem h3 (x C : ℝ) : ¬sorry :=
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
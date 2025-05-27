theorem h_main (x : ℝ) : ∃ C,
    ∫ (x : ℝ), integralFunction x =
      Real.log |Real.tan x - 2| - Real.log |Real.tan x + 1| - 2 * Real.log |Real.cos x| + C :=
  by
  use
                (∫ x, integralFunction x : ℝ) -
                  (Real.log (abs (Real.tan x - 2)) - Real.log (abs (Real.tan x + 1)) -
                    2 * Real.log (abs (Real.cos x))) <;>
              ring_nf <;>
            simp [integralFunction] <;>
          field_simp [Real.log_mul, Real.log_pow, Real.log_inv, Real.log_div] <;>
        ring_nf <;>
      norm_num <;>
    linarith
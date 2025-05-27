theorem complex_power_example : (1 + I) ^ 10 = 32 * I:=
  by
  have h1 : (1 + I) ^ 2 = 2 * I:= by
    --  norm_num [Complex.ext_iff, pow_two, Complex.I_mul_I, Complex.I_mul_I, Complex.I_mul_I, Complex.I_mul_I] <;>
                        ring_nf <;>
                      norm_num <;>
                    simp [Complex.ext_iff, pow_two, Complex.I_mul_I, Complex.I_mul_I, Complex.I_mul_I,
                      Complex.I_mul_I] <;>
                  norm_num <;>
                ring_nf <;>
              norm_num <;>
            simp [Complex.ext_iff, pow_two, Complex.I_mul_I, Complex.I_mul_I, Complex.I_mul_I, Complex.I_mul_I] <;>
          norm_num <;>
        ring_nf <;>
      norm_num
    hole
  have h2 : (1 + I) ^ 4 = -4:= by
    --  calc
    --    (1 + I) ^ 4 = ((1 + I) ^ 2) ^ 2 := by ring_nf
    --    _ = (2 * I) ^ 2 := by rw [h1]
    --    _ = 4 * I ^ 2 := by
    --      ring_nf <;>
    --              simp [Complex.ext_iff, pow_two, Complex.I_mul_I, Complex.I_mul_I, Complex.I_mul_I, Complex.I_mul_I] <;>
    --            norm_num <;>
    --          ring_nf <;>
    --        norm_num
    --    _ = -4 :=
    --      by
    --      have h : I ^ 2 = -1 := by
    --        simp [Complex.ext_iff, pow_two, Complex.I_mul_I, Complex.I_mul_I, Complex.I_mul_I, Complex.I_mul_I] <;> norm_num
    --      rw [h] <;> ring_nf <;>
    --          simp [Complex.ext_iff, pow_two, Complex.I_mul_I, Complex.I_mul_I, Complex.I_mul_I, Complex.I_mul_I] <;>
    --        norm_num
    hole
  have h3 : (1 + I) ^ 8 = 16:= by
    --  calc
    --    (1 + I) ^ 8 = ((1 + I) ^ 4) ^ 2 := by ring_nf
    --    _ = (-4 : ℂ) ^ 2 := by rw [h2]
    --    _ = 16 := by
    --      norm_num [Complex.ext_iff, pow_two, Complex.I_mul_I, Complex.I_mul_I, Complex.I_mul_I, Complex.I_mul_I] <;>
    --                          ring_nf <;>
    --                        norm_num <;>
    --                      simp [Complex.ext_iff, pow_two, Complex.I_mul_I, Complex.I_mul_I, Complex.I_mul_I,
    --                        Complex.I_mul_I] <;>
    --                    norm_num <;>
    --                  ring_nf <;>
    --                norm_num <;>
    --              simp [Complex.ext_iff, pow_two, Complex.I_mul_I, Complex.I_mul_I, Complex.I_mul_I, Complex.I_mul_I] <;>
    --            norm_num <;>
    --          ring_nf <;>
    --        norm_num
    hole
  have h4 : (1 + I) ^ 10 = 32 * I:= by
    --  calc
    --    (1 + I) ^ 10 = (1 + I) ^ 8 * (1 + I) ^ 2 :=
    --      by
    --      rw [show (10 : ℕ) = 8 + 2 by norm_num]
    --      rw [pow_add] <;> ring_nf
    --    _ = 16 * (2 * I) := by rw [h3, h1] <;> ring_nf
    --    _ = 32 * I := by
    --      ring_nf <;>
    --                      simp [Complex.ext_iff, pow_two, Complex.I_mul_I, Complex.I_mul_I, Complex.I_mul_I,
    --                        Complex.I_mul_I] <;>
    --                    norm_num <;>
    --                  ring_nf <;>
    --                norm_num <;>
    --              simp [Complex.ext_iff, pow_two, Complex.I_mul_I, Complex.I_mul_I, Complex.I_mul_I, Complex.I_mul_I] <;>
    --            norm_num <;>
    --          ring_nf <;>
    --        norm_num
    hole
  --  rw [h4] <;> simp [Complex.ext_iff, pow_two, Complex.I_mul_I, Complex.I_mul_I, Complex.I_mul_I, Complex.I_mul_I] <;>
                norm_num <;>
              ring_nf <;>
            norm_num <;>
          simp [Complex.ext_iff, pow_two, Complex.I_mul_I, Complex.I_mul_I, Complex.I_mul_I, Complex.I_mul_I] <;>
        norm_num <;>
      ring_nf <;>
    norm_num
  hole
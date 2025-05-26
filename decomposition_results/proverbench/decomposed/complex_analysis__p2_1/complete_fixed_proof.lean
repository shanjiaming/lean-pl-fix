theorem exponent_simplification : exp (I * (5 * π / 2)) = exp (I * (π / 2)):=
  by
  have h₀ : (5 : ℂ) * (π : ℂ) / 2 = (π : ℂ) / 2 + 2 * (π : ℂ):= by
    --  ring_nf <;> simp [Complex.ext_iff, Complex.I_mul_I, mul_comm] <;> norm_num <;> ring_nf at * <;> norm_num at * <;>
              simp_all [Complex.ext_iff, Complex.I_mul_I, mul_comm] <;>
            norm_num <;>
          ring_nf at * <;>
        norm_num at * <;>
      linarith
    hole
  have h₁ : exp (I * (5 * π / 2)) = exp (I * (π / 2 + 2 * π)):= by
    --  rw [show (I : ℂ) * (5 * π / 2 : ℂ) = I * (π / 2 + 2 * π) by
    --                        {
    --                        have h₁ : (5 : ℂ) * (π : ℂ) / 2 = (π : ℂ) / 2 + 2 * (π : ℂ) := h₀
    --                        calc
    --                          (I : ℂ) * (5 * π / 2 : ℂ) = (I : ℂ) * ((π / 2 + 2 * π : ℂ)) := by rw [h₁]
    --                          _ = I * (π / 2 + 2 * π : ℂ) := by ring
    --                      }] <;>
                      simp [Complex.ext_iff, Complex.I_mul_I, Real.exp_add, mul_add, add_mul, mul_comm] <;>
                    norm_num <;>
                  ring_nf at * <;>
                norm_num at * <;>
              simp_all [Complex.ext_iff, Complex.I_mul_I, mul_comm] <;>
            norm_num <;>
          ring_nf at * <;>
        norm_num at * <;>
      linarith
    hole
  have h₂ : exp (I * (π / 2 + 2 * π)) = exp (I * (π / 2)) * exp (I * (2 * π)):=
    by
    --  rw [show (I * (π / 2 + 2 * π) : ℂ) = (I * (π / 2) + I * (2 * π)) by ring]
    rw [Complex.exp_add] <;> ring_nf <;> simp [Complex.ext_iff, Complex.I_mul_I, mul_comm] <;> norm_num <;>
          simp_all [Complex.ext_iff, Complex.I_mul_I, mul_comm] <;>
        norm_num <;>
      linarith
    hole
  have h₃ : exp (I * (2 * π)) = 1:= by
    --  rw [Complex.ext_iff]
    constructor <;>
                            simp [Complex.exp_re, Complex.exp_im, Complex.I_re, Complex.I_im, Real.exp_zero, Real.cos_add,
                              Real.sin_add, Real.cos_two_pi, Real.sin_two_pi, mul_comm] <;>
                          (try ring_nf) <;>
                        (try norm_num) <;>
                      (try simp [Real.cos_add, Real.sin_add, Real.cos_two_pi, Real.sin_two_pi, mul_comm]) <;>
                    (try ring_nf) <;>
                  (try norm_num) <;>
                (try simp [Real.cos_add, Real.sin_add, Real.cos_two_pi, Real.sin_two_pi, mul_comm]) <;>
              (try ring_nf) <;>
            (try norm_num) <;>
          simp_all [Complex.ext_iff, Complex.I_re, Complex.I_im, Real.exp_zero, Real.cos_add, Real.sin_add,
            Real.cos_two_pi, Real.sin_two_pi, mul_comm] <;>
        norm_num <;>
      linarith
    hole
  have h₄ : exp (I * (π / 2 + 2 * π)) = exp (I * (π / 2)):=
    by
    --  rw [h₂]
    rw [h₃] <;> simp [Complex.ext_iff, Complex.I_mul_I, mul_comm] <;> norm_num <;> ring_nf at * <;> norm_num at * <;>
      linarith
    hole
  have h₅ : exp (I * (5 * π / 2)) = exp (I * (π / 2)):= by
    --  rw [h₁]
    rw [h₄] <;> simp [Complex.ext_iff, Complex.I_mul_I, mul_comm] <;> norm_num <;> ring_nf at * <;> norm_num at * <;>
      linarith
    hole
  --  rw [h₅]
  hole
theorem h₃ (b✝ b : ℕ → ℝ) (h_pos : ∀ (n : ℕ), b n > 0) (h_lim : Tendsto b atTop (𝓝 (1 / 2))) (h_main : Summable fun n => b n ^ n / ↑n) (n : ℕ) : cos (↑n * π) = (-1) ^ n :=
  by
  rw [show (n : ℝ) * Real.pi = (n : ℝ) * Real.pi by rfl]
  rw [Real.cos_eq_cos_add_int_mul_two_pi _ n]
  simp [Complex.ext_iff, Complex.cos, Complex.sin, Complex.exp_re, Complex.exp_im, pow_add, pow_mul, pow_two,
                                  pow_three] <;>
                                ring_nf <;>
                              field_simp [Real.cos_add, Real.sin_add, Real.cos_pi_div_two, Real.sin_pi_div_two] <;>
                            ring_nf <;>
                          simp [Complex.ext_iff, Complex.cos, Complex.sin, Complex.exp_re, Complex.exp_im, pow_add,
                            pow_mul, pow_two, pow_three] <;>
                        ring_nf <;>
                      field_simp [Real.cos_add, Real.sin_add, Real.cos_pi_div_two, Real.sin_pi_div_two] <;>
                    ring_nf <;>
                  simp [Complex.ext_iff, Complex.cos, Complex.sin, Complex.exp_re, Complex.exp_im, pow_add, pow_mul,
                    pow_two, pow_three] <;>
                ring_nf <;>
              field_simp [Real.cos_add, Real.sin_add, Real.cos_pi_div_two, Real.sin_pi_div_two] <;>
            ring_nf <;>
          simp [Complex.ext_iff, Complex.cos, Complex.sin, Complex.exp_re, Complex.exp_im, pow_add, pow_mul, pow_two,
            pow_three] <;>
        ring_nf <;>
      field_simp [Real.cos_add, Real.sin_add, Real.cos_pi_div_two, Real.sin_pi_div_two] <;>
    ring_nf
  hole
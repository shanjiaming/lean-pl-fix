theorem h₁ (n : ℕ) (z : Fin n → ℂ) (h : ∑ i, z i ^ 2 = 0) : (∑ i, z i ^ 2) ^ (1 / 2) = 0 :=
  by
  rw [h]
  simp [Complex.ext_iff, Complex.ofReal_zero, Complex.ofReal_one, Complex.ofReal_add, Complex.ofReal_mul,
                    Complex.ofReal_sub, Complex.ofReal_pow] <;>
                  simp_all [Complex.ext_iff, pow_two, Complex.ext_iff, Complex.ofReal_zero, Complex.ofReal_one,
                    Complex.ofReal_add, Complex.ofReal_mul, Complex.ofReal_sub, Complex.ofReal_pow] <;>
                norm_num <;>
              simp_all [Complex.ext_iff, pow_two, Complex.ext_iff, Complex.ofReal_zero, Complex.ofReal_one,
                Complex.ofReal_add, Complex.ofReal_mul, Complex.ofReal_sub, Complex.ofReal_pow] <;>
            norm_num <;>
          simp_all [Complex.ext_iff, pow_two, Complex.ext_iff, Complex.ofReal_zero, Complex.ofReal_one,
            Complex.ofReal_add, Complex.ofReal_mul, Complex.ofReal_sub, Complex.ofReal_pow] <;>
        norm_num <;>
      simp_all [Complex.ext_iff, pow_two, Complex.ext_iff, Complex.ofReal_zero, Complex.ofReal_one, Complex.ofReal_add,
        Complex.ofReal_mul, Complex.ofReal_sub, Complex.ofReal_pow] <;>
    norm_num
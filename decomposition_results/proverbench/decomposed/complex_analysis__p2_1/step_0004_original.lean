theorem h₂ (h₀ : 5 * ↑π / 2 = ↑π / 2 + 2 * ↑π) (h₁ : cexp (I * (5 * ↑π / 2)) = cexp (I * (↑π / 2 + 2 * ↑π))) : cexp (I * (↑π / 2 + 2 * ↑π)) = cexp (I * (↑π / 2)) * cexp (I * (2 * ↑π)) :=
  by
  rw [show (I * (π / 2 + 2 * π) : ℂ) = (I * (π / 2) + I * (2 * π)) by ring]
  rw [Complex.exp_add] <;> ring_nf <;> simp [Complex.ext_iff, Complex.I_mul_I, mul_comm] <;> norm_num <;>
        simp_all [Complex.ext_iff, Complex.I_mul_I, mul_comm] <;>
      norm_num <;>
    linarith
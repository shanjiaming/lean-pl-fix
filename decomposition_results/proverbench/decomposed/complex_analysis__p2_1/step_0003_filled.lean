theorem h₁ (h₀ : 5 * ↑π / 2 = ↑π / 2 + 2 * ↑π) : cexp (I * (5 * ↑π / 2)) = cexp (I * (↑π / 2 + 2 * ↑π)) := by
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
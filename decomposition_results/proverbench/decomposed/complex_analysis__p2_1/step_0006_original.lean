theorem h₄ (h₀ : 5 * ↑π / 2 = ↑π / 2 + 2 * ↑π) (h₁ : cexp (I * (5 * ↑π / 2)) = cexp (I * (↑π / 2 + 2 * ↑π))) (h₂ : cexp (I * (↑π / 2 + 2 * ↑π)) = cexp (I * (↑π / 2)) * cexp (I * (2 * ↑π))) (h₃ : cexp (I * (2 * ↑π)) = 1) : cexp (I * (↑π / 2 + 2 * ↑π)) = cexp (I * (↑π / 2)) :=
  by
  rw [h₂]
  rw [h₃] <;> simp [Complex.ext_iff, Complex.I_mul_I, mul_comm] <;> norm_num <;> ring_nf at * <;> norm_num at * <;>
    linarith
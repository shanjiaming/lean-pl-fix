theorem h₆ (a b : NNReal) (h₀ : 0 < a ∧ 0 < b) (h₁ : a ^ 2 = 6 * b) (h₂ : a ^ 2 = 54 / b) (h₃ : ↑b = 3) (h₄ : ↑a ^ 2 = 18) (h₅ : ↑a = 3 * √2) : a = 3 * NNReal.sqrt 2 := by
  apply Eq.symm
  apply Eq.symm
  rw [← NNReal.coe_inj] at *
  norm_num [NNReal.coe_mul, NNReal.coe_pow, Real.sqrt_eq_iff_sq_eq, mul_comm, mul_assoc, mul_left_comm] at * <;>
        ring_nf at * <;>
      simp_all [Real.sqrt_eq_iff_sq_eq, mul_comm, mul_assoc, mul_left_comm] <;>
    nlinarith [Real.sqrt_nonneg 2, Real.sq_sqrt (show 0 ≤ 2 by norm_num)]
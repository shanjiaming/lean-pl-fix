theorem h₆ (a b : NNReal) (h₀ : 0 < a ∧ 0 < b) (h₁ : a ^ 2 = 6 * b) (h₂ : a ^ 2 = 54 / b) (h₃ : (↑b : ℝ) = 3) (h₄ : (↑a : ℝ) ^ 2 = 18) (h₅ : (↑a : ℝ) = 3 * √2) : a = 3 * (NNReal.sqrt : NNReal → NNReal) 2 := by
  apply Eq.symm
  apply Eq.symm
  rw [← NNReal.coe_inj] at *
  simp_all [NNReal.coe_mul, NNReal.coe_pow, NNReal.sqrt_eq_iff_sq_eq] <;> (try norm_num) <;> (try ring_nf at *) <;>
              (try nlinarith [Real.sqrt_nonneg 2, Real.sq_sqrt (show 0 ≤ 2 by norm_num)]) <;>
            (try field_simp at *) <;>
          (try norm_num at *) <;>
        (try nlinarith) <;>
      (try {nlinarith [Real.sqrt_nonneg 2, Real.sq_sqrt (show 0 ≤ 2 by norm_num)]
        }) <;>
    (try {ring_nf at * <;> nlinarith [Real.sqrt_nonneg 2, Real.sq_sqrt (show 0 ≤ 2 by norm_num)]
      })
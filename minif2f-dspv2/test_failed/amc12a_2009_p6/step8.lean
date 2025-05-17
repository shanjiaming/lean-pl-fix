theorem h₄ (m n p q : ℝ) (h₀ : p = 2 ^ m) (h₁ : q = 3 ^ n) (h₂ : p ^ (2 * n) = 2 ^ (m * (2 * n))) (h₃ : q ^ m = 3 ^ (n * m)) : p ^ (2 * n) * q ^ m = 2 ^ (m * (2 * n)) * 3 ^ (n * m) := by
  rw [h₂, h₃] <;> simp [mul_assoc] <;> ring_nf <;>
        simp_all [Real.rpow_mul, Real.rpow_add, Real.rpow_neg, Real.rpow_sub, Real.rpow_mul, Real.rpow_add,
          Real.rpow_neg, Real.rpow_sub] <;>
      ring_nf at * <;>
    linarith
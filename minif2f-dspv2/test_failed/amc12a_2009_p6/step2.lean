theorem h₂ (m n p q : ℝ) (h₀ : p = 2 ^ m) (h₁ : q = 3 ^ n) : p ^ (2 * n) = 2 ^ (m * (2 * n)) := by
  rw [h₀]
  have h₂₁ : ((2 : ℝ) ^ m : ℝ) > 0 := by sorry
  have h₂₂ : ((2 : ℝ) ^ m : ℝ) ^ (2 * n : ℝ) = (2 : ℝ) ^ (m * (2 * n)) := by sorry
  rw [h₂₂] <;>
            simp [h₀, h₁, Real.rpow_mul, Real.rpow_add, Real.rpow_neg, Real.rpow_sub, Real.rpow_mul, Real.rpow_add,
              Real.rpow_neg, Real.rpow_sub] <;>
          ring_nf at * <;>
        simp_all [Real.rpow_mul, Real.rpow_add, Real.rpow_neg, Real.rpow_sub] <;>
      norm_num at * <;>
    linarith
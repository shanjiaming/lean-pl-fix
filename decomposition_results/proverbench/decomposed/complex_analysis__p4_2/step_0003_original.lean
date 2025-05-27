theorem h₁ (n : ℕ) (h₀ : I ^ 4 = 1) : ∀ (k : ℕ), I ^ (4 * k) = 1 := by
  intro k
  induction k with
  | zero => simp
  | succ k ih =>
    rw [show 4 * (k + 1) = 4 * k + 4 by ring]
    rw [pow_add]
    simp [ih, h₀, pow_mul, Complex.ext_iff, Complex.I_mul_I] <;> norm_num <;>
            simp_all [Complex.ext_iff, Complex.I_mul_I] <;>
          norm_num <;>
        simp_all [Complex.ext_iff, Complex.I_mul_I] <;>
      norm_num
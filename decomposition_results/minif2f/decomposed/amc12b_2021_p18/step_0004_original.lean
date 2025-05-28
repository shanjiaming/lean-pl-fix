theorem h₁₂ (z : ℂ) (h₀ : 12 * Complex.normSq z = 2 * Complex.normSq (z + 2) + Complex.normSq (z ^ 2 + 1) + 31) (h₁₁ : Complex.normSq z = z.re * z.re + z.im * z.im) : Complex.normSq (z + 2) = (z.re + 2) * (z.re + 2) + z.im * z.im := by
  simp [Complex.normSq_apply, Complex.ext_iff, pow_two] <;> ring_nf <;> field_simp [Real.sqrt_eq_iff_sq_eq] <;>
      ring_nf <;>
    nlinarith [sq_nonneg (z.re + z.im), sq_nonneg (z.re - z.im)]
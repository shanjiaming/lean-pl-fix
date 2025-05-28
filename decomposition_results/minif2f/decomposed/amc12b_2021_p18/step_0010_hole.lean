theorem h₂₁ (z : ℂ) (h₀ : 12 * Complex.normSq z = 2 * Complex.normSq (z + 2) + Complex.normSq (z ^ 2 + 1) + 31) (h₁ : z.re = -1) : Complex.normSq z = z.re * z.re + z.im * z.im := by
  --  simp [Complex.normSq_apply] <;> ring_nf <;> field_simp [Real.sqrt_eq_iff_sq_eq] <;> ring_nf <;>
    nlinarith [sq_nonneg (z.re + z.im), sq_nonneg (z.re - z.im)]
  hole
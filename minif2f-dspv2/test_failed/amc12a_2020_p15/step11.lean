theorem h₅ (a b : ℂ) (h₀ : a ^ 3 - 8 = 0) (h₁ : b ^ 3 - 8 * b ^ 2 - 8 * b + 64 = 0) (h₂ : a.abs = 2) (h₄ : b ^ 3 - 8 * b ^ 2 - 8 * b + 64 = 0) : (b - 8) * (b ^ 2 - 8) = 0 := by
  ring_nf at h₄ ⊢ <;> simp_all [Complex.ext_iff, pow_two, pow_three] <;> (try ring_nf at *) <;> (try norm_num at *) <;>
    (try
        constructor <;>
          nlinarith [sq_nonneg (b.re - 8), sq_nonneg (b.re + 8), sq_nonneg (b.im - 8), sq_nonneg (b.im + 8),
            sq_nonneg (b.re - b.im), sq_nonneg (b.re + b.im), sq_nonneg (b.re - 2), sq_nonneg (b.re + 2),
            sq_nonneg (b.im - 2), sq_nonneg (b.im + 2)])
theorem h₂ (a b : ℤ) (h₀ : ∀ (x : ℝ), 10 * x ^ 2 - x - 24 = (↑a * x - 8) * (↑b * x + 3)) (h₁ : (a + 8) * (b - 3) = -13) : (a - 8) * (b + 3) = -15 := by
  have h₂₀ := h₀ (1 : ℝ)
  norm_num at h₂₀
  ring_nf at h₂₀
  have h₂₁ := congr_arg (fun x : ℝ => (x : ℝ)) h₂₀
  norm_num at h₂₁
  ring_nf at h₂₁
  norm_cast at h₂₁ ⊢ <;> (try norm_num at h₂₁ ⊢) <;> (try ring_nf at h₂₁ ⊢) <;> (try nlinarith) <;>
            (try {nlinarith [sq_nonneg (a + 8 : ℤ), sq_nonneg (b - 3 : ℤ), sq_nonneg (a - 8 : ℤ), sq_nonneg (b + 3 : ℤ)]
              }) <;>
          (try {nlinarith [sq_nonneg (a + 8 : ℤ), sq_nonneg (b - 3 : ℤ), sq_nonneg (a - 8 : ℤ), sq_nonneg (b + 3 : ℤ)]
            }) <;>
        (try {nlinarith [sq_nonneg (a + 8 : ℤ), sq_nonneg (b - 3 : ℤ), sq_nonneg (a - 8 : ℤ), sq_nonneg (b + 3 : ℤ)]
          }) <;>
      (try {nlinarith [sq_nonneg (a + 8 : ℤ), sq_nonneg (b - 3 : ℤ), sq_nonneg (a - 8 : ℤ), sq_nonneg (b + 3 : ℤ)]
        }) <;>
    nlinarith [sq_nonneg (a + 8 : ℤ), sq_nonneg (b - 3 : ℤ), sq_nonneg (a - 8 : ℤ), sq_nonneg (b + 3 : ℤ)]
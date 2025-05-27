theorem h₁₃ (x y u : ℤ) (n : ℕ) (h₀ : x ^ 2 + y ^ 2 - 1 = 4 * x * y) (h₂ : x = 0 ∧ y = 1 ∧ u = 0 ∧ n = 0 → False) (h₈ : ¬(x = 0 ∧ y = 1 ∧ u = 0 ∧ n = 0)) (h₉ : x = 0) (h₁₀ : y = 1) (h₁₁ : u = 0) : ↑x + ↑u * √3 = (2 + √3) ^ n := by
  norm_num [h₉, h₁₀, h₁₁] at h₀ ⊢ <;> ring_nf at h₀ ⊢ <;> norm_num at h₀ ⊢ <;>
    nlinarith [Real.sqrt_nonneg 3, Real.sq_sqrt (show (0 : ℝ) ≤ 3 by norm_num)]
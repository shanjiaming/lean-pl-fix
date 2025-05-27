theorem h3 (h1 : partial_t 2 π = deriv (fun τ => g 2 τ) π) (h2 : deriv (fun τ => g 2 τ) π = 24 * π ^ 2) : partial_t 2 π = 24 * π ^ 2 := by
  --  rw [h1, h2] <;> simp_all [partial_t, g, f, x, y, z] <;> ring_nf at * <;> norm_num at * <;>
    linarith [Real.cos_le_one π, Real.sin_le_one π, Real.cos_le_one π, Real.sin_le_one π]
  hole
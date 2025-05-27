theorem h2 (h1 : partial_t 2 π = deriv (fun τ => g 2 τ) π) : deriv (fun τ => g 2 τ) π = 24 * π ^ 2 :=
  by
  have h₃ : (fun τ => g 2 τ) = (fun τ => (2 : ℝ) ^ 2 * (cos τ) ^ 2 + (2 : ℝ) ^ 3 * τ ^ 3 + (2 : ℝ) ^ 8) := by sorry
  rw [h₃]
  have h₄ : deriv (fun τ => (2 : ℝ) ^ 2 * (cos τ) ^ 2 + (2 : ℝ) ^ 3 * τ ^ 3 + (2 : ℝ) ^ 8) π = 24 * π ^ 2 := by sorry
  rw [h₄] <;> ring_nf <;> norm_num <;>
    linarith [Real.cos_le_one π, Real.sin_le_one π, Real.cos_le_one π, Real.sin_le_one π]
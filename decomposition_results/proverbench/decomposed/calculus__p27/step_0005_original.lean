theorem h₄ (h1 : partial_t 2 π = deriv (fun τ => g 2 τ) π) (h₃ : (fun τ => g 2 τ) = fun τ => 2 ^ 2 * cos τ ^ 2 + 2 ^ 3 * τ ^ 3 + 2 ^ 8) : deriv (fun τ => 2 ^ 2 * cos τ ^ 2 + 2 ^ 3 * τ ^ 3 + 2 ^ 8) π = 24 * π ^ 2 :=
  by
  have h₅ :
    HasDerivAt (fun τ => (2 : ℝ) ^ 2 * (cos τ) ^ 2 + (2 : ℝ) ^ 3 * τ ^ 3 + (2 : ℝ) ^ 8)
      ((2 : ℝ) ^ 2 * (2 * cos π * (-sin π)) + (2 : ℝ) ^ 3 * (3 * π ^ 2)) π := by sorry
  have h₅₈ :
    deriv (fun τ => (2 : ℝ) ^ 2 * (cos τ) ^ 2 + (2 : ℝ) ^ 3 * τ ^ 3 + (2 : ℝ) ^ 8) π =
      (2 : ℝ) ^ 2 * (2 * cos π * (-sin π)) + (2 : ℝ) ^ 3 * (3 * π ^ 2) := by sorry
  rw [h₅₈]
  have h₅₉ : cos π = -1 := by sorry
  have h₅₁₀ : sin π = 0 := by sorry
  rw [h₅₉, h₅₁₀] <;> ring_nf <;> norm_num <;>
    linarith [Real.cos_le_one π, Real.sin_le_one π, Real.cos_le_one π, Real.sin_le_one π]
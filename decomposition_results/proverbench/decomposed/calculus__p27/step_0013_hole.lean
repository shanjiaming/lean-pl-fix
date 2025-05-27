theorem h₅₈ (h1 : partial_t 2 π = deriv (fun τ => g 2 τ) π) (h₃ : (fun τ => g 2 τ) = fun τ => 2 ^ 2 * cos τ ^ 2 + 2 ^ 3 * τ ^ 3 + 2 ^ 8) (h₅₂ : HasDerivAt (fun τ => cos τ) (-sin π) π) (h₅₃ h₅₇ : HasDerivAt (fun τ => cos τ ^ 2) (2 * cos π * -sin π) π) : HasDerivAt (fun τ => 2 ^ 2 * cos τ ^ 2) (2 ^ 2 * (2 * cos π * -sin π)) π := by
  --  convert HasDerivAt.const_mul (2 : ℝ) ^ 2 h₅₇ using 1 <;> ring_nf <;> simp [sin_pi, cos_pi] <;>
    linarith [Real.cos_le_one π, Real.sin_le_one π, Real.cos_le_one π, Real.sin_le_one π]
  hole
theorem h₁₀ (R : Type) (inst✝ : Ring R) (h : ∀ (a : R), a ^ 3 = a) (h6 : ∀ (a : R), 6 • a = 0) (a b : R) (h₁ : (a + b) ^ 3 = a + b) (h₂ : (a - b) ^ 3 = a - b) (h₃ : (a + b) ^ 3 - (a - b) ^ 3 = a + b - (a - b)) (h₄ : (a + b) ^ 3 - (a - b) ^ 3 = 2 * (a ^ 2 * b + a * b * a + b * a ^ 2 + b ^ 3)) (h₅ : a + b - (a - b) = 2 * b) (h₆ : 2 * (a ^ 2 * b + a * b * a + b * a ^ 2 + b ^ 3) = 2 * b) (h₇ : a ^ 2 * b + a * b * a + b * a ^ 2 + b ^ 3 = b) (h₈ : a ^ 2 * b + a * b * a + b * a ^ 2 = 0) : a ^ 2 + 3 * a = 0 := by
  have h₁₁ := h a
  have h₁₂ := h (a + 1)
  have h₁₃ := h (a - 1)
  have h₁₄ := h6 a
  have h₁₅ := h6 (a ^ 2)
  have h₁₆ := h6 1
  simp [pow_three, mul_add, mul_sub, add_mul, sub_mul, mul_one, mul_zero, add_assoc, add_sub_assoc, add_sub_cancel,
    mul_assoc, mul_comm, mul_left_comm] at h₁₁ h₁₂ h₁₃ h₁₄ h₁₅ h₁₆ ⊢
  ring_nf at h₁₁ h₁₂ h₁₃ h₁₄ h₁₅ h₁₆ ⊢ <;> norm_num at h₁₁ h₁₂ h₁₃ h₁₄ h₁₅ h₁₆ ⊢ <;>
      ring_nf at h₁₁ h₁₂ h₁₃ h₁₄ h₁₅ h₁₆ ⊢ <;>
    omega
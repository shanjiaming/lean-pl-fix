theorem h₁₇ (R : Type) (inst✝ : Ring R) (h : ∀ (a : R), a ^ 3 = a) (h6 : ∀ (a : R), 6 • a = 0) (a b : R) (h₁ : (a + b) ^ 3 = a + b) (h₂ : (a - b) ^ 3 = a - b) (h₃ : (a + b) ^ 3 - (a - b) ^ 3 = a + b - (a - b)) (h₄ : (a + b) ^ 3 - (a - b) ^ 3 = 2 * (a ^ 2 * b + a * b * a + b * a ^ 2 + b ^ 3)) (h₅ : a + b - (a - b) = 2 * b) (h₆ : 2 * (a ^ 2 * b + a * b * a + b * a ^ 2 + b ^ 3) = 2 * b) (h₇ : a ^ 2 * b + a * b * a + b * a ^ 2 + b ^ 3 = b) (h₈ : a ^ 2 * b + a * b * a + b * a ^ 2 = 0) (h₉ h₁₁ : a * b * a = 3 * a * b + 3 * b * a) (h₁₂ : 2 • (a * b) = 0) (h₁₄ : a * b * a = 3 * a * b + 3 * b * a) (h₁₅ : 2 • (a * b) = 0) (h₁₆ : 2 • (b * a) = 0) : a * b * a = a * b + b * a :=
  by
  have h₁₈ : a * b + b * a = a * b + b * a := rfl
  have h₁₉ : 3 * a * b + 3 * b * a = a * b + b * a :=
    by
    have h₂₀ := h₁₅
    have h₂₁ := h₁₆
    simp [two_nsmul, add_mul, mul_add, add_assoc] at h₂₀ h₂₁ <;> ring_nf at h₁₁ h₂₀ h₂₁ ⊢ <;> simp_all [mul_assoc] <;>
      nlinarith
  have h₁₉ : 3 * a * b + 3 * b * a = a * b + b * a := by sorry
have h₁₇ : a * b * a = a * b + b * a :=
  by
  have h₁₈ : a * b + b * a = a * b + b * a := rfl
  have h₁₉ : 3 * a * b + 3 * b * a = a * b + b * a :=
    by
    have h₂₀ := h₁₅
    have h₂₁ := h₁₆
    simp [two_nsmul, add_mul, mul_add, add_assoc] at h₂₀ h₂₁ <;> ring_nf at h₁₁ h₂₀ h₂₁ ⊢ <;> simp_all [mul_assoc] <;>
      nlinarith
  linarith
  hole
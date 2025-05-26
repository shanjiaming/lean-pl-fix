theorem h₂₂ (S : Type u_3) (x✝ : Mul S) (h : ∀ (x y : S), x * (x * y) = y ∧ y * x * x = y) (x y : S) (h₃ h₅ h₆ h₈ : x * y * (x * y * y) = y) (h₁₁ : x * y * y * y = x * y * y * y) (h₁₅ : y * (x * y) * (x * y) = y) (h₁₇ h₁₉ : x * y * (x * y * y) = y) (h₂₁ : y * (x * y) * (x * y) = y) : x * y * y = x := by
  have h₂₃ := h x y
  have h₂₄ := h y x
  have h₂₅ := h (x * y) y
  have h₂₆ := h y (x * y)
  have h₂₇ := h x (x * y)
  have h₂₈ := h (x * y) x
  simp_all [mul_assoc] <;> (try contradiction) <;> (try ring_nf at *) <;> (try simp_all [mul_assoc]) <;> (try omega)
  hole
theorem h₁₅ (S : Type u_3) (x✝ : Mul S) (h : ∀ (x y : S), x * (x * y) = y ∧ y * x * x = y) (x y : S) (h₃ h₅ h₆ h₈ : x * y * (x * y * y) = y) (h₁₁ : x * y * y * y = x * y * y * y) (h₁₄ : x * y * y = x) : x * y * y * y = x * y := by
  have h₁₆ := h (x * y) y
  have h₁₇ := h y (x * y)
  have h₁₈ := h x y
  have h₁₉ := h y x
  simp_all [mul_assoc] <;> (try ring_nf at *) <;> (try simp_all [mul_assoc]) <;> (try omega)
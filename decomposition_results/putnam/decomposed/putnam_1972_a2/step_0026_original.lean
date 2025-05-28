theorem h₅₁₁ (S : Type u_3) (x✝ : Mul S) (h : ∀ (x y : S), x * (x * y) = y ∧ y * x * x = y) (x y : S) (h₂ : x * y * x = y) (h₃ : y * x * x = y) (h₄ : x * y * x = y * x * x) (h₅₁ : x * y * x * x = y * x * x * x) (h₅₂ : x * y * x * x = x * y) (a b : S) (h₅₁₀ : b * a * a = b) : a * b * b = a := by
  have h₅₁₂ := h (a * b) b
  have h₅₁₃ := h b (a * b)
  have h₅₁₄ := h a b
  have h₅₁₅ := h b a
  simp_all [mul_assoc] <;> (try contradiction) <;> (try ring_nf at *) <;> (try simp_all [mul_assoc]) <;> (try omega)
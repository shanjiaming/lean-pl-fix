theorem h3 (S : Type u_1) (inst✝ : Mul S) (hS : ∀ (a b : S), a * b * a = b) (h1 : ∀ (a b : S), b * (a * b) = a) (a b : S) : a * (b * a) = b := by
  have h4 := h1 b a
  have h5 := hS a b
  have h6 := hS b a
  have h7 := hS (a * b) a
  have h8 := hS a (a * b)
  have h9 := hS b (a * b)
  have h10 := hS (a * b) b
  have h11 := h1 a b
  have h12 := h1 b a
  have h13 := h1 (a * b) a
  have h14 := h1 a (a * b)
  have h15 := h1 b (a * b)
  have h16 := h1 (a * b) b
  simp [mul_assoc] at h4 h5 h6 h7 h8 h9 h10 h11 h12 h13 h14 h15 h16 ⊢ <;> aesop
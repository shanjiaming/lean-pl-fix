theorem h6 (S : Type u_1) (inst✝ : Mul S) (hS : ∀ (a b : S), a * b * a = b) (a b : S) (h2 : a * b * a = b) (h3 : a * b * a * (a * b) = b * (a * b)) (h5 : a * b * (a * b) * (a * b) = a * b) : a * b * (a * b * (a * b)) = a * b :=
  by
  have h7 := hS (a * b) (a * b)
  have h8 := hS ((a * b) * (a * b)) (a * b)
  have h9 := hS (a * b) ((a * b) * (a * b))
  simp [h7, h8, h9] at h5 h7 h8 h9 ⊢ <;> aesop
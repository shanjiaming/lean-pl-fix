theorem h_f_ne_zero (F : Type u_1) (inst✝ : Field F) (f : F[X]) (hf : f.degree > 0) : f ≠ 0 := by
  intro h
  have h₁ := h
  rw [h] at hf
  norm_num at hf <;> simp_all [Polynomial.degree_zero] <;> contradiction
  hole
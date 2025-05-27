theorem h₁ (F : Type u_1) (inst✝ : Field F) (f : F[X]) (hf : f.degree > 0) (h_f_ne_zero : f ≠ 0) (h : IsUnit f) : f.degree ≤ 0 := by
  have h₂ : f ≠ 0 := h_f_ne_zero
  have h₃ : IsUnit f := h
  rw [Polynomial.degree_eq_natDegree h₂]
  have h₄ : (natDegree f : WithBot ℕ) = 0 := by sorry
  rw [h₄] <;> simp
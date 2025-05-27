theorem h₄ (F : Type u_1) (inst✝ : Field F) (f : F[X]) (hf : f.degree > 0) (h_f_ne_zero : f ≠ 0) (h : IsUnit f) (h₂ : f ≠ 0) (h₃ : IsUnit f) : ↑f.natDegree = 0 :=
  by
  apply Polynomial.eq_C_of_natDegree_eq_zero
  exact?
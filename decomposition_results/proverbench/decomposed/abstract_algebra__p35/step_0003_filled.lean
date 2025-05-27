theorem h₂ (R : Type u_1) (inst✝¹ : Field R) (inst✝ : CharZero R) (P : R[X]) (n : ℕ) (hP : P.degree = ↑n) (hValues : ∀ i ∈ Finset.range (n + 2), eval (↑i + 1) P = 1 / (↑i + 1)) : P.natDegree = n := by
  rw [Polynomial.natDegree_eq_of_degree_eq_some] <;> simp_all [Polynomial.degree_eq_natDegree] <;> norm_cast
  hole
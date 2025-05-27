theorem h₄ (R : Type u_1) (inst✝¹ : Field R) (inst✝ : CharZero R) (P : R[X]) (n : ℕ) (hP : P.degree = ↑n) (hValues : ∀ i ∈ Finset.range (n + 2), eval (↑i + 1) P = 1 / (↑i + 1)) (h₂ : P.natDegree = n) (i : ℕ) (hi : i < n + 2) : i ∈ Finset.range (n + 2) := by
  rw [Finset.mem_range]
  exact hi
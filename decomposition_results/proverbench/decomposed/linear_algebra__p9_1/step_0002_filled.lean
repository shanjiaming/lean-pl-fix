theorem h_main (n : ℕ) (K : Type u_1) (inst✝ : Field K) (f : (Fin n → K) → K) (hf : IsQuadraticForm f) : ∃ B, B.IsSymm ∧ ∀ (x : Fin n → K), f x = Matrix.dotProduct x (B.mulVec x) :=
  by
  obtain ⟨A, hA_symm, hA_eq⟩ := hf
  refine' ⟨A, hA_symm, _⟩
  intro x
  rw [hA_eq x]
  hole
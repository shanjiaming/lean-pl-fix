theorem symmetric_matrix_representation (f : (Fin n → K) → K) (hf : IsQuadraticForm f) :
∃ (B : Matrix (Fin n) (Fin n) K), B.IsSymm ∧ ∀ x, f x = (Matrix.dotProduct x (B.mulVec x)) := by
  have h_main : ∃ (B : Matrix (Fin n) (Fin n) K), B.IsSymm ∧ ∀ x, f x = (Matrix.dotProduct x (B.mulVec x)) := by
    obtain ⟨A, hA_symm, hA_eq⟩ := hf
    refine' ⟨A, hA_symm, _⟩
    intro x
    rw [hA_eq x]
  exact h_main
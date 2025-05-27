theorem quadratic_form_iff (n : ℕ) (K : Type u_1) (inst✝ : Field K) (f : (Fin n → K) → K) : IsQuadraticForm f ↔ ∃ A, A.IsSymm ∧ ∀ (x : Fin n → K), f x = Matrix.dotProduct x (A.mulVec x) :=
  by
  have h_iff :
    IsQuadraticForm f ↔ ∃ (A : Matrix (Fin n) (Fin n) K), A.IsSymm ∧ ∀ x, f x = (Matrix.dotProduct x (A.mulVec x)) := by sorry
  exact h_iff
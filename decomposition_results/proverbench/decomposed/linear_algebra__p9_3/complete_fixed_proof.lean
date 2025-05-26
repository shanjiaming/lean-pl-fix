theorem quadratic_form_iff (f : (Fin n → K) → K) :
  IsQuadraticForm f ↔ ∃ (A : Matrix (Fin n) (Fin n) K), A.IsSymm ∧ ∀ x, f x = (Matrix.dotProduct x (A.mulVec x)):=
  by
  have h_iff :
    IsQuadraticForm f ↔ ∃ (A : Matrix (Fin n) (Fin n) K), A.IsSymm ∧ ∀ x, f x = (Matrix.dotProduct x (A.mulVec x)) := by sorry
  exact h_iff
  hole
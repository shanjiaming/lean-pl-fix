theorem quadratic_form_iff (f : (Fin n → K) → K) :
IsQuadraticForm f ↔ ∃ (A : Matrix (Fin n) (Fin n) K), A.IsSymm ∧ ∀ x, f x = (Matrix.dotProduct x (A.mulVec x)) := by
  have h_iff : IsQuadraticForm f ↔ ∃ (A : Matrix (Fin n) (Fin n) K), A.IsSymm ∧ ∀ x, f x = (Matrix.dotProduct x (A.mulVec x)) := by
    constructor
    · -- Prove the forward direction: IsQuadraticForm f → ∃ A, A.IsSymm ∧ ∀ x, f x = xᵀ A x
      intro h
      -- By the definition of IsQuadraticForm, h directly gives us the desired statement.
      exact h
    · -- Prove the backward direction: (∃ A, A.IsSymm ∧ ∀ x, f x = xᵀ A x) → IsQuadraticForm f
      intro h
      -- By the definition of IsQuadraticForm, h directly gives us IsQuadraticForm f.
      exact h
  
  -- The final result is the same as the intermediate result h_iff.
  exact h_iff
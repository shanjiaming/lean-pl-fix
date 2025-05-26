theorem quadratic_form_iff (f : (Fin sorry → sorry) → sorry) : sorry ↔ ∃ A, A.IsSymm ∧ ∀ (x : Fin sorry → sorry), f x = sorry :=
  by
  have h_iff :
    IsQuadraticForm f ↔ ∃ (A : Matrix (Fin n) (Fin n) K), A.IsSymm ∧ ∀ x, f x = (Matrix.dotProduct x (A.mulVec x)) := by sorry
  exact h_iff
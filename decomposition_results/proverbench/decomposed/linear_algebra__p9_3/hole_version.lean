macro "hole_2" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem quadratic_form_iff (f : (Fin n → K) → K) :
IsQuadraticForm f ↔ ∃ (A : Matrix (Fin n) (Fin n) K), A.IsSymm ∧ ∀ x, f x = (Matrix.dotProduct x (A.mulVec x)) := by
  have h_iff : IsQuadraticForm f ↔ ∃ (A : Matrix (Fin n) (Fin n) K), A.IsSymm ∧ ∀ x, f x = (Matrix.dotProduct x (A.mulVec x)) := by
    hole_2
  
  
  hole_1
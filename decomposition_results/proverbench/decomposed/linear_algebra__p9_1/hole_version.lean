macro "hole_2" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem symmetric_matrix_representation (f : (Fin n → K) → K) (hf : IsQuadraticForm f) :
∃ (B : Matrix (Fin n) (Fin n) K), B.IsSymm ∧ ∀ x, f x = (Matrix.dotProduct x (B.mulVec x)) := by
  have h_main : ∃ (B : Matrix (Fin n) (Fin n) K), B.IsSymm ∧ ∀ x, f x = (Matrix.dotProduct x (B.mulVec x)) := by
    hole_2
  hole_1
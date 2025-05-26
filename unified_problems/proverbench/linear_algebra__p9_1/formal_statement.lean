/-- For any quadratic form `f`, there exists a symmetric matrix `B` such that `f(x) = x^T B x`. -/
lemma symmetric_matrix_representation (f : (Fin n → K) → K) (hf : IsQuadraticForm f) :
∃ (B : Matrix (Fin n) (Fin n) K), B.IsSymm ∧ ∀ x, f x = (Matrix.dotProduct x (B.mulVec x)) :=
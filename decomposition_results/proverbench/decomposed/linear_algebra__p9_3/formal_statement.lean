/-- A function `f : K^n → K` is a quadratic form if and only if there exists a symmetric matrix `A` such that `f(x) = x^T A x` for all `x ∈ K^n`. -/
theorem quadratic_form_iff (f : (Fin n → K) → K) :
IsQuadraticForm f ↔ ∃ (A : Matrix (Fin n) (Fin n) K), A.IsSymm ∧ ∀ x, f x = (Matrix.dotProduct x (A.mulVec x)) :=
/-- If a function `f` can be represented as `f(x) = x^T A x` for some symmetric matrix `A`, then `f` is a quadratic form. -/
lemma quadratic_form_verification (f : (Fin n → K) → K) (A : Matrix (Fin n) (Fin n) K) (hA : A.IsSymm)
(hf : ∀ x, f x = (Matrix.dotProduct x (A.mulVec x))) : IsQuadraticForm f :=
theorem h_iff (n : ℕ) (K : Type u_1) (inst✝ : Field K) (f : (Fin n → K) → K) : IsQuadraticForm f ↔ ∃ A, A.IsSymm ∧ ∀ (x : Fin n → K), f x = Matrix.dotProduct x (A.mulVec x) :=
  by
  constructor
  · intro h
    exact h
  · intro h
    exact h
  hole
theorem h_iff (f : (Fin sorry → sorry) → sorry) : sorry ↔ ∃ A, A.IsSymm ∧ ∀ (x : Fin sorry → sorry), f x = sorry :=
  by
  constructor
  · intro h
    exact h
  · intro h
    exact h
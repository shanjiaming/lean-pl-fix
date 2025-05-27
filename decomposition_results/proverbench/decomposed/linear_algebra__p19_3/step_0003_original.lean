theorem h_backward (m n p : Type) (inst✝³ : Fintype m) (inst✝² : Fintype n) (inst✝¹ : Fintype p) (R : Type) (inst✝ : CommRing R) (A : Matrix m n R) (B : Matrix m p R) (h_forward : (∃ X, A * X = B) → A.rank = (A.fromColumns B).rank) : A.rank = (A.fromColumns B).rank → ∃ X, A * X = B :=
  by
  intro h
  apply solutionExistsIfRankCondition A B h
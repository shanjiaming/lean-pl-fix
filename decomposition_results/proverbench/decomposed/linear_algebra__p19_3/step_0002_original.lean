theorem h_forward (m n p : Type) (inst✝³ : Fintype m) (inst✝² : Fintype n) (inst✝¹ : Fintype p) (R : Type) (inst✝ : CommRing R) (A : Matrix m n R) (B : Matrix m p R) : (∃ X, A * X = B) → A.rank = (A.fromColumns B).rank :=
  by
  intro h
  apply rankConditionIfSolutionExists A B h
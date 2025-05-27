theorem matrixEquationSolutionIff (m n p : Type) (inst✝³ : Fintype m) (inst✝² : Fintype n) (inst✝¹ : Fintype p) (R : Type) (inst✝ : CommRing R) (A : Matrix m n R) (B : Matrix m p R) : (∃ X, A * X = B) ↔ A.rank = (A.fromColumns B).rank :=
  by
  have h_forward : (∃ X : Matrix n p R, A * X = B) → rank A = rank (fromColumns A B) := by sorry
  have h_backward : rank A = rank (fromColumns A B) → (∃ X : Matrix n p R, A * X = B) := by sorry
  apply Iff.intro
  · exact h_forward
  · exact h_backward
  hole
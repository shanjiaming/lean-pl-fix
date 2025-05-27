theorem rankConditionIfSolutionExists (m n p : Type) (inst✝³ : Fintype m) (inst✝² : Fintype n) (inst✝¹ : Fintype p) (R : Type) (inst✝ : CommRing R) (A : Matrix m n R) (B : Matrix m p R) : (∃ X, A * X = B) → A.rank = (A.fromColumns B).rank :=
  by
  intro h
  have h₁ : ∃ (X : Matrix n p R), A * X = B := h
  have h₂ :
    LinearMap.range (Matrix.toLin (Pi.basisFun R n) (Pi.basisFun R m) A) =
      LinearMap.range (Matrix.toLin (Pi.basisFun R (Sum n p)) (Pi.basisFun R m) (fromColumns A B)) := by sorry
  have h₃ : rank A = rank (fromColumns A B) := by sorry
  exact h₃
  hole
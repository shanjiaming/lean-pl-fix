theorem solutionExistsIfRankCondition (m n p : Type) (inst✝³ : Fintype m) (inst✝² : Fintype n) (inst✝¹ : Fintype p) (R : Type) (inst✝ : CommRing R) (A : Matrix m n R) (B : Matrix m p R) : A.rank = (A.fromColumns B).rank → ∃ X, A * X = B :=
  by
  intro h
  have h₁ : (∃ (X : Matrix n p R), A * X = B) ∨ ¬(∃ (X : Matrix n p R), A * X = B) := by sorry
  have h₂ : ∃ (X : Matrix n p R), A * X = B := by sorry
  exact h₂
theorem h₁ (m n p : Type) (inst✝³ : Fintype m) (inst✝² : Fintype n) (inst✝¹ : Fintype p) (R : Type) (inst✝ : CommRing R) (A : Matrix m n R) (B : Matrix m p R) (h : A.rank = (A.fromColumns B).rank) : (∃ X, A * X = B) ∨ ¬∃ X, A * X = B :=
  by
  by_cases h' : ∃ (X : Matrix n p R), A * X = B
  · exact Or.inl h'
  · exact Or.inr h'
  hole
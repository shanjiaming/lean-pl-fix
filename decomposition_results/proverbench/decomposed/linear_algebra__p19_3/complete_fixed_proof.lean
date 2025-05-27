theorem matrixEquationSolutionIff (A : Matrix m n R) (B : Matrix m p R) :
  (∃ X : Matrix n p R, A * X = B) ↔ rank A = rank (fromColumns A B):=
  by
  have h_forward : (∃ X : Matrix n p R, A * X = B) → rank A = rank (fromColumns A B):=
    by
    intro h
    apply rankConditionIfSolutionExists A B h
    hole
  have h_backward : rank A = rank (fromColumns A B) → (∃ X : Matrix n p R, A * X = B):=
    by
    intro h
    apply solutionExistsIfRankCondition A B h
    hole
  apply Iff.intro
  · exact h_forward
  · exact h_backward
  hole
theorem matrixEquationSolutionIff (A : Matrix m n R) (B : Matrix m p R) :
(∃ X : Matrix n p R, A * X = B) ↔ rank A = rank (fromColumns A B) := by
  have h_forward : (∃ X : Matrix n p R, A * X = B) → rank A = rank (fromColumns A B) := by
    intro h
    -- Use the given axiom to prove the forward direction
    apply rankConditionIfSolutionExists A B h
  
  have h_backward : rank A = rank (fromColumns A B) → (∃ X : Matrix n p R, A * X = B) := by
    intro h
    -- Use the given axiom to prove the backward direction
    apply solutionExistsIfRankCondition A B h
  
  apply Iff.intro
  · -- Prove the forward direction of the equivalence
    exact h_forward
  · -- Prove the backward direction of the equivalence
    exact h_backward
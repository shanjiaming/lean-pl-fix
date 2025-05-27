lemma solutionExistsIfRankCondition (A : Matrix m n R) (B : Matrix m p R) :
rank A = rank (fromColumns A B) → ∃ X : Matrix n p R, A * X = B :=
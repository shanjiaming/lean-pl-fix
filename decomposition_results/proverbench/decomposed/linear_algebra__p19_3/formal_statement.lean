theorem matrixEquationSolutionIff (A : Matrix m n R) (B : Matrix m p R) :
(∃ X : Matrix n p R, A * X = B) ↔ rank A = rank (fromColumns A B) :=
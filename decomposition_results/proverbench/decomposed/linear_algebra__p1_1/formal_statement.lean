/-- Helper lemma: The determinant of a matrix with a row replaced by the sum of two vectors
    equals the sum of determinants of matrices with each vector replacing that row. -/
lemma row_decomposition (A A' : Matrix (Fin n) (Fin n) R) (i : Fin n) :
  D1 A A' i = D2 A + D3 A A' i :=
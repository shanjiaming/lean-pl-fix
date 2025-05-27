/-- If rank(A) = n for an m × n matrix A, then the columns of A are linearly independent. -/
theorem rank_eq_card_implies_column_full_rank (A : Matrix m n K) :
Matrix.rank A = Fintype.card n → column_full_rank A :=
/-- If the columns of an m × n matrix A are linearly independent, then rank(A) = n. -/
theorem column_full_rank_implies_rank_eq_card (A : Matrix m n K) :
column_full_rank A → Matrix.rank A = Fintype.card n :=
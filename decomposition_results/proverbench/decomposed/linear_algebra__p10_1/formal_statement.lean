/-- An m × n matrix A is a column full rank matrix if and only if rank(A) = n. -/
theorem column_full_rank_iff_rank_eq_card :
∀ (A : Matrix m n K), column_full_rank A ↔ Matrix.rank A = Fintype.card n :=
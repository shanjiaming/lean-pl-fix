/-- If there exist two distinct rows (or columns) `i` and `j` of an `n × n` matrix `A`,
    and a non-zero scalar `k` such that `a_{i,m} = k a_{j,m}` (or `a_{m,i} = k a_{m,j}`)
    for all `m`, then `det(A) = 0`. -/
lemma determinant_zero_if_rows_or_columns_scalar_multiples :
  ∀ (A : Matrix n n R) (i j : n) (k : R), k ≠ 0 →
  (linearly_dependent_rows A i j k) ∨ (linearly_dependent_columns A i j k) → det A = 0 :=
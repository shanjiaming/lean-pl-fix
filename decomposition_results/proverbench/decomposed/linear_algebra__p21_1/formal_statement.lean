/-- If two rows or two columns are linearly dependent, then the determinant is zero. -/
theorem determinant_zero_if_linearly_dependent (A : Matrix n n R) (i j : n) (k : R) (h : k ≠ 0) :
  (linearly_dependent_rows A i j k) ∨ (linearly_dependent_columns A i j k) → det A = 0 :=
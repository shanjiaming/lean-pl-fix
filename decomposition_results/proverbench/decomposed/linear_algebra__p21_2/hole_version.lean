macro "hole_2" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem determinant_zero_if_rows_or_columns_scalar_multiples :
  ∀ (A : Matrix n n R) (i j : n) (k : R), k ≠ 0 →
  (linearly_dependent_rows A i j k) ∨ (linearly_dependent_columns A i j k) → det A = 0 := by
  intro A i j k hk h
  have h_main : det A = 0 := by
    hole_2
  hole_1
theorem determinant_zero_if_rows_or_columns_scalar_multiples (n : Type) (inst✝² : Fintype n) (inst✝¹ : DecidableEq n) (R : Type) (inst✝ : CommRing R) : ∀ (A : Matrix n n R) (i j : n) (k : R),
    k ≠ 0 → linearly_dependent_rows A i j k ∨ linearly_dependent_columns A i j k → A.det = 0 :=
  by
  intro A i j k hk h
  have h_main : det A = 0 := by sorry
  exact h_main
  hole
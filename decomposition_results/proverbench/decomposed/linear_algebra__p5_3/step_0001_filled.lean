theorem det_interchange_rows_or_columns (n : Type u_1) (inst✝² : Fintype n) (inst✝¹ : DecidableEq n) (R : Type u_2) (inst✝ : CommRing R) (A : Matrix n n R) (i j : n) (h : i ≠ j) : (swapRows A i j).det = -A.det ∧ (swapColumns A i j).det = -A.det :=
  by
  have h₁ : det (swapRows A i j) = -det A := by sorry
  have h₂ : det (swapColumns A i j) = -det A := by sorry
  have h₃ : det (swapRows A i j) = -det A ∧ det (swapColumns A i j) = -det A := by sorry
  exact h₃
  hole
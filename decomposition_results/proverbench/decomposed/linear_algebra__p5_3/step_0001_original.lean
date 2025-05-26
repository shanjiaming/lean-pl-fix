theorem det_interchange_rows_or_columns (R : Type u_1) (inst✝ : CommRing R) (A : Matrix sorry sorry R) (i : sorry) (j : sorry) (h : i ≠ j) : sorry = -sorry ∧ sorry = -sorry :=
  by
  have h₁ : det (swapRows A i j) = -det A := by sorry
  have h₂ : det (swapColumns A i j) = -det A := by sorry
  have h₃ : det (swapRows A i j) = -det A ∧ det (swapColumns A i j) = -det A := by sorry
  exact h₃
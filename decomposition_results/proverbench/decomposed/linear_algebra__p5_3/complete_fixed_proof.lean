theorem det_interchange_rows_or_columns {R : Type*} [CommRing R] (A : Matrix n n R) (i j : n) (h : i ≠ j) :
  det (swapRows A i j) = -det A ∧ det (swapColumns A i j) = -det A:=
  by
  have h₁ : det (swapRows A i j) = -det A:= by apply det_row_interchange <;> assumption
    hole
  have h₂ : det (swapColumns A i j) = -det A:= by apply det_column_interchange <;> assumption
    hole
  have h₃ : det (swapRows A i j) = -det A ∧ det (swapColumns A i j) = -det A:= by exact ⟨h₁, h₂⟩
    hole
  exact h₃
  hole
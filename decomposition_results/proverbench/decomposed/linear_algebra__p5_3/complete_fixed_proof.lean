theorem det_interchange_rows_or_columns {R : Type*} [CommRing R] (A : Matrix n n R) (i j : n) (h : i ≠ j) :
  det (swapRows A i j) = -det A ∧ det (swapColumns A i j) = -det A := by
  have h₁ : det (swapRows A i j) = -det A := by
    admit
  
  have h₂ : det (swapColumns A i j) = -det A := by
    admit
  
  have h₃ : det (swapRows A i j) = -det A ∧ det (swapColumns A i j) = -det A := by
    admit
  
  admit
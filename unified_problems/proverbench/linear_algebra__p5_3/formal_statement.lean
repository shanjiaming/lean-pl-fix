theorem det_interchange_rows_or_columns {R : Type*} [CommRing R] (A : Matrix n n R) (i j : n) (h : i ≠ j) :
  det (swapRows A i j) = -det A ∧ det (swapColumns A i j) = -det A :=
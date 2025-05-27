theorem det_column_interchange {R : Type*} [CommRing R] (A : Matrix n n R) (i j : n) (h : i ≠ j) :
  det (swapColumns A i j) = -det A :=
theorem det_row_interchange {R : Type*} [CommRing R] (A : Matrix n n R) (i j : n) (h : i ≠ j) :
  det (swapRows A i j) = -det A :=
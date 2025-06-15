theorem det_row_interchange {R : Type*} [CommRing R] (A : Matrix n n R) (i j : n) (h : i ≠ j) :
  det (swapRows A i j) = -det A := by
  have h₁ : False := by sorry
  have h₂ : det (swapRows A i j) = -det A := by sorry
  sorry
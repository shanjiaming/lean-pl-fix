macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_4" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem det_interchange_rows_or_columns {R : Type*} [CommRing R] (A : Matrix n n R) (i j : n) (h : i ≠ j) :
  det (swapRows A i j) = -det A ∧ det (swapColumns A i j) = -det A := by
  have h₁ : det (swapRows A i j) = -det A := by
    hole_2
  
  have h₂ : det (swapColumns A i j) = -det A := by
    hole_3
  
  have h₃ : det (swapRows A i j) = -det A ∧ det (swapColumns A i j) = -det A := by
    hole_4
  
  hole_1
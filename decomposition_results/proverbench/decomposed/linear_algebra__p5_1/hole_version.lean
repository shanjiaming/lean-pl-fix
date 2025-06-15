macro "hole_2" : tactic => `(tactic| admit)
macro "hole_3" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)

theorem det_row_interchange {R : Type*} [CommRing R] (A : Matrix n n R) (i j : n) (h : i ≠ j) :
  det (swapRows A i j) = -det A := by
  have h₁ : False := by hole_2
  have h₂ : det (swapRows A i j) = -det A := by hole_3
  hole_1
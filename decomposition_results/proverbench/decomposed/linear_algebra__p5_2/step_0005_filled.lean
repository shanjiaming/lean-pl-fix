theorem h₃ (n : Type u_1) (inst✝² : Fintype n) (inst✝¹ : DecidableEq n) (R : Type u_2) (inst✝ : CommRing R) (A : Matrix n n R) (i j : n) (h : i ≠ j) (h₁ : swapColumns A i j = (swapRows Aᵀ i j)ᵀ) (h₂ : (swapColumns A i j).det = (swapRows Aᵀ i j).det) : (swapRows Aᵀ i j).det = -Aᵀ.det := by
  apply det_row_interchange
  exact h
  hole
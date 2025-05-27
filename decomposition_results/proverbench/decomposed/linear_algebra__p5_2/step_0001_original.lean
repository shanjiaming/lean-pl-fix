theorem det_column_interchange (n : Type u_1) (inst✝² : Fintype n) (inst✝¹ : DecidableEq n) (R : Type u_2) (inst✝ : CommRing R) (A : Matrix n n R) (i j : n) (h : i ≠ j) : (swapColumns A i j).det = -A.det :=
  by
  have h₁ : swapColumns A i j = (swapRows Aᵀ i j)ᵀ := by sorry
  have h₂ : det (swapColumns A i j) = det (swapRows Aᵀ i j) := by sorry
  have h₃ : det (swapRows Aᵀ i j) = -det Aᵀ := by sorry
  have h₄ : det (swapColumns A i j) = -det A := by sorry
  exact h₄
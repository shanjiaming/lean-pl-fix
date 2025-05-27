theorem h₂ (n : Type u_1) (inst✝² : Fintype n) (inst✝¹ : DecidableEq n) (R : Type u_2) (inst✝ : CommRing R) (A : Matrix n n R) (i j : n) (h : i ≠ j) (h₁ : swapColumns A i j = (swapRows Aᵀ i j)ᵀ) : (swapColumns A i j).det = (swapRows Aᵀ i j).det :=
  by
  rw [h₁]
  rw [det_transpose] <;> simp [swapRows, swapColumns, Matrix.transpose_apply] <;> aesop
  hole
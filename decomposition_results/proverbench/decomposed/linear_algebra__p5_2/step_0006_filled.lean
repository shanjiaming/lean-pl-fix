theorem h₄ (n : Type u_1) (inst✝² : Fintype n) (inst✝¹ : DecidableEq n) (R : Type u_2) (inst✝ : CommRing R) (A : Matrix n n R) (i j : n) (h : i ≠ j) (h₁ : swapColumns A i j = (swapRows Aᵀ i j)ᵀ) (h₂ : (swapColumns A i j).det = (swapRows Aᵀ i j).det) (h₃ : (swapRows Aᵀ i j).det = -Aᵀ.det) : (swapColumns A i j).det = -A.det := by
  rw [h₂]
  rw [h₃]
  rw [Matrix.det_transpose] <;> simp [Matrix.det_transpose] <;> ring
  hole
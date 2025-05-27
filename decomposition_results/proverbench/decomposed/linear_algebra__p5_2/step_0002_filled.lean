theorem h₁ (n : Type u_1) (inst✝² : Fintype n) (inst✝¹ : DecidableEq n) (R : Type u_2) (inst✝ : CommRing R) (A : Matrix n n R) (i j : n) (h : i ≠ j) : swapColumns A i j = (swapRows Aᵀ i j)ᵀ := by
  ext k l
  simp [swapColumns, swapRows, Matrix.transpose_apply] <;> split_ifs <;>
      simp_all [Matrix.transpose_apply, Matrix.mul_apply, Fin.sum_univ_succ, Fin.val_zero] <;>
    aesop
  hole
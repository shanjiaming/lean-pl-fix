theorem det_column_interchange {R : Type*} [CommRing R] (A : Matrix n n R) (i j : n) (h : i ≠ j) :
  det (swapColumns A i j) = -det A:=
  by
  have h₁ : swapColumns A i j = (swapRows Aᵀ i j)ᵀ:= by
    ext k l
    simp [swapColumns, swapRows, Matrix.transpose_apply] <;> split_ifs <;>
        simp_all [Matrix.transpose_apply, Matrix.mul_apply, Fin.sum_univ_succ, Fin.val_zero] <;>
      aesop
    hole
  have h₂ : det (swapColumns A i j) = det (swapRows Aᵀ i j):=
    by
    rw [h₁]
    rw [det_transpose] <;> simp [swapRows, swapColumns, Matrix.transpose_apply] <;> aesop
    hole
  have h₃ : det (swapRows Aᵀ i j) = -det Aᵀ:=
    by
    have h₃ : det (swapRows Aᵀ i j) = -det Aᵀ:= by
      apply det_row_interchange
      exact h
      hole
    rw [h₃] <;> simp [Matrix.det_transpose] <;> ring
    hole
  have h₄ : det (swapColumns A i j) = -det A:= by
    rw [h₂]
    rw [h₃]
    rw [Matrix.det_transpose] <;> simp [Matrix.det_transpose] <;> ring
    hole
  exact h₄
  hole
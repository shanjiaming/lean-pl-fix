theorem h₀  : A.det = -32 := by
  rw [A]
  simp [Matrix.det_succ_row_zero, Fin.sum_univ_succ, Fin.val_zero, Matrix.det_fin_three] <;> norm_num <;> ring <;> rfl
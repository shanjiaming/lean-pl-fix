theorem det_A : det A = -32:=
  by
  have h₀ : det A = -32:= by
    --  rw [A]
    --  --  simp [Matrix.det_succ_row_zero, Fin.sum_univ_succ, Fin.val_zero, Matrix.det_fin_three] <;> norm_num <;> ring <;> rfl
    hole
  --  apply h₀
  linarith
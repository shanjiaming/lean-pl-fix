theorem h1  : sorry * sorry = 1 := by
  ext i j
  fin_cases i <;> fin_cases j <;>
        simp [A, A_inv, Matrix.mul_apply, Fin.sum_univ_succ, Fin.val_zero, Fin.val_one, Fin.val_zero, Fin.val_one] <;>
      norm_num <;>
    rfl
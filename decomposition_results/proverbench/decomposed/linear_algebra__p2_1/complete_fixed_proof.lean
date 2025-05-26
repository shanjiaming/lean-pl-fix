theorem verify_inverse : A * A_inv = 1 ∧ A_inv * A = 1:=
  by
  have h1 : A * A_inv = 1:= by
    --  ext i j
    fin_cases i <;> fin_cases j <;>
          simp [A, A_inv, Matrix.mul_apply, Fin.sum_univ_succ, Fin.val_zero, Fin.val_one, Fin.val_zero, Fin.val_one] <;>
        norm_num <;>
      rfl
    hole
  have h2 : A_inv * A = 1:= by
    --  ext i j
    fin_cases i <;> fin_cases j <;>
          simp [A, A_inv, Matrix.mul_apply, Fin.sum_univ_succ, Fin.val_zero, Fin.val_one, Fin.val_zero, Fin.val_one] <;>
        norm_num <;>
      rfl
    hole
  have h3 : A * A_inv = 1 ∧ A_inv * A = 1:= by -- exact ⟨h1, h2⟩
    hole
  --  exact h3
  hole
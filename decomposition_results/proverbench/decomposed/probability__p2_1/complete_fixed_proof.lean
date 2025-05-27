theorem A_squared : A * A = ![![0.6, 0.4, 0.2], ![0.2, 0.2, 0.15], ![0.2, 0.4, 0.65]]:=
  by
  have h₁ : A * A = ![![0.6, 0.4, 0.2], ![0.2, 0.2, 0.15], ![0.2, 0.4, 0.65]]:=
    by
    --  ext i j
    --  --  fin_cases i <;> fin_cases j <;>
    --        simp [A, Matrix.mul_apply, Fin.sum_univ_succ, Fin.val_zero, Fin.val_one, Fin.val_two] <;>
    --      norm_num <;>
      rfl
    hole
  --  exact h₁
  simpa
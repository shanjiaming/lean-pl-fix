theorem det_A_sq : det (A * A) = (det A) ^ 2:=
  by
  have h_main : det (A * A) = det A * det A:= by
    --  rw [Matrix.det_mul] <;> simp [Matrix.det_fin_two] <;> ring <;> simp_all [Matrix.mul_apply, Fin.sum_univ_succ] <;>
          ring <;>
        simp_all [Matrix.mul_apply, Fin.sum_univ_succ] <;>
      ring
    hole
  have h_final : det (A * A) = (det A) ^ 2:= by -- -- rw [h_main] <;> ring
    linarith
  --  exact h_final
  linarith
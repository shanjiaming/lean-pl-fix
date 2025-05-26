theorem h_main  : sorry = 0.18 :=
  by
  have h₁ : A * (A * (A * X0)) = ![![0.38], ![0.18], ![0.44]] := by sorry
  rw [h₁] <;> norm_num [Matrix.dotProduct, Matrix.mul_apply, Fin.sum_univ_succ, A, X0] <;> rfl